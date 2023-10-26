class ItemsController < ApplicationController
  def index
    facade = ItemsSearchFacade.new("items")
    @items = facade.items
  end

  def show 
    facade = ItemsSearchFacade.new(params[:id])
    @item = facade.item
  end
end