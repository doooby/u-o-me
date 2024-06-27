class InvoiceReminderMailer < ApplicationMailer
  layout "mailer"

  def new_invoice invoice, save: false
    @invoice = invoice
    product = mail to: @invoice.buyer_email, subject: 'Nezaplacená faktura firmě Ta a Ta'
    Reminder.store_email! invoice, product if save
  end
end
