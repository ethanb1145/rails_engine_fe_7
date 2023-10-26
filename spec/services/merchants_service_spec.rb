require "rails_helper"

RSpec.describe MerchantsService do
  describe "class methods" do
    describe "merchants" do
      it "all merchants are shown with their data" do
        json_data = File.read("spec/fixtures/merchants.json")
        stub_request(:get, "http://localhost:3000/merchants").
        to_return(status: 200, body: json_data, headers: {})

        search = MerchantsService.new.merchants
        expect(search).to be_a Hash
        expect(search[:data]).to be_an Array
        merchant_data = search[:data].first

        expect(merchant_data).to have_key :id
        expect(merchant_data[:id]).to be_a(String)
        expect(merchant_data).to have_key :type
        expect(merchant_data[:type]).to be_a(String)
        attributes = merchant_data[:attributes]
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a(String)
      end

      describe "merchant" do
        it "merchant is shown with their data" do
          json_data = File.read("spec/fixtures/merchants.json")
          stub_request(:get, "http://localhost:3000/merchants/1").
          to_return(status: 200, body: json_data, headers: {})
  
          search = MerchantsService.new.merchant(1)
          expect(search).to be_a Hash
          expect(search[:data]).to be_a Hash
          merchant_data = search[:data]
  
          attributes = merchant_data[:attributes]
          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(merchant_data).to have_key(:id)
          expect(merchant_data[:id]).to be_a(String)
          expect(merchant_data).to have_key(:type)
          expect(merchant_data[:type]).to be_a(String)
        end
      end
    end
  end
end