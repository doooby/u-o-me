class User < ApplicationRecord

    attribute :privileges, PrivilegesType.new

    validates :email, presence: true
    validates :name, presence: true
end
