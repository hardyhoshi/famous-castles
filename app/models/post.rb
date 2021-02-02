class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  with_options presence: true do
    validates :name
    validates :body
    validates :image
  end
  
end
