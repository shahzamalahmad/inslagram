class User < ApplicationRecord

    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one_attached :avatar

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable

  def avatar_thumbnail
    if avatar.attached?
        # avatar.variant(resize: [64, 64]).processed 
        avatar.variant(resize_to_limit: [64, 64]).processed
    else
        "/dp.png"
    end
  end


end
