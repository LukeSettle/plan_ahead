class DocumentSearcher
  def self.search_for_text(text)
    wait.until {
      $selenium_driver.find_elements(:xpath, "//*[contains(text(), '#{text}')]").select { |element| element.text.present? }
    }
  end

  def self.find_element_by_class(class_string)
    wait.until {
      $selenium_driver.find_element(:class, class_string)
    }
  end

  def self.find_element_by_id(id_string)
    wait.until {
      $selenium_driver.find_element(:id, id_string)
    }
  end

  def self.uri_params
    binding.pry
    Rack::Utils.parse_nested_query(@uri.request_uri)
  end

  protected
    def self.wait
      @wait ||= Selenium::WebDriver::Wait.new(:timeout => 20)
    end
end