class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	
	def create
		@comment = current_user.comments.build(comment_params)
		@comment.wonder_id = params[:id]
		if @comment.save
	    	flash[:success] = "Comment created!"
	    	redirect_to root_url
	    else
	    	render 'static_pages/home'
	    end
	end

	def destroy
	end

	private

	    def comment_params
	    	params.require(:comment).permit(:content, :wonder_id)
	    end
end