require 'spec_helper'

RSpec.describe 'Items tab' do
  search_page = SearchPage.new

  before(:all) do
    browser.get(PRODUCT)
  end

  after(:all) { browser.close 
  
  context 'when valid and invalid credentials' do
  
	it 'verifies that quantities field is displayed'
		expect(items_page.quantity.displayed?) to be(true)
	end
	
	# ?
    it 'verifies user can type numbers in the quantities field' do
		data = 5
		items_page.quantity_enter(data)
		expect(items_page.quantity.text) == data
    end
	
	# ?
	it 'verifies that user can click on the increment button'
		data = 2
		items_page.quantity_enter(data)
		items_page.asc_button.click
		expect(items_page.quantity.text) == data + 1
			
	end
	
	# ?
	
	it 'verifies that user can click on the decrement button'
		data = 2
		items_page.quantity_enter(data)
		items_page.desc_button.click
		expect(items_page.quantity.text) == data - 1
			
	end

  
end