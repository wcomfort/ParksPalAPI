class CommentsController < ApplicationController

    def index
        comments= Comment.all 
        render json: comments
    end

    def create
        comment = Comment.create(commentparams)
        render json: comment
    end

    private

    def commentparams
        params.require(:comment).permit(:content, :park_id, :user_id)
    end

end
