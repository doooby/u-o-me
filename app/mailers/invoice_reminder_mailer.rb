class InvoiceReminderMailer < ApplicationMailer
  layout "mailer"

  def new_invoice invoice
    @invoice = invoice
    @url  = 'http://example.com/login'
    mail to: @invoice.buyer_email, subject: 'Nezaplacená faktura firmě Ta a Ta'
  end
end
