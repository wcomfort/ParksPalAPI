class ApplicationController < ActionController::API
    def login
        user = User.find_by(username: params[:username], password: params[:password])
        render json: user
    end
end
