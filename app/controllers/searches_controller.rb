class SearchesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]
  
  # respond_to :html
  def index 
    @hairdressers = Hairdresser.all.order("created_at DESC")
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
    
    # @hairdressers = Hairdresser.all.order("created_at DESC") #show every hair D
  end
end


def set_search 
  params.require(:search).permit(:search, :area, :hairdresser_id, :first_name, :last_name, :price, :style, :name, :type)
end
#   private
#     def set_search
#       @search = Search.find(params[:id])
#     end

#     def search_params
#       params.require(:search).permit(:search,:area)
#     end
# end