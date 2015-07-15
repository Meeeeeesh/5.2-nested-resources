class Album < ActiveRecord::Base
  has_many :songs
  # has_many :albums, through: :meesh_artists_albums
  # has_many :meesh_artists_albums

  validates :title, presence: true
  validates :title, uniqueness: true
end
