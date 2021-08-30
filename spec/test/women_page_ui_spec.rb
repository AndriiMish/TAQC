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

  context 'open with filters' do

    it 'verifies categories filter displayed with options' do
      expect(women_page.categories_filter.text).to eq("Categories")
      expect(women_page.categories_filter_tops.text).to include("Tops")
      expect(women_page.categories_filter_dresses.text).to include("Dresses")
    end

    it 'verifies size filter displayed with options' do
      expect(women_page.size_filter.text).to eq("Size")
      expect(women_page.size_filter_s.text).to include("S")
      expect(women_page.size_filter_m.text).to include("M")
      expect(women_page.size_filter_l.text).to include("L")
    end

    it 'verifies color filter displayed with options' do
      expect(women_page.color_filter.text).to eq("Color")
      
    end

    it 'verifies compositions filter displayed with options' do
      expect(women_page.compositions_filter.text).to eq("Compositions")
      expect(women_page.compositions_filter_cotton.text).to include("Cotton")
      expect(women_page.compositions_filter_polyester.text).to include("Polyester")
      expect(women_page.compositions_filter_viscose.text).to include("Viscose")
    end

    it 'verifies styles filter displayed with options' do
      expect(women_page.styles_filter.text).to eq("Styles")
      expect(women_page.styles_filter_casual.text).to include("Casual")
      expect(women_page.styles_filter_dressy.text).to include("Dressy")
      expect(women_page.styles_filter_girly.text).to include("Girly")
    end

    it 'verifies properties filter displayed' do
      expect(women_page.properties_filter.displayed?).to eq(true)
    end

    it 'verifies availability filter displayed with options' do
      expect(women_page.availability_filter.text).to eq("Availability")
      expect(women_page.availability_filter_inStock.text).to include("In stock")
    end

    it 'verifies manufacturer filter displayed with options' do
      expect(women_page.manufacturer_filter.text).to eq("Manufacturer")
      expect(women_page.manufacturer_filter_fashionManufacturer.text).to include("Manufacturer")
    end

    it 'verifies condition filter displayed with options' do
      expect(women_page.condition_filter.text).to eq("Condition")
      expect(women_page.condition_filter_new.text).to include("New")
    end
  end
end