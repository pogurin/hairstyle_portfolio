class ReviewsController < ApplicationController

	def new
		@review = Review.new 
	end

	def edit
		@review = Review.find(params[:id])
	end

	def create 
		@review = Review.new(review_params)

		if @review.save
			redirect_to reviews_url
		else
			render :new
		end
	end

	def update
		@review = Review.find(params[:id])

		if @review.update_attributes(review_params)
			redirect_to review_path(@review)
		else
			render :edit
		end
	end

	def destroy 
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to reviews_path
	end

	def show 
		@review = Review.find(params[:id])

		if current_user
			@review = @review.reviews.build
		end
	end

	private
	def review_params
		params.require(:review).permit(:comment)
	end


end
