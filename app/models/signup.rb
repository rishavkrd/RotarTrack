class Signup < ApplicationRecord
  belongs_to :event
  belongs_to :account
end
