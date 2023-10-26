require "rails_helper"

RSpec.describe Merchant do
  it "exists" do
    attributes = {
      id: "1",
      name: "Merchant 1"
    }
 
    merchant = Merchant.new(attributes)
    expect(merchant.id).to eq("1")
    expect(merchant.name).to eq("Merchant 1")
  end
end