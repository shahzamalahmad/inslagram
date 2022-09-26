class Article < ApplicationRecord
    has_many :comments

 include ImageUploader::Attachment(:image)
 validates :image, presence: true
end
