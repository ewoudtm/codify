class SongsController < ApplicationController
  def new
    @song = Artist.find_by(id: user_id).songs.build
  end

  def create
    @song = Artist.find_by(id: user_id).songs.build(song_params)

    if @song.save
      redirect_to @song, notice: "Song successfully created"
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

  def song_params
    params.require(:song).permit(:title)
  end


end
