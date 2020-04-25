class Admin::OrderProductsController < ApplicationController
	def update
		order_product = OrderProduct.find(params[:id])
		order = order_product.order
		if order_product.update(order_product_params)
			production_statuses = order.order_products.pluck(:production_status)
			production_statuses.delete("製作完了")
			if production_statuses.length == 0
				order.order_status = "発送準備中"
			elsif production_statuses.include?("製作中")
				order.order_status = "製作中"
			end
			order.save
			redirect_to admin_order_path(order)
		else
			render "show"
		end
	end

	private

	def order_product_params
		params.require(:order_product).permit(:production_status)
	end
end
