class CommentsController < ApplicationController

	def create
		activity = Activity.find(params[:activity_id])
		comment = activity.comments.create(comment_params)
		redirect_to activity_path(comment.activity)
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end

end
