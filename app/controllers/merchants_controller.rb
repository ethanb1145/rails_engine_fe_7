class MerchantsController < ApplicationController
  def index
    facade = MerchantsSearchFacade.new("merchants")
    @merchants = facade.merchants
  end

  def show 
    facade = MerchantsSearchFacade.new(params[:id])
    @merchant = facade.merchant
    @items = facade.items
  end
end