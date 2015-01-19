class SearchesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]
  
  # respond_to :html
  def index 
    @search = Search.new
    @hairdressers = Hairdresser.all.order("created_at DESC")
    @pictures = Picture.all
    @categories = Category.all
        
  end

  def new
    @search = Search.new
    @categories = Category.all
    render :action => 'new'
    @hairdressers = Hairdresser.all.order("created_at DESC")
    @pictures = Picture.all

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
    
    @hairdressers = Hairdresser.all.order("created_at DESC")
    @coords = [] 
    @hairdressers.each do |r|
      @coords << {latitude: r.latitude.to_f, longitude: r.longitude.to_f, note: r.first_name + ' ' + r.last_name + ',' + ' ' + r.salon_address}
    end
  end
  
  # def update
  #   @search = Search.new
  #   render :action => 'new'
  # end
end

private

def set_search 
  params.require(:search).permit(:search, :area, :hairdresser_id, :first_name, :last_name, :price, :style, :name, :search_type,:perm_price, :cut_price, :treatment_price)

end