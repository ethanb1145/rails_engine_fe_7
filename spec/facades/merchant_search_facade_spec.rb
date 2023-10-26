require "rails_helper"

RSpec.describe MerchantsSearchFacade do
  describe "Instance Methods" do
    it "exists" do
      facade = MerchantsSearchFacade.new("merchants")

      expect(facade.query).to eq("merchants")
      expect(facade).to be_a(MerchantsSearchFacade)
      expect(facade.service).to be_a(MerchantsService)
    end

    it "returns Merchants" do
      VCR.insert_cassette("merchants.json")
      facade = MerchantsSearchFacade.new("merchants")
      facade.merchants.each do |merchant|
        expect(merchant).to be_a(Merchant)
      end
    end

    it "returns a single Merchant", :vcr do 
      facade = MerchantsSearchFacade.new("1")
      expect(facade.merchant).to be_a(Merchant)
    end
  end 
end