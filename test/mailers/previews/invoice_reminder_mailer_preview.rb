# Preview all emails at http://localhost:3000/rails/mailers/invoice_reminder_mailer
class InvoiceReminderMailerPreview < ActionMailer::Preview
  def new_invoice
    invoice = Invoice.first
    InvoiceReminderMailer.new_invoice invoice
  end
end
