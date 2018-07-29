class TitleFinder < DocumentSearcher
  def self.find_title_on_tripadvisor
    find_element_by_id('header').text
  end
end