class Player < ApplicationRecord
  include Working

  validates :position, presence: true
  validates :market_value, presence: true
  validates :kit_number, presence: true
end
