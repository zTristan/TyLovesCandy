class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include ActiveModel::SecurePassword

  has_many :uploads
  has_many :candies

  field :name
  field :email
  field :password_digest
  has_secure_password

  field :candy_count, type: Integer, default: 0

  has_mongoid_attached_file :avatar, styles: {
    thumb: '100x100>'
  }, :default_style => :thumb

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  def email= email
    write_attribute(:email, email.downcase)
  end

  def update_candies

    total_candies = 0

    total_candies += self.uploads.collect { |u| u.candy_count }.sum

    self.set(:candy_count, total_candies)
  end

end
