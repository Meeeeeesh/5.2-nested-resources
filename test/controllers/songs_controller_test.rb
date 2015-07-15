require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  
  def setup
    @song = songs(:one)
    @artist = artists(:one)
    @album = albums(:one)
  end

  test 'GET #new' do 
    get :new
    assert_instance_of Song, assigns(:song)
    assert_response :success
  end

  class SongsCreate < SongsControllerTest

    test "creates with valid attributes and redirects" do
      assert_difference('Song.count', 1) do
        post :create, song: { title: 'SongTitle', artist: 'ArtistName', album: 'AlbumTitle'}
      end
      assert_redirected_to song_path(assigns(:song))
    end

    test "renders new with invalid attributes" do
      assert_no_difference('Song.count') do
        post :create, song: { title: ''}
      end
      assert_template :new
    end
  end

  test 'GET #edit' do 
    get :edit, id: @song
    assert_equal @song, assigns(:song)
    assert_response :success
  end

class SongsUpdate < SongsControllerTest
  
  test "updates with valid attributes and redirects" do
    old_title = @song.title
    new_title = 'Newtitle'
    patch :update, id: @song, song: { title: new_title }
    @song.reload
    refute @song.title == old_title
    assert_equal new_title, @song.title
    assert_redirected_to song_path(@song)
  end

  test "renders new with invalid attributes" do
    old_title = @song.title
    new_title = ''
    patch :update, id: @song, song: { title: new_title }
    @song.reload
    refute @song.title == new_title
    assert_equal old_title, @song.title
    assert_template :edit
  end
end

  test "delete" do
    assert_difference('song.count', -1) do
      delete :destroy, id: @song
    end
    assert_redirected_to song_path
  end 
end

