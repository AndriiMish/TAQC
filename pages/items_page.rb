class ItemsPage < BasePage
  def quantity
    browser.find_element(xpath:'//p[@id="quantity_wanted"]/input[@name ="qty"]')
  end
  
  def quantity_enter(data)
	quantity.clear
	quantity.send_keys(data)
  end
  
  def asc_btn
	browser.find_element(xpath:'//a[@class="btn btn-default button-plus product_quantity_up"]')
  end
  
  def desc_btn
	browser.find_element(xpath:'//a[@class="btn btn-default button-minus product_quantity_down"]')
  end
end