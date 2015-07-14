require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "do ideal conditions work as intended" do
    Album.create(title: 'Give Up')
    a = Album.find_by(title: 'Give Up')
    assert a
    assert_equal a.class, Album
  end

  test "cannot create without album title" do
    b = Album.new(title: '')
    refute b.valid? 
  end

  test "album titles must be unique" do
    Album.create(title: 'Give Up')
    c = Album.new(title: 'Give Up')
    refute c.valid?
  end
end
