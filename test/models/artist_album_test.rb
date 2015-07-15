require 'test_helper'

class ArtistAlbumTest < ActiveSupport::TestCase
  
  def setup
    @artist_album.valid?
  end

  test "artist_album belongs to album" do
    assert_respond_to @artist_album, :album
    @artist_album.album = albums(:one)
    assert_instance_of Album, @artist_album.album
  end

  test "artist_album belongs to artist" do
    assert_respond_to @artist_album, :artist
    @artist_album.artist= artist(:one)
    assert_instance_of Artist, @artist_album.artist   
  end

end
