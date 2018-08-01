class DocumentSearcher
  def initialize(uri)
    @uri = uri
  end

  def search_for_text(text)
    wait.until {
      $selenium_driver.find_elements(:xpath, "//*[contains(text(), '#{text}')]").select { |element| element.text.present? }
    }
  end

  def find_element_by_class(class_string)
    wait.until {
      $selenium_driver.find_element(:class, class_string)
    }
  end

  def find_element_by_id(id_string)
    wait.until {
      $selenium_driver.find_element(:id, id_string)
    }
  end

  def uri_params
    Rack::Utils.parse_nested_query(@uri.request_uri.split('?').second)
  end

  protected
    def wait
      @wait ||= Selenium::WebDriver::Wait.new(:timeout => 20)
    end
end