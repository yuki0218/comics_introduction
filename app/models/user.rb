class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :comics
  has_many :validates

  def already_favorite(comic)
    Favorite.exists?(user_id: self.id, comic_id: comic.id)
  end
end
