class FavoritesController < ApplicationController

    def index
        favorites= Favorite.all 
        render json: favorites
    end

    def create
        favorite = Favorite.create(favparams)
        render json: favorite
    end

    private

    def favparams
        params.require(:favorite).permit(:user_id, :park_id)
    end

end
