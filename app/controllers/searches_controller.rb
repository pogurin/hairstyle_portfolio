class SearchesController < ApplicationController
  # before_action :set_search, only: [:show]

  respond_to :html

  def show
    set_search
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end

  private
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:keywords, :category_id, :minimum_price, :maximum_price, :pictures)
    end
end
