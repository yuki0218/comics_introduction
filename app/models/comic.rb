class Comic < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :volume, presence: true
  validates :target_age_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :genre_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :completion, presence: true

  belongs_to :user
  belongs_to :target_age
  belongs_to :genre
end
