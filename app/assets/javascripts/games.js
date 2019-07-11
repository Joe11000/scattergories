// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



document.addEventListener('DOMContentLoaded', function() {

  function forceSubmitAnswers() {
    document.querySelector('form').submit();
  }

  function roundTimer(seconds=180){
    let timer_html = document.querySelector('#timer-text span');

    return function decrement_counter() {
      seconds -= 1;
      if(seconds <= 0){
        forceSubmitAnswers();
      }else {
        timer_html.innerHTML = seconds;
      }
    }
  }

  function revealLetterThatWordsMustStartWith(){
    let el = document.querySelector('#secret-letter')
    debugger
    el.innerHTML =  "'" + el.attributes['data-secret-letter'].value + "'";
  }

  function hideStartButton(){
    document.querySelector('#timer-button').style.display = 'none'
  }

  function startRound() {
    setInterval(roundTimer(), 1000)
    revealLetterThatWordsMustStartWith();
    hideStartButton();
  }


  document.querySelector('#timer-button').addEventListener('click', (e) => {
    e.preventDefault();
    startRound();
    revealLetterThatWordsMustStartWith();

  })

}, false);