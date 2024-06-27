class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.references :invoice, foreign_key: true
      t.datetime :created_at
      t.text :message_html
    end
  end
end
