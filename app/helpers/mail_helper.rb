module MailHelper

  def app_url_base
    case Rails.env
    when 'development' then 'http://localhost:3000'
    else raise 'not defined yet'
    end
  end

end
