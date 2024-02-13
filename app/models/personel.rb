class Personel < ApplicationRecord
  include Working

  has_many :players, dependent: :destroy # to delete personel with player

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :surname, presence: true
  validates :department, presence: true
  validates :nation, presence: true
  validates :status, presence: true
end
