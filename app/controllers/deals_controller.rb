class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal= current_user.deals.new(deals_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to categories_path, notice: 'Category was created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def categories_params
    params.require(:deal).permit(:name, :icon)
  end
end