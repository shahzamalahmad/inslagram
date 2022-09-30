class Article < ApplicationRecord
    include Visible

    belongs_to :user
    
    has_many :comments, dependent: :destroy
    has_many :likes
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end

 include ImageUploader::Attachment(:image)
 validates :image, presence: true
end
