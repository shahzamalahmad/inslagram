class Article < ApplicationRecord
 include ImageUploader::Attachment(:image)
 validates :image, presence: true
end
