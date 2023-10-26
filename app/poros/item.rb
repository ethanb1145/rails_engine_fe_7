class Item 
  attr_reader :id, :name, :description, :unit_price
  
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @description = data[:description]
    @unit_price = data[:unit_price]
  end
end