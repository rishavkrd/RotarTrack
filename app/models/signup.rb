class Signup < ApplicationRecord
  belongs_to :event
  belongs_to :account
  validates :event_id, :account_id, :Pickup, presence: true
end
