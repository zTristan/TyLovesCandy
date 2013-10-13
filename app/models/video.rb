class Video < Upload

  include AASM
  aasm do
    state :pending, :initial => true
    state :converting
    state :converted, :enter => :flv_to_paperclip
    state :error

    event :convert do
      transitions :from => :pending, :to => :converting
    end
    
    event :converted do
      transitions :from => :converting, :to => :converted
    end
    
    event :failed do
      transitions :from => :converting, :to => :error
    end
  end

  validates_attachment_presence :upload
  validates_attachment_content_type :upload, :content_type => ['video/x-msvideo','video/avi','video/quicktime','video/3gpp','video/x-ms-wmv','video/mp4','video/mpeg']

  key :flv_file_name, String
  key :flv_content_type, String
  attr_accessible :flv
  has_attached_file :flv
  validates_attachment_content_type :flv, :content_type => ['video/x-flv']

  key :thumbnail_file_name, String
  key :thumbnail_content_type, String
  attr_accessible :thumbnail
  has_attached_file :thumbnail

  def thumbnail_url
    if not self.thumbnail.exists? and self.upload

      thumb_file = "/tmp/thumb_#{self._id}.png"
      success = system("ffmpeg -i #{self.upload.url} -r 1 -t 00:00:01 -f image2 #{thumb_file}")

      if success && $?.exitstatus == 0
        self.thumbnail = File.open(thumb_file, 'r')
        if self.save
          FileUtils.rm_f(thumb_file)
        end
      end
    end
    self.thumbnail.url
  end

  # This method is called from the controller and takes care of the converting
  def convert
    self.convert!
    success = system(convert_command)
    if success && $?.exitstatus == 0
      self.converted!
    else
      self.failure!
    end
  end

  def local_flv_path
    "/tmp/#{id}.flv"
  end

  # This method creates the ffmpeg command that we'll be using
  def convert_command    
    command = <<-end_command
      ffmpeg -i #{ self.upload.url } -ar 22050 -ab 32k -acodec mp3 -s 480x320 -vcodec flv -r 25 -qscale 8 -f flv -y #{ self.local_flv_path }
    end_command

    # command = <<-end_command
    #   ffmpeg -i #{ self.upload.url } -s hd720 -c:v libx264 -crf 23 -c:a aac -strict -2 #{ self.local_flv_path }
    # end_command

    command.gsub!(/\s+/, " ")
  end

  # This update the stored filename with the new flash video file
  def flv_to_paperclip
    self.flv = File.new(self.local_flv_path, "r")
    if self.save
      FileUtils.rm_f(self.local_flv_path)
    end
  end

end  
