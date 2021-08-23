class WomenPage
    PAGE_TITLE = 'WOMEN'

    def page_title
        #TBD to move to parent page
        browser.find_element(class: 'cat-name')
    end

    def categories_filter
        browser.find_element(class: 'layered_subtitle')
    end

    def size_filter
        browser.find_element(class: '')
    end

    def color_filter
        browser.find_element(class: '')
    end

    def compositions_filter
        browser.find_element(class: '')
    end

end