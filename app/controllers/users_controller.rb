class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.create!(params[:user])
		redirect_to user_path(@user)
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		redirect_to user_path(@user)
	end

	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end
end
