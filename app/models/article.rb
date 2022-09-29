class Article < ApplicationRecord
    include Visible

    belongs_to :user
    
    has_many :comments, dependent: :destroy

 include ImageUploader::Attachment(:image)
 validates :image, presence: true
end
