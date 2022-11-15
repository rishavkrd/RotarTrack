# frozen_string_literal: true

class Event < ApplicationRecord
  validates :Title, :Points, presence: true
  belongs_to :type
end
