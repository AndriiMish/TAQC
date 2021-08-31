require 'spec_helper'

RSpec.describe 'Registration page' do
  reg_page = RegPage.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }


context 'UI' do

  it '"Sign in" button is exist' do
    expect (reg_page.reg_email.displayed?).equal?(true)
  end

  it 'button "Create an account" displayed' do
    reg_page.reg_email.click
    expect (reg_page.submt_button.displayed?).equal?(true)
  end

  it 'start  registration with invalid email' do
    value = 'abc.ukr.net'
    reg_page.email_input(value)
    reg_page.submt_button.click
    expect(reg_page.existed_email).equal?(true)
  end

  it 'user can not put existed email' do
    reg_page.email_find.clear
    value = 'abc@ukr.net'
    reg_page.email_input(value)
    reg_page.submt_button.click
    expect(reg_page.existed_email).equal?(true)
  end

end

  reg_data = {
    'first' => 'Test',
    'last' =>  'Lastest',
    'password' => 'Test1!',
    'adress' => 'Secondary',
    'city' => 'Kiev',
    'zip' => 49000,
    'mobile' => +3806612323456,
    'alis' => 1
  }

  context 'when valid credentional' do
    it 'verify that user can start registration' do
      reg_page.email_find.clear
      value = 'abc14@ukr.net'
      reg_page.email_input(value)
      reg_page.submt_button.click
      expect(reg_page.url_include?('account-creation')).equal?(true)
    end
    it '"First name" field exist' do
      expect(reg_page.fname.displayed?).equal?(true)
    end

    it '"create an account" button exist' do
      expect(reg_page.done_button.displayed?).equal?(true)
    end

    it 'user can fill "First name" maximum symbols' do
      reg_data['first'] = 'qwerty'* 50
      current_url = browser.current_url
      reg_page.wait_for{ current_url != browser.current_url }
      reg_page.reg_input(reg_data)
      reg_page.done_button.click
      expect(reg_page.url_include?('my-account')).equal?(true)
    end

    it 'user can loss data after refreshing' do
      #current_url = browser.current_url
      #reg_page.wait_for{ current_url != browser.current_url }
     reg_page.reg_input(reg_data)
     reg_page.ref
     expect(reg_page.refresh_em.text) != ""
    end

    it 'verifies user can register' do
      reg_page.clearall
      reg_data['first'] = 'Joy'
      reg_page.reg_input(reg_data)
      reg_page.done_button.click
      expect(reg_page.url_include?('my-account')).equal?(true)
    end

  end
end

