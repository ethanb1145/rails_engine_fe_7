class ItemsSearchFacade
  attr_reader :query, :service

  def initialize(query)
    @query = query
    @service = ItemsService.new
  end

  def items
    json = @service.items

    @items = json[:data].map do |item_data|
      attributes = item_data[:attributes]
      Item.new(id: item_data[:id], name: attributes[:name], description: attributes[:description], unit_price: attributes[:unit_price])
    end
  end

  def item
    json = @service.item(@query)
    
    attributes = json[:data][:attributes]
    Item.new(id: json[:data][:id], name: attributes[:name], description: attributes[:description], unit_price: attributes[:unit_price])
  end
end