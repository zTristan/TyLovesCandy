class Photo < Upload

  has_attached_file :upload, styles: {
    :thumb    => ['100x100>',   :jpg],
    :square   => ['200x200#',   :jpg],
    :original => ['1920x1680>', :jpg],
    :small    => ['100x100#',   :jpg],
    :medium   => ['250x250',    :jpg],
    :large    => ['500x500>',   :jpg]
  }

  validates_attachment_presence :upload
  validates_attachment_content_type :upload, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  def thumbnail_url
    self.upload.url(:square)
  end

end
