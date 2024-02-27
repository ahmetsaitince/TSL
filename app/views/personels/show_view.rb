# frozen_string_literal: true

class Personels::ShowView < ApplicationView
  def initialize(personel:)
    @personel = personel
    @player = Player.find_by(personel_id: @personel.id)
  end

  def template
    div(class: 'container') do
      div(class: 'row bg-dark p-5') do
        div(class: 'col-10 rounded') do
          img(style:"width: 120px;", class: 'img-cover', src: @personel.img)
        end
      end
    end
  end
  def marketValue(value)
    value = value.to_f
    if value >= 1000000 and value < 1000000000
      value = "€#{ (value / 1000000).to_f }m"
    elsif value < 1000000 and value > 0
      value = "€#{ (value / 1000).to_i }k"
    elsif value >= 1000000000
      value = "€#{ (value / 1000000000).to_f }bn"
    else
      value = '?'
    end
    value
  end

end
