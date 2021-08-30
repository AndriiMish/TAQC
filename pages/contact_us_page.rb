class ContactUsPage
  PAGE_TITLE = 'CUSTOMER SERVICE - CONTACT US'
  def page_title
    #TBD to move to parent page
    browser.find_element(class: 'page-heading bottom-indent')
  end
  def on_page?
    browser.current_url.include? 'contact'
  end

  def message_field
    browser.find_element(id: 'message')
  end

  def email_field
    browser.find_element(id: 'email')
  end

  def id_order_field
    browser.find_element(id: 'id_order')
  end

  def file_upload_field
    browser.find_element(id: 'uniform-fileUpload')
  end

  def selector_field
    browser.find_element(id: 'uniform-id_contact')
  end

  def send_button
    browser.find_element(id: 'submitMessage')
  end

end
