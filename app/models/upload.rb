class Upload
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :user

  field :title
  field :description
  has_mongoid_attached_file :upload

  before_create :default_title

  def default_title
    self.title ||= File.basename(self.upload_file_name).titleize if self.upload
  end

  def thumbnail_url
    self.upload.url
  end

end
