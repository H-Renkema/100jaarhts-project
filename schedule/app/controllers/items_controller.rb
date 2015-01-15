class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to items_path, :notice => "Item toegevoegd"
		else
			render "new"
		end
	end

	def item_params
		params.require(:item).permit(:time, :content)
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])

		if @item.update_attributes(item_params)
			redirect_to items_path, :notice => "Item updated"
			
		else
			render "edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		redirect_to items_path, :notice => "Your post has been deleted"
	end
end
