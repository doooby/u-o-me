class Reminder < ApplicationRecord

  belongs_to :invoice, optional: true

end
