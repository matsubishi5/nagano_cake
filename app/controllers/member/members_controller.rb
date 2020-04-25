class Member::MembersController < ApplicationController
	before_action :set_member, only: [:show, :edit, :update]

	def show
	end

	def edit
	end

	def update
		if @member.update(member_params)
			redirect_to member_member_path(@member)
		else
			render "edit"
		end
	end

	def withdraw
	end

	def delete
		current_member.update(is_valid: "退会済")
		reset_session
		redirect_to	root_path
	end

	private

		def member_params
			params.require(:member).permit(:first_name, :last_name, :reading_first_name, :reading_last_name, :email, :post_code, :address, :telephone_number)
		end

		def set_member
			@member = Member.find(params[:id])
		end
end
