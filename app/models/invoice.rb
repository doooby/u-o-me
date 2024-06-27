class Invoice < ApplicationRecord

    belongs_to :user, optional: true
    has_many :reminders, dependent: :destroy

    validates :buyer_email, presence: true
    validates :buyer_name, presence: true
    validates :due_date, presence: true
    validates :price_amount, presence: true

    def public_slug
        'lfduisduflidsulkfjds'
    end

    def send_next_reminder!
        if reminders.count.zero?
            InvoiceReminderMailer.new_invoice(self).deliver_later
        else

        end
    end

end
