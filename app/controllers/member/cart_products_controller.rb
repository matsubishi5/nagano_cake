class Member::CartProductsController < ApplicationController
	before_action :set_cart_product, only: [:update, :destroy]
	before_action :set_cart_products, only: [:index, :empty]

	def create
		cart_product = CartProduct.new(cart_product_params)
		if cart_product.save
			redirect_to member_cart_products_path
		else
			render "products/show"
		end

  end

	def index
	end

	def update
		if @cart_product.update(cart_product_params)
			redirect_to member_cart_products_path
		else
			render "index"
		end
  end

	def destroy
		@cart_product.destroy
		redirect_to member_cart_products_path
  end

	def empty
		@cart_products.destroy_all
		redirect_to member_cart_products_path
	end

	private

		def cart_product_params
			params.require(:cart_product).permit(:member_id, :product_id, :quantity)
		end

		def set_cart_product
			@cart_product = CartProduct.find(params[:id])
		end

		def set_cart_products
			@cart_products = current_member.cart_products
		end
end
