class ItemsPage < BasePage
  PAGE_TITLE = 'ITEMS'

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
  
  def photo
	browser.find_element(id: 'bigpic')
  end
  
  def size
	browser.find_element(id: 'group_1')
  end
  
  def size_sub
	browser.find_element(xpath: '//select[@class="form-control attribute_select no-print"]/options[@title = "M"]')
  end
  
  def cart_btn
	browser.find_element(class: 'exclusive')
  end
end