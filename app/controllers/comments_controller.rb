class CommentsController < ApplicationController

    def index
        comments= Comment.all 
        render json: comments.to_json(to_serialized_json)
    end

    def create
        comment = Comment.create(commentparams)
        render json: comment.to_json(to_serialized_json)
    end

    private

    def commentparams
        params.require(:comment).permit(:content, :park_id, :user_id)
    end
    
    def to_serialized_json
        {
          :include => {:user => {
            :only => [:username]
          }},
        }
    end

end
