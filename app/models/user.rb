class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :followers, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followeds, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy


  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, presence:true

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def follow_to?(user)
    followers.exists?(followed_id: user.id)
  end
end
