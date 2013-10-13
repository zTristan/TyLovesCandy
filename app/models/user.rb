class User
  include MongoMapper::Document
  include Paperclip::Glue
  include ActiveModel::SecurePassword

  has_many :uploads

  key :name, String
  key :email, String
  key :password_digest, String
  attr_accessible :password, :password_confirmation
  has_secure_password

  attr_accessor :avatar_content_type, :avatar_file_size
  attr_accessible :avatar
  has_attached_file :avatar, styles: {
    thumb: '100x100>'
  }, :default_style => :thumb

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  validates_presence_of :password, :on => :create
end
