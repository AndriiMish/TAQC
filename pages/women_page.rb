class WomenPage
    PAGE_TITLE = 'WOMEN'

    def page_title
        #TBD to move to parent page
        browser.find_element(class: 'cat-name')
    end
# TITLES OF CATEGORIES
    def categories_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Categories']")
    end

    def size_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Size']")
    end

    def color_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Color']")
    end

    def compositions_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Compositions']")
    end

    def styles_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Styles']")
    end

    def properties_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Properties']")
    end

    def availability_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Availability']")
    end

    def manufacturer_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Manufacturer']")
    end

    def condition_filter
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='Condition']")
    end
# OPTIONS OF CATEGORIES
    def categories_filter_tops
        browser.find_element(xpath: "//label/a[text()='Tops']")
    end

    def categories_filter_dresses
        browser.find_element(xpath: "//label/a[text()='Dresses']")
    end

    def size_filter_s
        browser.find_element(xpath: "//label/a[text()='S']")
    end

    def size_filter_m
        browser.find_element(xpath: "//label/a[text()='M']")
    end

    def size_filter_l
        browser.find_element(xpath: "//label/a[text()='L']")
    end

end