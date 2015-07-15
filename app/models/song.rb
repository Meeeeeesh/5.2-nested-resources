class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
  # has_many :genres, through: :meesh_songs_genres
  # has_many :meesh_songs_genres
  # has_many :playlists, through: :meesh_songs_playlists
  # has_many :meesh_songs_playlists

  validates :title, uniqueness: { scope: :artist_id }
  validates :length, :title, :artist_id, presence: true
  validates :length, numericality: true
end
