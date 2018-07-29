class PriceFinder < DocumentSearcher
  def self.find_price_on_tripadvisor
    find_element_by_class('price').text
  end

  def self.find_price_on_airbnb
    elements = search_for_text('$')
    return if elements.blank?
    elements.last.text.tr('$,', '').to_i
  end
end