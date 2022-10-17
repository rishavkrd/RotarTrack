# frozen_string_literal: true

class Status < ApplicationRecord
  validates :Value, presence: true
end
