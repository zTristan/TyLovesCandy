class Upload
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :user
  belongs_to :category

  has_many :candies

  field :title
  field :description
  field :candy_count, type: Integer, default: 0
  has_mongoid_attached_file :upload

  before_create :default_title

  def default_title
    self.title ||= File.basename(self.upload_file_name).titleize if self.upload
  end

  def thumbnail_url
    self.upload.url
  end

  def update_candies
    self.set(:candy_count, self.candies.count)
  end

  def can_give_candy? user
    not self.candies.where( :user => user ).exists?
  end

end
