# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :type
end
