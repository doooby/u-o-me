# Preview all emails at http://localhost:3000/rails/mailers/invoice_reminder_mailer
class InvoiceReminderMailerPreview < ActionMailer::Preview
  def new_invoice
    invoice = Invoice.first # Assuming you have an Invoice model and want to preview with the latest invoice
    InvoiceReminderMailer.new_invoice invoice
  end
end
