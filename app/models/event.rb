class Event < ApplicationRecord
    validates :Title, :Description, :Date, :Time, :Location, :Points, presence: true
end
