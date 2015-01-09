class Activity
  include Mongoid::Document
  field :name, type: String
  field :date, type: String
  field :location, type: String
  field :headline, type: String
  field :description, type: String

  mount_uploader :image, AvatarUploader

  has_and_belongs_to_many :users

  embeds_many :comments





end
