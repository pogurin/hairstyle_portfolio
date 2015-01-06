class CategoriesController < ApplicationController

  def new
  end
  
  def index
    @categories = Category.all
    @pictures = Picture.all
    @hairdressers = Hairdresser.all.order("created_at DESC")

  end

  def show
    @category = Category.find(params[:id])
    
    @pictures = Picture.all
    @pictures_category=[]
    @pictures.each do |picture|
      if picture.categories.find_by_name(@category.name)
        @pictures_category << picture
      end
    end
  end

  def create
  end

  def destroy
  end

  def edit
  end
  
end
