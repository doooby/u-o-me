class ApplicationMailer < ActionMailer::Base
  helper :text_formatting
  helper :mail

  default from: "from@example.com"
end
