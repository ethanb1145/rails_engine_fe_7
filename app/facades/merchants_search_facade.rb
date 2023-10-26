class MerchantsSearchFacade
  attr_reader :query, :service

  def initialize(query)
    @query = query
    @service = MerchantsService.new
  end

  def merchants
    json = @service.merchants

    @merchants = json[:data].map do |merchant_data|
      attributes = merchant_data[:attributes]
      Merchant.new(id: merchant_data[:id], name: attributes[:name])
    end
  end

  def merchant
    json = @service.merchant(@query)
    
    attributes = json[:data][:attributes]
    Merchant.new(id: json[:data][:id], name: attributes[:name])
  end

  def items
    json = @service.items(@query)
    @items = json[:data].map do |item_data|
      attributes = item_data[:attributes]
      Item.new(id: item_data[:id], name: attributes[:name], description: attributes[:description], unit_price: attributes[:unit_price])
    end
  end
end