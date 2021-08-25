require 'spec_helper'

RSpec.describe 'TopLevelMenu tab' do
  tplevelmenu_tab = TPLMTab.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }

  context 'TPLM bar check' do
    it 'verify that women button is displayed' do
      binding.pry
      expect(tplevelmenu_tab.women.displayed?).to be(true)
    end

    it 'verify that dresses button is displayed' do
      expect(tplevelmenu_tab.dresses.displayed?).to be(true)
    end

    it 'verify that tshirts button is diplayed' do
      expect(tplevelmenu_tab.tshirts.displayed?).to be(true)
    end

    it 'verify that all tab with buttons is displayed' do
      expect(tplevelmenu_tab.tplm_bar.displayed?).to be(true)
    end
	
	it 'verify that after clickng on the women button women page is opened'
		current_url = browser.current_url
		tplevelmenu_tab.women.click
		search_page.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.url_include?('http://automationpractice.com/index.php?id_category=3&controller=category').on page? (true)
	end
	
	it 'verify that after clicking on the dresses button dresses page is opened'
		current_url = browser.current_url
		tplevelmenu_tab.dresses.click
		search_page.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.url_include?('http://automationpractice.com/index.php?id_category=8&controller=category').on page? (true)
	end
	
	it 'verify that after clicking on the t-shirts button t-shirts page is opened'
		current_url = browser.current_url
		tplevelmenu_tab.tshirts.click
		search_page.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.url_include?('http://automationpractice.com/index.php?id_category=5&controller=category').on page? (true)
	end
  end
end
