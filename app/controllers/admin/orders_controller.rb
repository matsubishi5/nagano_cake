class Admin::OrdersController < ApplicationController
	before_action :set_order, only: [:show, :update]

	def index
		@orders = Order.all
  end

	def show
		@order_products = @order.order_products
  end

	def update
		if @order.update(order_params)
			if @order.order_status == "入金確認"
				@order.order_products.each do |order_product|
					order_product.production_status = "製作待ち"
					order_product.save
				end
			end
			redirect_to admin_order_path(@order)
		else
			render "show"
		end
	end

	private

		def order_params
			params.require(:order).permit(:order_status)
		end

		def set_order
			@order = Order.find(params[:id])
		end
end