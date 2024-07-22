class Genre < ApplicationRecord
  has_many :item, dependent: :destroy

  validates :genre_name, presence: true
end
