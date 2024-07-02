class User < ApplicationRecord

    has_secure_password
    attribute :privileges, PrivilegesType.new

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true

    validate :validate_passowrd_complexity

    def is_admin?
        is_root? or privileges&.include? 'admin'
    end

    def is_root?
        privileges&.include? 'root'
    end

    def assign_invoices!
        Invoices.where(buyer_email: email, user: nil).update_column user_id: id
    end

private

    def validate_passowrd_complexity
        return unless password
        errors.add :password, :invalid unless password.match? %r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/
    end

end
