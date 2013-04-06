class ItemsController < ApplicationController
	def new
		@item = Item.new(:completed => false, :project_id => params[:project_id])
	end
	def create
		@item = Item.new(params[:item])
		if @item.save
			redirect_to item_path(@item)
		else
			flash.notice = "Failed to create item."
			redirect_to new_project_item_path(@item.project_id)
		end
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
		@items = Item
		if params[:project_id]
			@project = Project.find(params[:project_id])
			@items = @items.where(:project_id => params[:project_id])
		end
		@items = @items.all
	end
	def show
		@item = Item.find(params[:id])
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end
	def batch_update

		@items = Item.where(:id => params[:items].keys.map {|id| id.to_i})
		@items.each do |item|
			item.completed = params[:items][item.id.to_s].to_i
			item.save!
		end
		redirect_to project_items_path(params[:project_id])
	end
end
