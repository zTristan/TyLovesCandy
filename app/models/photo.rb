class Photo < Upload

  attr_accessor :upload_content_type, :upload_file_name
  attr_accessible :upload
  has_attached_file :upload, styles: {
    :thumb    => ['100x100>',   :jpg],
    :square   => ['200x200#',   :jpg],
    :original => ['1920x1680>', :jpg],
    :small    => ['100x100#',   :jpg],
    :medium   => ['250x250',    :jpg],
    :large    => ['500x500>',   :jpg]
  }, :default_style => :thumb

  validates_attachment_presence :upload
  validates_attachment_content_type :upload, :content_type => ['image/jpeg', 'image/png']
end
