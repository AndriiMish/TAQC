require 'spec_helper'

RSpec.describe 'Search tab' do
  search_page = SearchPage.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }
  
  context 'UI search field check' do
    it 'verify that search field is displayed' do
      expect(search_page.search_input.displayed?).to be(true)
    end
  

	it 'verify that search button is displayed' do
		expect(search_page.search_btn.displayed?).to be(true)
	end
	
	it 'verify that after pushing on the search icon the search label is displayed'
		search_page.search_btn.click
		expect(search_page.search_label.displayed?).to be(true)
	end
  end

  context 'when valid credentials' do
    it 'verifies user can use search by existed data' do
      data = 't-shirt'
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.url_include?(data)).to be(true)
    end

    
  end
  
  context 'when invalid credentials' do
	it 'verifies user request will be described in the url field' do
      data = 'asdsadsada'
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.url_include?(data)).to be(true)
    end
	
	it 'verifies that user request which consist unexisted data can not find anything' do
      data = 'asdsadsada'
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.results_label) == '0 results have been found.'
    end

    it 'verifies that unexisted search data will be described in the alert message' do
      data = 'a' * 50
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.alert.text).to include(data)
    end
	
	it 'verifies that length of the unexisted search data will be described in the alert message block without any border interruption' do
      data = 'a' * 250
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.alert.text).to include(data)
    end

    it 'after clicking on the search button with empty field the alert message shows' do
      search_page.search_input.clear
      search_page.search_btn.click
      expect(search_page.alert.displayed?).to be(true)
    end
  end
  
  context 'Security checking'
	it 'verifies that after entering SQL request in the search field alert message will be described'
		data = 'SELECT * FROM Data WHERE name = "t-shirt"'
		current_url = browser.current_url
		search_page.search(data)
		search_page.wait_for{ current_url != browser.current_url }
		expect(search_page.alert.displayed?).to be(true)
	end
  end
  
end