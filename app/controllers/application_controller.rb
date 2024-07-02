class ApplicationController < ActionController::Base

  include Sessionable

  helper :text_formatting

end
