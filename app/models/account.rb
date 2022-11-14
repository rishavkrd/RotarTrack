# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :status
  validates :FirstName, :LastName, :Email, :status_id, :uuid, presence: true
  validates :UIN, presence: true, length: { is: 9 }
  validates :PhoneNumber, presence: true, length: { is: 10 }
end
