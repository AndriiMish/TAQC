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

    it 'verifies size filter displayed' do
      expect(women_page.size_filter.displayed?).to eq(true)
    end

    it 'verifies color filter displayed' do
      expect(women_page.color_filter.displayed?).to eq(true)
    end

    it 'verifies compositions filter displayed' do
      expect(women_page.compositions_filter.displayed?).to eq(true)
    end

    it 'verifies styles filter displayed' do
      expect(women_page.styles_filter.displayed?).to eq(true)
    end

    it 'verifies properties filter displayed' do
      expect(women_page.properties_filter.displayed?).to eq(true)
    end

    it 'verifies availability filter displayed' do
      expect(women_page.availability_filter.displayed?).to eq(true)
    end

    it 'verifies manufacturer filter displayed' do
      expect(women_page.manufacturer_filter.displayed?).to eq(true)
    end

    it 'verifies condition filter displayed' do
      expect(women_page.condition_filter.displayed?).to eq(true)
    end

end