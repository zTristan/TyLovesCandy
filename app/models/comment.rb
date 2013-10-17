class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :content, type: String

  embedded_in :upload, :inverse_of => :comments
end