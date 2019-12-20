class ApplicationController < ActionController::API
    def login
        user = User.find_by(username: params[:username], password: params[:password])
        render json: user.to_json(to_serialized_json)
    end

    def to_serialized_json
        {
          :include => {:favorites => {
            :except => [:updated_at]
          }},
        }
    end
end
