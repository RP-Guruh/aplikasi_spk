class Employee < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    validates :gender, presence: true
    validates :address, presence: true
    validates :position, presence: true
    validates :department, presence: true
    validates :employment_status, presence: true
    validates :phone_number, presence: true
    validates :email, presence: true
end
