class Customer < ApplicationRecord
    has_many :subscriptions
    has_many :teas, through: :subscriptions
    validates_presence_of :first_name, :last_name, :address
    validates :email, uniqueness: true, presence: true
end
