class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	
	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
	    	flash[:success] = "Yorum eklendi!"
	    else
	    	flash[:error] = "Yorum kaydedilmedi!"
	    end
	    redirect_to(Wonder.find(@comment.commentable_id))
	end

	def destroy
	end

	private

	    def comment_params
	    	params.require(:comment).permit(:content, :commentable_id, :commentable_type)
	    end
end