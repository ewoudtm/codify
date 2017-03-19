class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(:name)
  end


  def show
    @artist = Artist.find(params[:id])
    @artists = Artist.all.order(:name)
    @songs = @artist.songs
  end

  def destroy

    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to root_path, notice: "Artist successfully deleted"

  end

end
