class InvoiceReminderMailer < ApplicationMailer
  layout "mailer"

  def new_invoice invoice
    @invoice = invoice
    result = mail to: @invoice.buyer_email, subject: 'Nezaplacená faktura firmě Ta a Ta'
    Reminder.create! invoice:, message_html: result.body
  end
end
