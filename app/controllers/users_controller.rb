class UsersController < ApplicationController
  def index
    
    # if params['category'].present?
    # @artists = policy_scope(User).where(artist: true).joins(:services).where('service.category ILIKE murals')

      @artists = policy_scope(User).where(artist: true)
    # else
    # end
  end

  def show
    @artist = User.find(params[:id])
    authorize @artist
    # TODO Hardcoded for now, update ;later
    @tags = ["murals","graffiti","painting"]
  end
  
  def find_unique_categories(artist)
    arr = []
    # artists.first.services.category
    artist.services.each do |service|
      arr.push(service.category) unless arr.include?(service.category)
    end
    return arr
  end

  helper_method :find_unique_categories
end
