class RegPage < BasePage
  PAGE_TITLE = 'REGISTRATION'

  def regist_input(first, last, email, password, day, month, year, adress, city, state?, zip, country?, mobile, alis)
    browser.find_element(id: 'customer_firstname')
    enter_data(first)
    browser.find_element(id: 'customer_lastname')
    enter_data(last)
    browser.find_element(id: 'email')
    enter_data(email)
    browser.find_element(id: 'passwd')
    enter_data(password)
    browser.find_element(id: 'days')
    #селекторы(день-месяц-год)
    enter_data(day)
    browser.find_element(id: 'months')
    enter_data(month)
    browser.find_element(id: 'years')
    enter_data(year)
    browser.find_element(id: 'address1')
    enter_data(adress)
    browser.find_element(id: 'city')
    enter_data(city)
    browser.find_element(id: 'id_state')
    #селектор
    select(state)
    browser.find_element(id: 'postcode')
    enter_data(zip)
    browser.find_element(id: 'id_country')
    #селектор
    select(country?)
    browser.find_element(id: 'phone_mobile')
    enter_data(mobile)
    browser.find_element(id: 'alias')
    enter_data(alis)
  end

  def login_user(email, password)
    email_input.send_keys(email)
    password_input.send_keys(password)
    sign_in_button.click
  end

  def done_button
    browser.find_element(id: 'submitAccount')
  end

  def on_page?
    page_title.include?(PAGE_TITLE)
  end
end
