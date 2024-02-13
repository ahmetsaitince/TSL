class Player < ApplicationRecord
  include Working

  belongs_to :personel
end
