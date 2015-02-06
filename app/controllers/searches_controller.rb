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
   # @search.all.order("created_at DESC")
    @coords = [] 
    @search.hairdressers.each do |r|
      if r.latitude != nil
      @coords << {latitude: r.latitude.to_f, longitude: r.longitude.to_f, note: r.first_name + ' ' + r.last_name + ',' + ' ' + r.salon_address}
     end
    end
   
    respond_to do |format|
      if @search.save
        format.html {redirect_to new_search_path}
        format.js {}
      else
        format.html 
        format.js {} # This will look for app/views/reviews/create.js.erb
      end
    end
  end
end

private

def set_search 
  params.require(:search).permit(:search, :area, :hairdresser_id, :first_name, :last_name, :price, :style, :name, :search_type,:perm_price, :cut_price, :treatment_price,:salon_address, :available)

end