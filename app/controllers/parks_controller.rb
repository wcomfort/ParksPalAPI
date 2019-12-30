require 'http'

class ParksController < ApplicationController

    def index
        parks= Park.all 
        render json: parks
    end

    def create 
        park = Park.create(parkparams)
        render json: park
    end

    def show
        park = Park.find(params[:id])
        render json: park
      end

    def getBusiness
        url = "https://api.yelp.com/v3/businesses/search"
        searchinfo = {
            categories: params[:park][:business],
            sort_by: "rating",
            latitude: params[:park][:lat],
            longitude:  params[:park][:long]
        }
        response = HTTP.auth("Bearer pYNiFx7ty_gnQM6cKSCe_uwQEzpNGPiED8oBEYrOSohCryHIzapCG8-iGx55mocoyrB01h17s62jWzED7LezAEbqgTDUlcG837cW3XVueqnVd44LmzRLSkmcFGPqXXYx").get(url, params: searchinfo)
        results = response.parse["businesses"].slice(0,10)
        render json: results
    end

    private

    def parkparams
        params.require(:park).permit(:name, :state, :url, :description, :image, :lat, :long)
    end

end
