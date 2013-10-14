class User
  include Mongoid::Document
  include Paperclip::Glue
  include ActiveModel::SecurePassword

  has_many :uploads

  field :name
  field :email
  field :password_digest
  has_secure_password

  attr_accessor :avatar_content_type
  attr_accessor :avatar_file_size
  attr_accessor :avatar
  has_attached_file :avatar, styles: {
    thumb: '100x100>'
  }, :default_style => :thumb

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  def email= email
    write_attribute(:email, email.downcase)
  end
end
