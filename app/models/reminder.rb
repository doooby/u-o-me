class Reminder < ApplicationRecord

  belongs_to :invoice, optional: true

  def self.store_email! invoice, mail
    Reminder.create! invoice:, message_html: mail.body
  end

end
