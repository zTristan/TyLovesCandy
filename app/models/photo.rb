class Photo
  include MongoMapper::Document
  include Paperclip::Glue

  key :title, String
  key :image_file_name, String

  attr_accessor :image_content_type, :image_file_size
  has_attached_file :image, styles: {
    :thumb    => ['100x100>',   :jpg],
    :square   => ['200x200#',   :jpg],
    :original => ['1920x1680>', :jpg],
    :small    => ['100x100#',   :jpg],
    :medium   => ['250x250',    :jpg],
    :large    => ['500x500>',   :jpg]
  }, :default_style => :thumb

  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
