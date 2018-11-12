class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  self.per_page = 3
  has_many :microposts
  default_scope -> { order(created_at: :desc) }

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy

  has_many :following, through: active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy

 has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    following.push(other_user)
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
