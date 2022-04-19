class DealsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :create
  
  def index
    @deals = current_user.deals.order('created_at DESC')
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
    @category = Category.find(deals_params['category_id'])

    respond_to do |format|
      if @deal.save!
        format.html { redirect_to category_path(@category), notice: 'Transaction was created successfully' }
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