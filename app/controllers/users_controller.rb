class UsersController < ApplicationController
  def artists
    @artists = User.where(artist: true)
    authorize @artists
  end

  def show
    @artist = User.where(params[:id])
    authorize @artist
  end
end
