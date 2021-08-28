require 'spec_helper'

RSpec.describe 'Items tab' do
  search_page = SearchPage.new

  before(:all) do
    browser.get(PRODUCT)
  end

  after(:all) { browser.close } 
  
  context 'UI checking' do
	it 'verifies that quantities field is displayed'
		expect(items_page.quantity.displayed?).to be(true)
	end
	
	it 'verifies that increment button is displayed'
		expect(items_page.asc_btn.displayed?).to be(true)
			
	end
	
	it 'verifies that decrement button is displayed'
		expect(items_page.desc_btn.displayed?).to be(true)
			
	end
	
	it 'verifies that photo is displayed'
		expect(items_page.photo.displayed?).to be(true)
	end
	
	it 'verifies that size field is displayed'
		expect(items_page.size.displayed?).to be(true)
	end
	
	it 'verifies that size subfield is displayed'
		items_page.size.click
		expect(items_page.size_sub.displayed?).to be(true)
	end
	
	it 'verifies that add to cart button is displayed'
		expect(items_page.cart_btn.displayed?).to be(true)
	end
	
  end
  
  context 'when valid credentials' do
    it 'verifies user can type numbers in the quantities field' do
		data = 5
		items_page.quantity_enter(data)
		expect(items_page.quantity.text).to_i == data
    end
	
	it 'verifies that user can click on the increment button'
		data = 2
		items_page.quantity_enter(data)
		items_page.asc_btn.click
		expect(items_page.quantity.text).to_i == data + 1		
	end
	
	it 'verifies that user can click on the decrement button'
		data = 2
		items_page.quantity_enter(data)
		items_page.desc_btn.click
		expect(items_page.quantity.text).to_i == data - 1		
	end
	
	it 'verifies that user can choose size'
		items_page.size.click
		items_page.size_sub.click
		expect(items_page.size.text) == 'M'
	end
  end
  
  context 'when invalid credentials' do
	it 'verifies that quantity can not be negative or zero by clicking on the decrement button'
		data = 1
		items_page.quantity_enter(data)
		items_page.desc_btn.click
		expect(items_page.quantity.text).to_i == data	
	end
	
	
  end
	

end