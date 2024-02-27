require 'date'

# frozen_string_literal: true

class PlayerViewComponent < ApplicationComponent
  def initialize(player)
    @player = player
    @personel = Personel.find_by(id: @player.personel_id)
  end

  def template
    tr do
      td(class: 'py-0 bg-primary p-1  align-middle') do
        div(style: 'height: 1.5rem; width: 1.5rem;',
            class: 'rounded-circle bg-dark text-light d-flex align-items-center justify-content-center p-1 mx-auto') do
          @player.kit_number
        end
      end
      td(class: 'py-0 px-1') do
        div(class: 'row align-items-center') do
          div(class: 'col-auto pe-0') do
            img(style: 'height: 45px;', class: 'my-1', src: @personel.img)
          end
          div(class: 'col') do
            table do
              tbody do
                tr do
                  div(class: 'col text-primary text-nowrap') do
                    a(class: 'heavier', href: "/players/#{@player.id}") { "#{@personel.name} #{@personel.surname}" }
                  end
                end
                tr do
                  div(class: 'col-12') { positionCreator(@player.position) }
                end
              end
            end
          end
          div(class: 'col-3 d-flex align-items-center justify-content-end') do
            a(href: '#') do
              img(class: 'img-fluid d-none d-lg-block', src: 'https://tmssl.akamaized.net/images/wappen/kaderquad/419.png?lm=1571921138',
                  alt: 'Dinamo Zagreb')
            end
          end
        end
      end
      td(class: 'py-md-2 py-0 text-center align-middle text-secondary') do
        span { birthDate(@personel.birth) }
      end
      td(class: 'py-0 text-center align-middle') do
        img(src: flagCreator(@personel.nation))
      end
      td(class: 'py-0 text-end align-middle text-primary px-2') do
        a(href: '#') { marketValue(@player.market_value) }
      end
    end
  end

  def positionCreator(position)
    case position
    when 'GK'
      "Goalkeeper"
    when 'CB'
      "Centre-Back"
    when 'LB'
      'Left-Back'
    when 'RB'
      'Right-Back'
    else
      position
    end
  end

  def flagCreator(country_name)
    case country_name
    when 'Bosnia-Herzegovina'
      'https://tmssl.akamaized.net/images/flagge/verysmall/24.png?lm=1569523290'
    else
      'https://tmssl.akamaized.net/images/flagge/verysmall/174.png?lm=1520611569'
    end
  end

  def birthDate(date)
    # strftime -> is integrated method in date object required in 1st line
    # %b, %e, %Y are arguments to set it
    # %b: Represents the abbreviated month name (e.g., "Jan", "Feb", etc.).
    # %e: Represents the day of the month without leading zeros (e.g., "1", "2", etc.).
    # %Y: Represents the four-digit year (e.g., "2024", "1993", etc.).
    # https://www.programiz.com/python-programming/datetime/strftime

    date = DateTime.parse(date.to_s)
    age = (Date.today - date).to_i / 365
    date = date.strftime('%b %e, %Y')
    "#{date} (#{age})"
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
