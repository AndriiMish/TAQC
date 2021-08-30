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

  it 'verifyes that message field is displayed' do
    expect(contact_us_page.message_field.displayed?).to eq(true)
  end

  it 'verifyes that email field is displayed' do
    expect(contact_us_page.email_field.displayed?).to eq(true)
  end

  it 'verifyes that Order reference field is displayed' do
    expect(contact_us_page.id_order_field.displayed?).to eq(true)
  end

  it 'verifyes that file upload field is displayed' do
    expect(contact_us_page.file_upload_field.displayed?).to eq(true)
  end

  it 'verifyes that selector is displayed' do
    expect(contact_us_page.selector_field.displayed?).to eq(true)
  end

  it 'verifyes that Send button is displayed' do
    expect(contact_us_page.send_button.displayed?).to eq(true)
  end



  end

