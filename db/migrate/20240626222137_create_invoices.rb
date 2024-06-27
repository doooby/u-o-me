class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :user, foreign_key: true

      t.string :buyer_email
      t.string :buyer_name
      t.string :buyer_address
      t.string :buyer_phone

      t.date :due_date
      t.integer :price_amount
      t.text :note

      t.timestamps
    end
  end
end
