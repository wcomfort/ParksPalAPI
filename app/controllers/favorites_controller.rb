class FavoritesController < ApplicationController

    def index
        favorites= Favorite.all 
        render json: favorites
    end

    def create
        favorite = Favorite.create(favparams)
        render json: favorite
    end

    def destroy
        favorite = Favorite.all.select do |fav| 
            fav.park_id == (params[:park_id]) && fav.user_id == (params[:user_id])
        end
        favorite[0].destroy
        render json: favorite
    end

    private

    def favparams
        params.require(:favorite).permit(:user_id, :park_id)
    end

end
