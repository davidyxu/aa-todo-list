class ItemsController < ApplicationController
	def new
		@item = Item.new(:completed => false)
	end
	def create
		@item = Item.create!(params[:item])
		redirect_to item_path(@item)
	end

	def edit
		@item = Item.find(params[:id])
	end
	def update
		@item = Item.find(params[:id])
		@item.update_attributes(params[:item])
		redirect_to item_path(@item)
	end

	def index
		@items = Item.all
	end
	def show
		@item = Item.find(params[:id])
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end
end
