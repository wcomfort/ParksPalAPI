class UsersController < ApplicationController
    def index
        users= User.all 
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(to_serialized_json)
      end

    def create
        user = User.create(userparams)
        if user.valid?
        render json: user
        else 
        render json: user.errors
        end 
    end

    private

    def userparams
        params.require(:user).permit(:name, :username, :password)
    end


    def to_serialized_json
        {
          :include => {:favorites => {
            :except => [:updated_at]
          }},
        }
      end

end
