<<<<<<< HEAD
class LandingPage
    def sign_in_button
      browser.find_element(class: 'login')
    end
  end
=======
class LandingPage < BasePage
  def sign_in_button
    browser.find_element(class: 'login')
  end
end
>>>>>>> master
