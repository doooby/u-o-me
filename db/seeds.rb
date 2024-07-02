# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

password = '123HEslo'

User.create! email: 'ondra@email.cz', name: 'Ondra Želazko', password:, privileges: ['root']
User.create! email: 'petr@email.cz', name: 'Petr Petr', password:, privileges: ['admin']
User.create! email: 'jarda@email.cz', name: 'Jarda Jarda', password:, privileges: ['admin']
User.create! email: 'company@example.com', name: 'domy na miru', password:;

Invoice.create!(
    user: User.find_by!(email: 'company@example.com'),
    buyer_email: 'company@example.com',
    buyer_name: 'Compania',
    due_date: '2024-04-08',
    price_amount: 20_123_00,
    note: 'hej, tohle uz melo byt davno zaplaceno!'
)
