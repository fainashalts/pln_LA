class Activity
  include Mongoid::Document
  field :name, type: String
  field :date, type: String
  field :location, type: String
  field :description, type: String
  has_and_belongs_to_many :user
end
