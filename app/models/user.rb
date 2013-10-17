class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include ActiveModel::SecurePassword

  has_many :uploads
  has_many :candies

  field :provider
  field :uid
  field :oauth_token
  field :oauth_expires_at, type: Time

  field :name
  field :email
  field :password_salt
  field :password_digest
  attr_accessor :password, :password_confirmation

  field :candy_count, type: Integer, default: 0

  has_mongoid_attached_file :avatar, styles: {
    thumb: '100x100>'
  }, :default_style => :thumb

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :password, length: (6..32), confirmation: true, if: :setting_password?
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.avatar = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
  end

  def email= email
    write_attribute(:email, email.downcase)
  end

  def update_candies

    total_candies = 0
    total_candies += self.uploads.collect { |u| u.candy_count + (u._type == "Video" ? 2 : 1) }.sum

    self.set(:candy_count, total_candies)
  end

  def password=(password_str)
    @password = password_str
    self.password_salt   = BCrypt::Engine.generate_salt
    self.password_digest = BCrypt::Engine.hash_secret(password_str, password_salt)
  end

  def authenticate(password)
    password.present? && password_digest.present? && password_digest == BCrypt::Engine.hash_secret(password, password_salt)
  end

private

  def setting_password?
    self.password || self.password_confirmation
  end

end
