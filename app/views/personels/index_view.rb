class Personels::IndexView < ApplicationView

  include ActionController::StrongParameters

  def initialize(q:, personels:)
    @personels = personels
    @players = Player.all
    @q = q
  end

  def template
    div(class: 'container') do
      render TeamInfoComponent.new(@players)
      div(class: 'row my-2') do
        div(class: 'col-lg-7 col-12') do
          table(class: 'table table-bordered rounded-3 shadow-sm') do
            thead(class: 'table-info') do
              th(class: 'text-center', style: 'width: 45px;') do
                a(href: '#') { '#' }
              end
              th do
                sort_link(@q, :name) # Adjusted this line
              end
              th(class: 'text-center text-nowrap') do
                a(href: '#') { 'Date of birth/Age' }
              end
              th(class: 'text-center') { 'Nat.' }
              th(class: 'text-nowrap text-end') do
                a(href: '#') { 'Market value' }
              end
            end
            tbody do
              div do
                @players.each do |player|
                  render(PlayerViewComponent.new(player))
                end
              end
            end
          end
        end
      end
    end
  end
end
