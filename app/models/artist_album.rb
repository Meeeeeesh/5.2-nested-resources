class ArtistAlbum < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album

  validates :artist_id, :album_id, presense: true
end
