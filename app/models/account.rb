# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :status
  validates :UIN, :FirstName, :LastName, :PhoneNumber, :Email, :status_id, presence: true
  has_many :signups
  has_many :events, :through => :signups
end
