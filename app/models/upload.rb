class Upload
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :user
  belongs_to :category

  has_many :candies, dependent: :delete
  embeds_many :comments

  field :title
  field :description, default: ""
  field :candy_count, type: Integer, default: 0
  has_mongoid_attached_file :upload

  before_create :default_title, :default_category
  after_create :update_user_candies
  after_destroy :update_user_candies

  def default_title
    self.title ||= File.basename(self.upload_file_name).titleize if self.upload
  end

  def default_category
    self.category = Category.find_by(name: "Everything Else")
  end

  def thumbnail_url
    self.upload.url
  end

  def update_candies
    self.set(:candy_count, self.candies.count)
  end

  def can_give_candy? user
    user != self.user and not self.candies.where( :user => user ).exists?
  end

  def update_user_candies
    self.user.update_candies
  end

end
