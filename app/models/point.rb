class Point < ApplicationRecord
  belongs_to :account
  belongs_to :event
end
