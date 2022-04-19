class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
    @categories = current_user.categories
  end

  def create
    @deal= current_user.deals.new(deals_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to deals_path, notice: 'Transaction was created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def deals_params
    params.require(:deal).permit(:name, :amount, :category_id)
  end
end