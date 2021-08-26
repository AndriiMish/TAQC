require 'spec_helper'

RSpec.describe 'Registration page' do
  registration_page = RegPage.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }

  context 'when valid credentional' do
    it 'verifies user can register' do
      first = 'Test'
      last =  'Lastest'
      email = 'nanogo2501@5sword.com'
      password = 'Test1!'
      day = 1
      month = 1
      year = 1
      adress = 'Secondary, street. 2'
      city = 'Kiev'
      state = 1
      zip = 49000
      country = 1
      mobile = +3806612323456
      alis = 1
      current_url = browser.current_url
      registration_page.wait_for{ current_url != browser.current_url }
      registration_page.regist_input(first, last, email, password, day, month, year, adress, city, state, zip, country, mobile, alis)
      registration_page.done_button.click
      expect(registration_page.url_include?(data)).to be(true)
    end

  end