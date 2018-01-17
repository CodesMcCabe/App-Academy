class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums
  has_many :track, through: :albums, source: :tracks
end
