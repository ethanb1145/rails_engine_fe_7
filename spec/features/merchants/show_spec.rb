require "rails_helper"

RSpec.describe "Merchant Show Page", type: :feature do 
  describe "merchant show page content" do
    before(:each) do
      visit "/merchants/3"
    end

    it "should have the merchant info on the page" do
      expect(page).to have_content("Merchant Page")
      within('.merchant_info') do
         expect(page).to have_content("Willms and Sons")
      end
    end  
  end
end