require 'test_helper'

class ArtistsControllerTest < ActionController: :TestCase
  
  def setup
    @artist = artists(:one)
  end

  test 'GET #index' do 
    get :index
    assert_response :success
  end

  test 'GET #show' do 
    get :show, id: @artist
    assert_response :success
  end

  test 'GET #edit' do 
    get :edit, id: @artist
    assert_response :success
  end
end