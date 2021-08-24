<<<<<<< HEAD
class MyAccountPage
    def on_page?
      browser.current_url.include? 'my-account'
    end
  end
=======
class MyAccountPage < BasePage
  def on_page?
    browser.current_url.include? 'my-account'
  end
end
>>>>>>> master
