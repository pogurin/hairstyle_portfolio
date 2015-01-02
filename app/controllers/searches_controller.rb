class SearchesController < ApplicationController
  # before_action :set_search, only: [:show]

  respond_to :html

  def show
    respond_with(@search).set_search
  end

  def new
    @search = Search.new
    respond_with(@search)
  end

  def create
    @search = Search.new(search_params)
    @search.save
    respond_with(@search)
  end

  private
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:keywords, :category_id, :minimum_price, :maximum_price, :area)
    end
end
