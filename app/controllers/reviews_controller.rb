class ReviewsController < ApplicationController
	before_filter :load_hairdresser

	def new
		@review = Review.new 
	end

	def show 
		@review = Review.find(params[:id]) # reviews build goes in create method
	end

	def edit
		@review = Review.find(params[:id])
	end

	def create 

		@review = @hairdresser.reviews.build(review_params)
  	@review.user = current_user

    respond_to do |format|
    	if @review.save
    		format.html {redirect_to hairdressers_path(@hairdresser.id), notice: "Review created successfully"}
        format.js {} # This will look for app/views/reviews/create.js.erb
    	else
    		format.html {render "hairdressers/show", alert: "There was an error."}
        format.js {} # This will look for app/views/reviews/create.js.erb
    	end
    end
		
	end

	def update
		@review = Review.find(params[:id])

		if @review.update_attributes(review_params)
			redirect_to hairdressers_path(@review)
		else
			render :edit
		end
	end

	def destroy 
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to reviews_path
	end

	private
	def review_params
		params.require(:review).permit(:comment, :hairdresser_id)
	end

	def load_hairdresser
  	@hairdresser = Hairdresser.find(params[:hairdresser_id])
  end


end
