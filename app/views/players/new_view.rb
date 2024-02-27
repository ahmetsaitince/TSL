class Players::NewView < ApplicationView
  attr_accessor :player

  def initialize(player:)
    @player = player
  end

  def template
      bootstrap_form_for @player do |f|
        plain f.select :personel_id, [Personel.last.id]
        plain f.select :kit_number, (1..99).to_a
        plain f.select :position, %w[GK LB CB RB DM CM OM RM LM LW RW CF ST]
        plain f.number_field :height, in: 140.0..240.0, step: 0.5 # ?
        plain f.select :foot, %w[Left Right Both]
        plain f.number_field :market_value
        plain f.select :transfer_type, %w[Free Rental Loan]
        plain f.select :previous_club, [
          "Manchester United",
          "Dinamo Zagreb",
          "Göztepe FK",
          "Fenerbahçe U19",
          "Atletico Madrid",
          "Udinese",
          "Strasbourg",
          "Union Berlin",
          "Sassuolo",
          "AC Milan",
          "Dinamo Moscow",
          "Rangers",
          "Olympique Marseille",
          "Ajax",
          "Inter",
          'Karagümrük FK'
        ]
        plain f.submit
      end
  end

  def personelIdList
    id_list = []
    Personel.all.each do |personel|
      if personel.department == 'Player'
        id_list.append(personel.id)
      end
    end
    id_list
  end
end
