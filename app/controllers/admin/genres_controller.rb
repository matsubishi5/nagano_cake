class Admin::GenresController < ApplicationController
	before_action :set_genre, only: [:edit, :update, :destroy]

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		genre = Genre.new(genre_params)
		if genre.save
			redirect_to admin_genres_path(genre)
		else
			render "index"
		end
	end
	
  def edit
  end

  def update
		if @genre.save
			redirect_to admin_genres_path
		else
			render "edit"
		end
  end

	def destroy
		@genre.destroy
		redirect_to admin_genres_path
	end

	private

		def genre_params
			params.require(:genre).permit(:name, :is_valid)
		end

		def set_genre
			@genre = Genre.find(params[:id])
		end
end
