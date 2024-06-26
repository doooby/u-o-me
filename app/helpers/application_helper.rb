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

end
