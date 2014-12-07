class PicturesController < ApplicationController
 
  def new 
  	@picture = Picture.new
  end

  def index
  	@pictures = Picture.all
  end

  def create
  	@picture = Picture.new(picture_params)

    if @picture.save
		  redirect_to pictures_url
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
    params.require(:picture).permit(:category_id, :hairdresser_id)
  end

end






