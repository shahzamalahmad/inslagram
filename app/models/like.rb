class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :article, optional: true
end
