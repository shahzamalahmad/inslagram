class Article < ApplicationRecord
    include Visible

    belongs_to :user, optional: true
    
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy
  
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end

 include ImageUploader::Attachment(:image)
 validates :image, presence: true
end
