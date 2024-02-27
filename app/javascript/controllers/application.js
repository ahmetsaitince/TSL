import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application



// JavaScript
/*
document.addEventListener("DOMContentLoaded", function() {
  var radioButtons = document.querySelectorAll('#radio_buttons .form-check input');
  var playerForm = document.querySelector('#player-form')
  var managerForm = document.querySelector('#manager-form')
  var techForm = document.querySelector('#tech-form')

  console.log(radioButtons)
  radioButtons.forEach(function(radioButton) {
    radioButton.addEventListener('change', function() {
      if (this.value === 'Player') {
        playerForm.classList.remove('d-none');
      } else {
        playerForm.classList.add('d-none');
      }
      if (this.value === 'Management') {
        managerForm.classList.remove('d-none');
      } else {
        managerForm.classList.add('d-none');
      }
      if (this.value === 'Technical Staff') {
        techForm.classList.remove('d-none');
      } else {
        techForm.classList.add('d-none');
      }
    });
  });
});
*/


export { application }
