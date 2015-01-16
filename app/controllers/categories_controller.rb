class CategoriesController < ApplicationController

  def new
    @search = Search.new
    @categories = Category.all
  end
  
  def index
    @categories = Category.all
    @pictures = Picture.all
    @hairdressers = Hairdresser.all.order("created_at DESC")
  end

  def create
    @search = Search.new(set_search)
     if @search.save
        redirect_to @search 
    else
        render "new"
    end
  end

  def show
    @category = Category.find(params[:id])
    @search = Search.find(params[:id])

    @pictures = Picture.all
    @pictures_category=[]
    @pictures.each do |picture|
      if picture.categories.find_by_name(@category.name)
        @pictures_category << picture
      end
    end
  end
end

def set_search 
  params.require(:search).permit(:search, :area, :hairdresser_id, :first_name, :last_name, :price, :style, :name, :search_type,:perm_price, :cut_price, :treatment_price)

end
