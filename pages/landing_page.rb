class LandingPage < BasePage
  def sign_in_button
    browser.find_element(class: 'login')
  end
  def contact_us_button
    browser.find_element(xpath: '//*[@id="contact-link"]/a')
  end
end
