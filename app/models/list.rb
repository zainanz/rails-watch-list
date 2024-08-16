class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo
  has_many :movies, through: :bookmarks
  validates :name, presence: { message: "must be given please" }, uniqueness: true
end
