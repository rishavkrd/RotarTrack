# frozen_string_literal: true

class Point < ApplicationRecord
  belongs_to :account
  belongs_to :event
  validates :account_id, :event_id, presence: true
end
