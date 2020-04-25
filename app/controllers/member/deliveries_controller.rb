class Member::DeliveriesController < ApplicationController
	before_action :set_delivery, only: [:edit, :update, :destroy]

	def index
		@delivery = Delivery.new
		@deliveries = current_member.deliveries
	end

	def create
		delivery = Delivery.new(delivery_params)
		delivery.member_id = current_member.id
		if delivery.save
			redirect_to member_deliveries_path
		else
			render "index"
		end
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		if @delivery.update(delivery_params)
			redirect_to member_deliveries_path
		else
			render "edit"
		end
	end

	def destroy
		@delivery.destroy
		redirect_to member_deliveries_path
	end

	private

		def delivery_params
			params.require(:delivery).permit(:post_code, :address, :name)
		end

		def set_delivery
			@delivery = Delivery.find(params[:id])
		end
end
