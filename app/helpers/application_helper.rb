module ApplicationHelper

    PAGINATIONS_ITEMS = [ -15, -5, -2, -1, 0, 1, 2, 5, 15 ]

    def paginate_records scope
        page = params[:page].to_i
        page = 1 if page < 1
        paginated_list = scope.page(page).per(20)

        limit = paginated_list.total_pages + 1
        pages_to_show = [
            1,
            *(PAGINATIONS_ITEMS.map{ _1 + paginated_list.current_page }),
            paginated_list.total_pages
        ].uniq
        pages_to_show.select!{ _1 > 0 && _1 < limit }

        pages = pages_to_show.map do |page|
            text = page.to_s
            current = page == paginated_list.current_page
            { page:, text:, current: }
        end

        [ paginated_list, pages ]
    end

    def format_czk_amount value, show_unit: true
        return if value.nil?
        unit = show_unit ? ' Kč' : ''
        number_to_currency value.to_f / 100, unit:, delimiter: ' ', separator: ',', format: '%n%u'
    end

    def format_cz_date value
        return if value.nil?
        value.strftime '%d. %m. %Y'
    end

    def self.cast_czk_amount value
        value = value&.gsub %r/\s/, ''
        value = value.presence

        # `1 332, 20 CZK`, `2 333 CZK` - reagrd the decimal point as "haléře"
        # the result is always in "haléře", as we store it in the database that way
        match = value&.match %r/^(\d+)(?:,(\d\d))?.*$/
        return unless match
        "#{ match[1] }#{ match[2] || '00' }".gsub(' ', '').to_i
    end

    def self.cast_cz_date value
        value = value&.gsub %r/\s/, ''
        value = value.presence

        # `1.1.2010`, `11.11.2010`
        match = value&.match %r/^(\d{1,2})\.(\d{1,2})\.(\d{4})$/
        return unless match
        Date.new match[3].to_i, match[2].to_i, match[1].to_i rescue nil
    end

end
