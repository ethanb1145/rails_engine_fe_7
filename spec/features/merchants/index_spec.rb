require 'rails_helper'

RSpec.describe "Merchant Index", type: :feature do
  describe "merchant index page content" do
    before(:each) do
      visit "/merchants"
    end

    it "should have a list of merchants by name" do
      expect(page).to have_content("All Merchants")
      within('.all_merchants') do
         expect(page).to have_content("Merchant Name:")
      end
    end

    it "should have each name with a link to their show page" do
      within('.all_merchants') do
        expect(page).to have_link("Willms and Sons")
        click_link("Willms and Sons")
        expect(current_path).to eq("/merchants/3")
     end
    end
  end
end