require 'spec_helper'

MY_ACCOUNT_PAGE = 'http://automationpractice.com/index.php?controller=my-account'
my_account_page = MyAccountPage.new

RSpec.shared_examples 'when button is clicked' do |button, link, page|
  it 'verify that User can redirect to ' + button +  ' page' do
    my_account_page.click_on(button)
    my_account_page.wait_for{ page.url_include?(link) }
    expect(page.url_include?(link)).to be(true)
    browser.get(MY_ACCOUNT_PAGE)
  end
end

RSpec.describe 'My account page' do
  sign_in_page = SignInPage.new
  landing_page = LandingPage.new

  history_page = HistoryPage.new
  credit_slips_page = CreditSlipsPage.new
  my_addresses_page = MyAddressesPage.new
  your_personal_info_page = YourPersonalInfoPage.new 
  my_wishlists_page = MyWishlistsPage.new

  buttons_with_links_on_my_account_page = {
    "Orders" => ["history", history_page],
    "Credit slips" => ["order-slip", credit_slips_page],
    "Addresses" => ["addresses", my_addresses_page],
    "Information" => ["identity", your_personal_info_page],
    "My wishlists" => ["mywishlist", my_wishlists_page]
  }

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.sign_in_button.click
    sign_in_page.login_user(USER_LOGIN, USER_PASSWORD)
    sign_in_page.wait_for{ my_account_page.url_include?('my-account') }
  end

  after(:all) { browser.close }

  buttons_with_links_on_my_account_page.each_pair { |key, value| 
    it_behaves_like 'when button is clicked', key, value[0], value[1] 
  }

end

