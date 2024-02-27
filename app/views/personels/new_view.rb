class Personels::NewView < ApplicationView
  attr_accessor :personel


  def initialize(personel:)
    @personel = personel
  end

  def template
    div { Personel.last.id + 1} # TODO: ADD THIS VALUE INTO PLAYER NEW AND CREATE A PLAYER WITH THAT!
    div(class: 'container rounded shadow text-center my-5', style: 'padding: 50px 350px;') do
      h2 { 'Create A Personel'}
      p { 'To access all types of personel datas all you need is a Personel.' }
      bootstrap_form_for @personel do |f|
        div(class: 'row border rounded shadow p-5 bg-info-subtle') do
          div(class: 'col-6') { f.text_field :name, placeholder: 'Name' }
          div(class: 'col-6') { f.text_field :surname, placeholder: 'Surname' }
          hr
          div(class: 'col-12') { f.select :nation, ["Türkiye", "Croatia", "Brazil", "France", "Ghana", "Italy", "Netherlands", "Brazil", "Nigeria", "England", "Suriname", "Bosnia-Herzegovina", "Slovenia", "Poland", "Serbia", "Norway", "Belgium", "DR Congo"] }
          div(class: 'col-12') { f.date_select :birth, start_year: Date.current.year - 100, end_year: Date.current.year - 12 }
          div(class: 'col-12 mb-3 d-flex justify-content-between', id: 'radio_buttons') do
            plain 'Department'
            plain f.radio_button :department, 'Player'
            plain f.radio_button :department, 'Management'
            plain f.radio_button :department, 'Technical Staff'
          end

          hr
          div(class: 'col-12') { f.url_field :img, placeholder: 'Personel image url' }
          hr
          div(class: 'col-12') { f.date_select :entry, start_year: Date.current.year - 10, end_year: Date.current.year }
          div(class: 'col-12') { f.date_select :due, start_year: Date.current.year, end_year: Date.current.year + 10}
          hr
          div(class: 'col-12 text-start') { f.check_box :status, label: "In Duty" }
          div(class: 'col-12 text-center mt-5') { f.submit }
        end
      end
    end
  end
end
