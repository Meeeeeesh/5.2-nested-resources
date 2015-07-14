require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "cannot create without title" do
    a = Song.new(title: '', length: 347, artist_id: 1)
    refute a.valid? 
  end

  test "cannot create without artist" do
    a = Song.new(title: 'Nothing Better', length: 347, artist_id: nil)
    refute a.valid? 
  end

  test "cannot create without length" do
    a = Song.new(title: 'Nothing Better', length: nil, artist_id: 1)
    refute a.valid? 
  end 

  test "length must be integer" do
    a = Song.new(title: 'Nothing Better', length: "Words", artist_id: 1)
    refute a.valid? 
  end 

  test "cannot have duplicate entry" do
    a = Song.create(title: "Nothing Better", length: 347, artist_id: 1)
    a2 = Song.new(title: "Nothing Better", length: 347, artist_id: 1)
    refute a2.valid?
  end 

  test "artist can have multiple song entries" do
    a = Song.create(title: "Nothing Better", length: 347, artist_id: 1)
    a2 = Song.new(title: "Brand New Colony", length: 247, artist_id: 1)
    assert a2.valid?
  end 

  test "do ideal conditions work as intended" do
    a = Song.create(title: "Nothing Better", length: 347, artist_id: 1)
    a = Song.find_by(title: "Nothing Better")
    assert a
    assert_equal a.class, Song
  end

end

