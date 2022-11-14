# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :status
  validates :FirstName, :LastName, :Email, :status_id, :uuid, presence: true
  validates :UIN, presence: true, length: { is: 9 }
  validates :PhoneNumber, presence: true, length: { is: 10 }
=begin
  def validate_email_domain
    unless Email.end_with?("@tamu.edu")
      errors.add(:Email, "Email must be a TAMU email.")
    end
  end
=end
end
