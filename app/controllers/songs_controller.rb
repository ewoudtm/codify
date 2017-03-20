class SongsController < ApplicationController
  before_action :set_artist

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_path(@artist.id), notice: "Song successfully created"
    else
      render :new
    end
  end


  def destroy

    @song = Song.find(params[:id])
    @artist = @song.artist.id
    @song.delete
    redirect_to artist_path(@artist), notice: "Song successfully deleted"

  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
