class User
  include Mongoid::Document
  field :name, type: String
  field :events, type: String
  has_and_belongs_to_many :activities
end
