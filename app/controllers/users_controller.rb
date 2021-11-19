class UsersController < ApplicationController
  def index
    @artists = policy_scope(User).where(artist: true)
  end

  def show
    @artist = User.find(params[:id])
    authorize @artist
    # TODO Hardcoded for now, update ;later
    @tags = ["murals", "painting", "interior", "illustrations", "signwritting"]
  end
end
