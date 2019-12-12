class UsersController < ApplicationController
    def index
        users= User.all 
        render json: users
    end

    def create
        user = User.create(userparams)
        render json: user 
    end

    private

    def userparams
        params.require(:user).permit(:name, :username, :password)
    end

end
