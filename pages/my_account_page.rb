class MyAccountPage < BasePage
 
  def click_on(value)
    desired_link = browser.find_element(xpath: "//a[@title= \"#{value}\"]")
    desired_link.click
  end

end

