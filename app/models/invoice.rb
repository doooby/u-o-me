class Invoice < ApplicationRecord

    belongs_to :user, optional: true
    has_many :reminders, dependent: :destroy

    validates :buyer_email, presence: true
    validates :buyer_name, presence: true
    validates :due_date, presence: true
    validates :price_amount, presence: true

    before_create :set_public_slug

    def send_next_reminder!
        if reminders.count.zero?
            InvoiceReminderMailer.new_invoice(self, save: true).deliver_later
        else

        end
    end

private

    def set_public_slug
        self.public_slug = SecureRandom.uuid
    end

end
