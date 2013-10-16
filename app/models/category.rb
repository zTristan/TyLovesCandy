class Category

  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :uploads

  field :name

end
