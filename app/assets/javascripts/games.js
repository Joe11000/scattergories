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
    el.innerHTML =  "'" + el.attributes['data-secret-letter'].value + "'";
  }

  function hideStartButton(){
    document.querySelector('#timer-button').style.display = 'none'
  }

  function startRound() {
    setInterval(roundTimer(), 1000)
    hideStartButton();
    revealLetterThatWordsMustStartWith();
  }

  document.querySelector('#timer-button').addEventListener('click', (e) => {
    e.preventDefault();

    startRound();
  })

}, false);