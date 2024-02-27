# frozen_string_literal: true

class NavbarComponent < ApplicationComponent
  def template
    nav(class: 'navbar navbar-expand-lg bg-body-tertiary mb-5') do
      div(class: 'container-fluid') do
        a(class: 'navbar-brand', href: '/') do
          img(class: 'container-fluid w-50', src: 'https://tmsi.akamaized.net/head/transfermarkt_logo.svg')
        end
        button(class: 'navbar-toggler', type: 'button', data_bs_toggle: 'collapse',
               data_bs_target: '#navbarSupportedContent',
               aria_controls: 'navbarSupportedContent', aria_expanded: 'false') do
          span(class: 'navbar-toggler-icon')
        end
        div(class: 'collapse navbar-collapse', id: 'navbarSupportedContent') do
          div(class: 'navbar-nav me-auto mb-2 mb-lg-0') do
              li(class: 'nav-item') do
                a(class: 'nav-link', href: '/personels') { 'Player' }
              end
              li(class: 'nav-item') do
                a(class: 'nav-link', href: '/personels/new') { 'Add Personel' }
              end
              li(class: 'nav-item') do
                a(class: 'nav-link', href: '/players/new') { 'Add Player' }
              end
          end
        end


      end
    end
  end
end
