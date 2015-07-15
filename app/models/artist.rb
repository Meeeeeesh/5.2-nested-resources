class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums, through: :artists_albums
  has_many :artists_albums

  validates :name, presence: true
  validates :name, uniqueness: true
end
