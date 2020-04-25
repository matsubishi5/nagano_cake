class Member::OrdersController < ApplicationController
	def new
		@order = Order.new
  end

	def confirm
		@cart_products = current_member.cart_products
		@address = params[:address]
		if @address == "1"
			@order = Order.new(order_params.merge(post_code: current_member.post_code, address: current_member.address, name: current_member.full_name))
		elsif @address == "2"
			delivery = current_member.deliveries.find(params[:order][:delivery_id].to_i)
			@order = Order.new(order_params.merge(post_code: delivery.post_code, address: delivery.address, name: delivery.name))
		elsif @address == "3"
			@order = Order.new(order_params)
		end
	end

	def create
		order = Order.new(order_params)
		if order.save
			current_member.cart_products.each do |cart_product|
				OrderProduct.create(order_id: order.id, product_id: cart_product.product.id, name: cart_product.product.name, price: cart_product.product.price, quantity: cart_product.quantity)
				cart_product.destroy
			end
			if params[:address] == "3"
				Delivery.create(member_id: current_member.id, post_code: order.post_code, address: order.address, name: order.name)
			end
			redirect_to member_thanks_path
		else
			render "confirm"
		end
	end

	def thanks
	end

	def index
		@orders = current_member.orders
  end

	def show
		@order = Order.find(params[:id])
		@order_products = @order.order_products
  end


	private

		def order_params
			params.require(:order).permit(:member_id, :post_code, :address, :name, :postage, :total_price, :payment_method, :order_status)
		end
end
