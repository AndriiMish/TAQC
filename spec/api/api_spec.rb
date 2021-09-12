<<<<<<< HEAD
require_relative 'api_client.rb'

RSpec.describe 'SignIn page' do
  landing_page = LandingPage.new
  sign_in_page = SignInPage.new
  my_account_page = MyAccountPage.new
  #rspec spec/test/sign_in_page_spec.rb  --color --format
  before(:all)
    browser.get(HOME_PAGE)
    landing_page.sign_in_button.click
  end

  after(:all) { browser.close }

  context 'when valid credentials' do
    it 'verifies user can login' do
      sign_in_page.login_user(USER_LOGIN, USER_PASSWORD)
      expect(my_account_page.on_page?).to be(true)
    end
  end

=======
require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'Create -> Login -> Get' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.login_as_default_user }

  context 'verify user info' do
    it 'verifies user can registered' do
      response = app_cl.create_user(body)
      expect(response.status).to eq(200)
    end

    it 'verifies user can login' do
      response = app_cl.user_login(body[:username], body[:password])
      expect(response.status).to eq(200)
    end

    it 'verifies user can get info' do
      response = app_cl.get_user(body[:username])
      expect(response.status).to eq(200)
    end
  end
end
>>>>>>> master
