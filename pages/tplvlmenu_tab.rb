class TPLMTab < BasePage
  def women
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]/li/a[@title="Women"]')
  end

  def dresses
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]/li/a[@title="Dresses"]')
  end

  def tshirts
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]/li/a[@title="T-shirts"]')
  end

  def tplm_bar
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]')
  end
end