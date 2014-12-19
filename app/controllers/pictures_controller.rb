class PicturesController < ApplicationController
 
  def new 
  	@picture = Picture.new
  end

  def index
  	@pictures = Picture.all
  end

  def show 
    @picture = Picture.find(params[:id])

    if current_user
      @review = @picture.reviews.build
    end
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.hairdresser = current_hairdresser
    @picture.categories << Category.find(params[:category_ids])

    if @picture.save
      redirect_to @picture.imageable #form for ?????? 
    else
		  render :new
    end
  end

  def update
  	@picture = picture.find(params[:id])

  	if @picture.update_attributes
  		redirect_to picture_path(@picture)
  	else
  		render :edit
  	end
  end

  def destroy 
  	@picture = Picture.find(params[:id])
  	@picture.destroy
  	redirect_to pictures_path
  end

  def edit
  	@picture = Picture.find(params[:id])
  end

  private
  def picture_params
    params.require(:picture).permit(:category_ids, :imageable_id, :imageable_type, :picture)
  end

end






