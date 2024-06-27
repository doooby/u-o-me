module TextFormattingHelper

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
