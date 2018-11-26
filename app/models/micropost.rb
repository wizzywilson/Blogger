class Micropost < ApplicationRecord
  belongs_to :user
has_many :micropost_tags,dependent: :destroy
has_many :tags, through: :micropost_tags

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable,dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  self.per_page = 3
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validate  :picture_size

  private

   # Validates the size of an uploaded picture.
   def picture_size
     if picture.size > 5.megabytes
       errors.add(:picture, "should be less than 5MB")
     end
   end
end
