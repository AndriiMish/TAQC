require_relative '../spec_helper'

RSpec.describe 'Cart page' do
  landing_page = LandingPage.new
  cart_page = CartPage.new

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.cart_button.click
  end

  after(:all) { browser.close }

  context 'Ui' do

    it 'verifies that cart button is displayed' do
      expect(header.shopping_cart.displayed?).to be(true)
    end

    it 'verifies that items in the cart are displayed' do
      expect(cart_page.cart_product.displayed?).to be(true)
    end

    it 'verifies that add to cart button is displayed' do
      expect(women_page.add_to_cart_button.displayed?).to be(true)
    end

    it 'verifies that increment button is displayed' do
      expect(cart_page.btn.button-plus.displayed?).to be(true)
    end

    it 'verifies that decrement button is displayed' do
      expect(cart_page.btn.button-minus.displayed?).to be(true)
    end

    it 'verifies that delete button is displayed' do
      expect(cart_page.btn.button-minus.displayed?).to be(true)
    end

    it 'verifies that continue shopping button is displayed' do
      expect(cart_navigation.button-exclusive.text).to eq("Continue shopping")
    end

    it 'verifies that proceed to checkout button is displayed' do
      expect(cart_navigation.button-medium span.text).to eq("Proceed to checkout")
    end

    it 'verifies condition filter displayed with options' do
      expect(women_page.condition_filter.text).to eq("Condition")
      expect(women_page.condition_filter_new.text).to include("New")
    end
  end
end