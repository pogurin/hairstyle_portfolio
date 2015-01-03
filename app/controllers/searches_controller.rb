class SearchesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]

  # respond_to :html


  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(params[:search])
    redirect_to @search 
  end
end


#   private
#     def set_search
#       @search = Search.find(params[:id])
#     end

#     def search_params
#       params.require(:search).permit(:search,:area)
#     end
# end
