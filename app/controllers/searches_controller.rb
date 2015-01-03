class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def indexlle
    @searches = Search.all
    respond_with(@searches)
  end

  def show
    respond_with(@search)
    @hairdresser = Hairdresser.find(params[:id])
  end

  def new
    @search = Search.new
    respond_with(@search)
  end

  def edit
  end

  def create
    @search = Search.new(search_params)
    @search.save
    respond_with(@search)
  end

  def update
    @search.update(search_params)
    respond_with(@search)
  end

  def destroy
    @search.destroy
    respond_with(@search)
  end

  private
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:search,:area)
    end
end
