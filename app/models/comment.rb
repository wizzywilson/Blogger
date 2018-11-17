class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
    has_many :likes, as: :likeable
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: :parent_id
end
