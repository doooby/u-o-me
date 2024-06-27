class Invoice < ApplicationRecord

    belongs_to :user, optional: true

    validates :buyer_email, presence: true
    validates :buyer_name, presence: true
    validates :due_date, presence: true
    validates :price_amount, presence: true

end
