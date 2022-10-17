# frozen_string_literal: true

class Signup < ApplicationRecord
  belongs_to :event
  belongs_to :account
  validates :event_id, :account_id, presence: true
end
