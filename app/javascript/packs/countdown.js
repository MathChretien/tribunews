const countdownInit = () => {
  if(document.getElementById("demo")){
// Set the date we're counting down to
let countDownDate = new Date("March 22, 2019 21:29:59").getTime();

// Update the count down every 1 second
const x = setInterval(function() {
  // Get todays date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = days + " : " + hours + " : "
                                              + minutes + " : " + seconds;

  // If the count down is over, write some text
  if (distance < 0) {
      clearInterval(x);
      document.getElementById("demo").innerHTML = "EXPIRED";
            }
          }, 1000);
  };
};

export { countdownInit }
