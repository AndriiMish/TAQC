class LandingPage < BasePage
  def sign_in_button
    browser.find_element(class: 'login')
  end
  def contact_us_button
    browser.find_element(id: 'contact-link')
  end
  def landing_page
    browser.find_element(class: 'homefeatured')
  end
end

