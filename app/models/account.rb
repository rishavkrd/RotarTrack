# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :status
  validates :FirstName, :LastName, :Email, :status_id, :uuid, presence: true
  validates :Email, uniqueness: true, presence: true
  validates :UIN, uniqueness: true, presence: true, length: { is: 9 }
  validates :PhoneNumber, uniqueness: true, presence: true, length: { is: 10 }
end
