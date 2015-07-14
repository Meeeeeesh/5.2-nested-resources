class SongController < ApplicationController

  def index
    @song = Song.all
    @songs = find_songs
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show
    @song = get_song
  end

  def edit
    @song = get_song
  end

  def update
    @song = get_song
    if @song.update_attributes(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = get_album
    @song.destroy
    redirect_to song_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def get_song
    Song.find(params[:id])
  end

  def find_songs
    artist = Artist.find(params[:artist_id])
    artist.songs
    # Song.where(artist_id: params[:artist_id])
  end

end














