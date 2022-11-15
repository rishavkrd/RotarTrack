# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :status
  validates :FirstName, :LastName, :Email, :status_id, presence: true
  # rubocop:todo Style/InlineComment
  validates :Email, uniqueness: true, presence: true # rubocop:todo Rails/UniqueValidationWithoutIndex, Style/InlineComment
  # rubocop:enable Style/InlineComment
  # rubocop:todo Style/InlineComment
  validates :UIN, uniqueness: true, presence: true, length: { is: 9 } # rubocop:todo Rails/UniqueValidationWithoutIndex
  # rubocop:enable Style/InlineComment
  # rubocop:todo Style/InlineComment
  validates :PhoneNumber, uniqueness: true, presence: true, length: { is: 10 } # rubocop:todo Rails/UniqueValidationWithoutIndex
  # rubocop:enable Style/InlineComment
end
