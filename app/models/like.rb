class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, dependent:   :destroy
end
