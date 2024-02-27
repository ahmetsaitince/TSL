class Players::ShowView < ApplicationView
  attr_accessor :player

  def initialize(player:)
    @player = player
    @personel = Personel.find(@player.personel_id)
  end

  def template
    div(class: 'container') do
      div(class: 'container bg-info-subtle p-3 rounded') do
        div(class: 'row d-flex justify-content-center') do
          div(class: 'col-auto') do
            h1 { "#{@personel.name} #{@personel.surname}" }
          end
        end

        div(class: 'row') do
          div(class: 'col-auto ms-3 my-3 p-4 bg-light rounded border') do
            img(style:"width: 120px;", src: @personel.img)
          end
          div(class: 'col me-3 bg-light h-100 ms-3 my-3 p-4 rounded border w-100') do
            div(class: 'row text-center me-3') do
              div(class: 'col mx-3 py-3 border rounded') do
                @player.kit_number
              end
            end
          end
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
