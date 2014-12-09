class CategoriesController < ApplicationController
 
  def new
  end
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def edit
  end
  
end
