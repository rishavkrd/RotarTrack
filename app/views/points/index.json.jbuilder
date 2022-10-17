# frozen_string_literal: true

json.array!(@points, partial: 'points/point', as: :point)
