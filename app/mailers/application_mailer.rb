class ApplicationMailer < ActionMailer::Base
  helper :text_formatting

  default from: "from@example.com"
end
