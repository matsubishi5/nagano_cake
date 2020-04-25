class Admin::MembersController < ApplicationController
	before_action :set_member, only: [:show, :edit, :update]

	def index
		@members = Member.all
  end

  def show
  end

  def edit
  end

	def update
		if @member.update(member_params)
			redirect_to admin_member_path(@member)
		else
			render "edit"
		end
	end

	private

		def member_params
			params.require(:member).permit(:first_name, :last_name, :reading_first_name, :reading_last_name, :email, :post_code, :address, :telephone_number, :is_valid)
		end

		def set_member
			@member = Member.find(params[:id])
		end
end
