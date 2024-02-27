# frozen_string_literal: true

class Players::IndexView < ApplicationView
  def initialize(player:)
    @player = player
  end

  def template
    plain @player.kit_number
  end
end
