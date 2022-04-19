class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end
end