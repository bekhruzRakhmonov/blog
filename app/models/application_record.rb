class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class


  class Paginatable
    attr_reader :limit_value, :offset_value

    def initialize(scope, options = {})
      @scope = scope
      @limit_value = (options[:limit] || 10).to_i
      @page_range = (options[:page_range] || 2).to_i
    end

    def page(num = 1)
      @offset_value = limit_value * ([num.to_i, 1].max - 1)
      self
    end

    def scoped
      @scope.limit(limit_value).offset(offset_value)
    end
    alias all scoped
    alias to_a scoped

    # Next page number in the collection
    def next_page
      current_page + 1 unless last_page?
    end

    # Previous page number in the collection
    def prev_page
      current_page - 1 unless first_page?
    end

    # First page of the collection?
    def first_page?
      current_page == 1
    end

    # Last page of the collection?
    def last_page?
      current_page >= total_pages
    end

    # Total number of pages
    def total_pages
      (total_count.to_f / limit_value).ceil
    end

    # Pgaes ranges
    def pages
      start_idx = current_page - 1 <= 0 ? current_page : current_page - 1
      end_idx = current_page + @page_range

      if total_pages - current_page < @page_range;
        start_idx = total_pages - @page_range > 0 ? total_pages - @page_range : start_idx
        end_idx = total_pages
      end

      (start_idx..end_idx).to_a
    end

    # total item numbers of scope
    def total_count
      @total_count ||= @scope.count
    end

    # Current page number
    def current_page
      offset = (offset_value < 0 ? 0 : offset_value)
      (offset / limit_value) + 1
    end
  end
end
