class Comment < ApplicationRecord
  # Ссылка на пост комментария должена:
  validates :post,
            presence: true # существовать

  # Автор комментария должен:
  validates :author,
            presence: true # существовать

  # Текст комментария должен:
  validates :text,
            presence: true # существовать
end
