class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :create
  
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.includes(:deals).find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(categories_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon)
  end
end