class Admin::ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def new
		@product = Product.new
  end

	def create
		product = Product.new(product_params)
		if product.save
			redirect_to admin_product_path(product)
		else
			render "new"
		end
  end

	def index
		@products = Product.all
  end

	def show
  end

  def edit
  end

	def update
		if @product.update(product_params)
			redirect_to admin_product_path(@product)
		else
			render "edit"
		end
  end

	def destroy
		@product.destroy
		redirect_to admin_products_path
	end

	private

		def product_params
			params.require(:product).permit(:name, :introduction, :image, :genre_id, :price, :is_valid)
		end

		def set_product
			@product = Product.find(params[:id])
		end
end