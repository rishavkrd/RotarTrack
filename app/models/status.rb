class Status < ApplicationRecord
    validates :Value, presence: true
end
