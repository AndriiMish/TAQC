require_relative '../spec_helper'

RSpec.describe 'Women page' do
    landing_page = LandingPage.new
    women_page = WomenPage.new

    before(:all) do
      browser.get(HOME_PAGE)
      landing_page.women_button.click
    end

    after(:all) { browser.close }

    it 'verifies title displayed' do
      expect(women_page.page_title.text).to include(WomenPage::PAGE_TITLE)
    end

    it 'verifies categories filter displayed' do
      expect(women_page.categories_filter.displayed?).to eq(true)
    end

end