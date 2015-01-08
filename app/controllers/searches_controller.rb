class SearchesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]
  
  # respond_to :html
  def index 
    @hairdressers = Hairdresser.all.order("created_at DESC")
    @pictures = Picture.all
    @categories = Category.all
  end

  def new
    @search = Search.new
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
    @search = Search.find(params[:id])
  end
end


def set_search 
  params.require(:search).permit(:search, :area, :hairdresser_id, :first_name, :last_name, :price, :style, :name, :search_type,:perm_price, :cut_price, :treatment_price, :perm_price_min, :cut_price_min, :treatment_price_min)

end