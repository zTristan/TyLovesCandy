class Upload
  include MongoMapper::Document
  include Paperclip::Glue

  belongs_to :user

  key :upload_file_name, String
  attr_accessible :upload
  has_attached_file :upload

  key :title, String
  key :description, String

  before_create :default_title

  def default_title
    self.title ||= File.basename(self.upload_file_name) if self.upload
  end

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url,
      "delete_url" => upload(self),
      "delete_type" => "DELETE"
    }
  end

end
