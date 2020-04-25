class HomesController < ApplicationController
	def top
		@products = Product.all.page(params[:page]).per(4)
  end

  def about
  end
end
