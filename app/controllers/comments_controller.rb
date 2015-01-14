class CommentsController < ApplicationController
skip_before_action :require_login
skip_before_action :correct_user
skip_before_action :admin

	def create
		activity = Activity.find(params[:activity_id])
		comment = activity.comments.create(comment_params)
		redirect_to activity_path(comment.activity)
	end

	def index
		@comments = Comment.all
	end

	private
	def comment_params
		params.require(:comment).permit(:body, user_attributes: [:name])
	end

end
