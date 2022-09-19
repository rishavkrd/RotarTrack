class Authentication < ApplicationRecord
  belongs_to :account
  validates :account_id, :password, presence: true
end
