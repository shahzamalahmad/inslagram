class Comment < ApplicationRecord
  include Visible
  
  belongs_to :article, optional: true
  belongs_to :user, optional: true
end
