class Candy
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :upload

  after_create :update_upload_candies, :update_user_candies

  def update_user_candies
    self.user.update_candies
  end

  def update_upload_candies
    self.upload.update_candies
  end

end
