class WomenPage
    PAGE_TITLE = 'WOMEN'

    def page_title
        #TBD to move to parent page
        browser.find_element(class: 'cat-name')
    end

#TITLES OF CATEGORIES
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

#OPTIONS OF CATEGORIES
    def categories_filter_tops
        browser.find_element(xpath: "//label/a[text()='Tops']")
    end

    def categories_filter_dresses
        browser.find_element(xpath: "//label/a[text()='Dresses']")
    end

#OPTIONS OF SIZE
    def size_filter_s
        browser.find_element(xpath: "//label/a[text()='S']")
    end

    def size_filter_m
        browser.find_element(xpath: "//label/a[text()='M']")
    end

    def size_filter_l
        browser.find_element(xpath: "//label/a[text()='L']")
    end

# OPTIONS OF COLOR
def color_filter_beige
    browser.find_element(xpath: "//label/a[text()='Beige']")
end

def color_filter_white
    browser.find_element(xpath: "//label/a[text()='White']")
end

def color_filter_black
    browser.find_element(xpath: "//label/a[text()='Black']")
end

def color_filter_orange
    browser.find_element(xpath: "//label/a[text()='Orange']")
end

def color_filter_blue
    browser.find_element(xpath: "//label/a[text()='Blue']")
end

def color_filter_green
    browser.find_element(xpath: "//label/a[text()='Green']")
end

def color_filter_yellow
    browser.find_element(xpath: "//label/a[text()='Yellow']")
end

def color_filter_pink
    browser.find_element(xpath: "//label/a[text()='Pink']")
end

# OPTIONS OF COMPOSITIONS
def compositions_filter_cotton
    browser.find_element(xpath: "//label/a[text()='Cotton']")
end

def compositions_filter_polyester
    browser.find_element(xpath: "//label/a[text()='Polyester']")
end

def compositions_filter_viscose
    browser.find_element(xpath: "//label/a[text()='Viscose']")
end

# OPTIONS OF STYLES
def styles_filter_casual
    browser.find_element(xpath: "//label/a[text()='Casual']")
end

def styles_filter_dressy
    browser.find_element(xpath: "//label/a[text()='Dressy']")
end

def styles_filter_girly
    browser.find_element(xpath: "//label/a[text()='Girly']")
end

# OPTIONS OF PROPERTIES
def properties_filter_colorfulDress
    browser.find_element(xpath: "//label/a[text()='Colorful Dress']")
end

def properties_filter_maxiDress
    browser.find_element(xpath: "//label/a[text()='Maxi Dress']")
end

def properties_filter_midiDress
    browser.find_element(xpath: "//label/a[text()='Midi Dress']")
end

def properties_filter_shortDress
    browser.find_element(xpath: "//label/a[text()='Short Dress']")
end

def properties_filter_shortSleeve
    browser.find_element(xpath: "//label/a[text()='Short Sleeve']")
end

# OPTIONS OF AVAILABILITY
def availability_filter_inStock
    browser.find_element(xpath: "//label/a[text()='In stock']")
end

# OPTIONS OF MANUFACTURER
def manufacturer_filter_fashionManufacturer
    browser.find_element(xpath: "//label/a[text()='Fashion Manufacturer']")
end

# OPTIONS OF CONDITION
def condition_filter_new
    browser.find_element(xpath: "//label/a[text()='New']")
end

# OPTIONS OF PRICE

#????????????????

filters = ["Categories", "Size", "Color", "Composition", "Styles", 
"Properties", "Availability", "Manufacturer", "Condition"]

def categories_filter(name_filter)
    sidebar.select { |filter| filter.text == 'Categories'}
end

private
def sidebar
    browser.find_element(class: 'layered_subtitle')
end

end