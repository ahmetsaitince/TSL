class Personel < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :surname, presence: true
  validates :department, presence: true
  validates :status, presence: true
  validates :nation, presence: true
end
