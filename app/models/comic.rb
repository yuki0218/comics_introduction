class Comic < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title, presence: true
  validates :author, presence: true
  validates :volume, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999}, format:{with: /\A[\d]+\z/}
  validates :target_age_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :genre_id, numericality: {other_than: 0, message: "can't be blank"}

  belongs_to :user
  belongs_to :target_age
  belongs_to :genre
  has_many :favorites, dependent: :destroy

  def self.search_title(title)
    if title != ""
      Comic.where('title LIKE(?)', "%#{title}%").order("updated_at DESC")
    else
      Comic.order("updated_at DESC")
    end
  end

  def self.search_genre(target, genre)
    if target != "0" && genre != "0"
      Comic.where(target_age_id: target, genre_id: genre).order("updated_at DESC")
    elsif target != "0"
      Comic.where(target_age_id: target).order("updated_at DESC")
    elsif genre != "0"
      Comic.where(genre_id: genre).order("updated_at DESC")
    else
      Comic.order("updated_at DESC")
    end
  end
end
