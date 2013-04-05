class ProjectsController < ApplicationController
	def new
		@project = Project.new
		@project.team_id = params[:team_id]
	end

	def create
		@project = Project.create!(params[:project])
		@project.team_id = params[:team_id]
		redirect_to project_path(@project)
	end


	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update_attributes(params[:project])
		redirect_to project_path(@project)
	end


	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	def items
		@project = Project.find(params[:id])
	end
end
