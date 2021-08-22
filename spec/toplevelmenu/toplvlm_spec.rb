require_relative '../spec_helper'
require_relative '../tplevelmenu_tab.rb'


RSpec.describe 'TopLevelMenu tab' do
	before(:all) do
    browser.get(HOME_PAGE)
  end
	
	after(:all) {browser.close}
	
	context 'UI TPLM bar check' do
	it 'verify that women button is displayed'
		expect(tplevelmenu_tab.women?.displayed? to be(true))
	end
	
	it 'verify that dresses button is displayed'
		expect(tplevelmenu_tab.dresses?.displayed? to be(true))
	end
	
	it 'verify that tshirts button is diplayed'
		expect(tplevelmenu_tab.tshirts?.displayed? to be(true))
	end
	
	it 'verify that all tab with buttons is displayed'
		expect(tplevelmenu_tab.tplm_bar?.displayed? to be(true))
	end
	

end

