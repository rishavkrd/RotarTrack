# frozen_string_literal: true

class Type < ApplicationRecord
  validates :Value, presence: true
end
