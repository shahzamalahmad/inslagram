class Article < ApplicationRecord
    include Visible
    
    has_many :comments, dependent: :destroy

 include ImageUploader::Attachment(:image)
 validates :image, presence: true
end
