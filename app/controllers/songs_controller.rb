class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    find_song
  end

  def update
    find_song
    @song.update(song_params)
    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    find_song
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents:[])
  end

  def find_song
    @song = Song.find(params[:id])
  end 
end