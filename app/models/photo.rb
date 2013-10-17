class Photo < Upload

  has_attached_file :upload, styles: {
    :thumb    => ['100x100>',   :jpg],
    :square   => ['200x200#',   :jpg],
    :original => ['1920x1680>', :jpg]
  }

 # validates_attachment_presence :upload
  validates_attachment_content_type :upload, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  def thumbnail_url
    self.upload.url(:square)
  end

  def update_candies
    self.set(:candy_count, self.candies.count + 1)
  end

end
