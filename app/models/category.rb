class Category

  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :photos
  has_many :videos

  CategoryBoth = 0
  CategoryPhoto = 1
  CategoryVideo = 2

  field :name
  field :description
  field :type, type: String, default: CategoryBoth

  def self.video_categories
    self.or({:type => CategoryBoth}, {:type => CategoryVideo})
  end

  def self.video_categories_edit
    self.video_categories.collect { |category| [category.id, "#{category.name}"] }
  end

  def self.photo_categories
    self.or({:type => CategoryBoth}, {:type => CategoryPhoto})
  end

  def self.photo_categories_edit
    self.photo_categories.collect { |category| [category.id, "#{category.name}"] }
  end

  def top_photo
    self.photos.desc(:candy_count).first
  end

  def top_video
    self.videos.desc(:candy_count).first
  end

end
