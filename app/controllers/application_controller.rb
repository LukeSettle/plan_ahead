class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def help
  end

  def manifesto
  end

  helper_method :format_datetime
  def format_datetime(datetime)
    return unless datetime
    datetime.strftime('%F %I:%M%p')
  end
end
