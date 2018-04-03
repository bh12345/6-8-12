class Post < ApplicationRecord

  validates :title,
            presence: true # существовать

  validates :content,
            presence: true # существовать

  
  validates :author,
            presence: true # существовать
end
