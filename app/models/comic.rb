class Comic < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :volume, presence: true
  validates :completion, presence: true

  belongs_to :user
end
