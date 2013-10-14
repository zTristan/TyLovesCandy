class Video < Upload

  validates_attachment_presence :upload
  validates_attachment_content_type :upload, :content_type => ['video/x-msvideo','video/avi','video/quicktime','video/3gpp','video/x-ms-wmv','video/mp4','video/mpeg','video/x-flv']

  has_mongoid_attached_file :thumbnail, styles: {
    :square   => ['200x200#', :jpg]
  }

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
    self.thumbnail.url(:square)
  end

end  
