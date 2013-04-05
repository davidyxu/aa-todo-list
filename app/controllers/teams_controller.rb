class TeamsController < ApplicationController
	def new
		@team = Team.new
	end
	def create
		@team = Team.create!(params[:team])
		redirect_to team_path(@team)
	end
	def edit
		@team = Team.find(params[:id])
	end
	def update
		@team = Team.find(params[:id])
		@team.update_attributes(params[:team])
		redirect_to team_path(@team)
	end

	def index
		@teams = Team.all
	end
	def show
		@team = Team.find(params[:id])
	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		redirect_to teams_path
	end
end
