class Subscription < ApplicationRecord
    belongs_to :customer
    belongs_to :tea
    validates_presence_of :title, :price, :status, :frequency
    enum status: [:active, :cancelled]
    enum frequency: [:weekly, :monthly, :quarterly, :yearly]
end
