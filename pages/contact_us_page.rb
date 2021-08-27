class ContactUsPage
  PAGE_TITLE = 'CUSTOMER SERVICE - CONTACT US'
  def page_title
    #TBD to move to parent page
    browser.find_element(class: 'page-heading bottom-indent')
  end
  def on_page?
    browser.current_url.include? 'contact'
  end

end
