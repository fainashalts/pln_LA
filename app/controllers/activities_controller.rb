class ActivitiesController < ApplicationController
skip_before_action :require_login, only: [:index]
skip_before_action :correct_user
skip_before_action :admin, only: [:index, :show]

	def index 
		@activities = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])
		@location = @activity.location.split().join("%20")
		@comment = Comment.new
	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
		
		if @activity.save
			redirect_to activities_path
		else
			render "new"
		end
	end

	def edit
		@activity = Activity.find(params[:id])
	end

	def update
		@activity = Activity.find(params[:id])
		if @activity.update_attributes(activity_params)
			redirect_to activities_path
		else
			render "edit"
		end
	end

	def destroy
		@activity = Activity.find(params[:id])
		@activity.destroy 
			redirect_to activities_path
	end

	private
	def  activity_params
		params.require(:activity).permit(:name, :date, :location, :headline, :description, :image, :gohere)
	end

end
