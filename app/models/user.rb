class User < ApplicationRecord

    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one_attached :avatar


    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable

  def avatar_thumbnail
    if avatar.attached?
        # avatar.variant(resize: [64, 64]).processed 
        avatar.variant(resize_to_limit: [64, 64]).processed
    else
        "dp.png"
    end
  end


end
