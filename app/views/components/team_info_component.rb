# frozen_string_literal: true
require 'date'


class TeamInfoComponent < ApplicationComponent
  def initialize(players)
    @players = players
    @average_age = average(@players)
  end

  def template
    div(class: 'bg-info-subtle rounded') do
      div(class: 'container p-3') do
        div(class: 'row d-flex justify-content-center') do
          div(class: 'col-auto') do
            h1 { 'Fenerbahçe' }
          end
        end
        div(class: 'row') do
          div(class: 'col-auto ms-3 my-3 p-4 bg-light rounded border') do
            img(style:"width: 120px;", src: 'https://tmssl.akamaized.net/images/wappen/head/36.png?lm=1406739123')
          end
          div(class: 'col me-3 bg-light h-100 ms-3 my-3 p-4 rounded border w-100 ') do
            div(class: 'row text-center me-3') do
              div(class: 'col mx-3 py-3 border rounded') do
                plain "Squad Size: #{@players.length}"
              end
              div(class: 'col mx-3 py-3 border rounded') do
                plain "Average age: #{average(@players)}"
              end
              div(class: 'col mx-3 py-3 border rounded') do
                plain "Foreigners: #{foreigners(@players)}"
              end
            end
          end
        end
      end
    end
  end

  def ageFinder(player)
    personel = Personel.find_by(id: player.personel_id)
    date = personel.birth
    date = DateTime.parse(date.to_s)
    (Date.today - date).to_i / 365
  end

  def average(players)
    total_age = 0
    players.each do |player|
      total_age += ageFinder(player)
    end
    total_age / players.length.to_f
  end

  def foreigners(players)
    foreigner_count = 0
    players.map do |player|
      personel = Personel.find_by(id: player.personel_id)
      foreigner_count += 1 unless personel.nation == 'Türkiye'
    end
    foreigner_count
  end
end


# basecamp'te kurulum taskı devam ediyor onu unutma! !
