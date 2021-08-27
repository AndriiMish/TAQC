require_relative '../spec_helper'

RSpec.describe 'Contact us page' do
  landing_page = LandingPage.new
  contact_us_page = ContactUsPage.new

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.contact_us_button.click
  end

  after(:all) { browser.close }
  it 'verifies user can go to ContactUS page' do
    expect(contact_us_page.on_page?).to eq(true)
  end

  end

