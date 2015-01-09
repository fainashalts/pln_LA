class ActivitiesController < ApplicationController

	def index 
		@activities = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])
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
		params.require(:activity).permit(:name, :date, :location, :headline, :description, :image)
	end

end
