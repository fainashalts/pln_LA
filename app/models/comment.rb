class Comment
  include Mongoid::Document
  field :body, type: String

  embedded_in :activity

  # embeds_one :user
  # accepts_nested_attributes_for :user
end
