require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  test "do ideal conditions work as intended" do
    Artist.create(name: "The Postal Service")
    a = Artist.find_by(name: "The Postal Service")
    assert a
    assert_equal a.class, Artist
  end

  test "cannot create without name" do
    a = Artist.new(name: nil)
    refute a.valid?
  end
  
  test "must have unique name" do
    Artist.create(name: "The Postal Service")
    a = Artist.new(name: "The Postal Service")
    refute a.valid?
  end
  
end
