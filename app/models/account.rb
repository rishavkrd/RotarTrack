# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :status
  validates :FirstName, :LastName, :status_id, presence: true
  validates :Email, uniqueness: true, presence: true, format: { with: /\@tamu.edu/,
		message: "Only TAMU Email addresses allowed" }
  validates :UIN, uniqueness: true, presence: true, length: { is: 9 }
  validates :PhoneNumber, uniqueness: true, presence: true, length: { is: 10 }
end
