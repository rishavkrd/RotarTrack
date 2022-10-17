# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :type
  has_many :accounts
  has_many :signups, :through => :accounts
end
