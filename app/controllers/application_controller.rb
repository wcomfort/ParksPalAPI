class ApplicationController < ActionController::API
    def login
        user = User.find_by(username: params[:username])
        user.authenticate(params[:password])
        if user.authenticate(params[:password]) 
        render json: user.to_json(to_serialized_json)
        else
          render json: {message: "Invalid Login"}
        end
    end

    def to_serialized_json
        {
          :include => {:favorites => {
            :except => [:updated_at]
          }},
        }
    end
end
