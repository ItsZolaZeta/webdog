// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.addEventListener("load", function() {

  // Show the first image
  var slideIndex = 1;
  showSlides(slideIndex);

  // Show the next image
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  // show the n-th image (mod number of images)
  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";
  }

  // eventlisteners to for previous and next buttons
  const prev = document.querySelector('.prev');
  const next = document.querySelector('.next');
  prev.addEventListener("click", function(){plusSlides(-1)});
  next.addEventListener("click", function(){plusSlides(1)});

  // Slideshow on a timer, every 2 seconds
  setInterval(function(){ plusSlides(1); }, 3000);
});

// Navbar hamburger menu button
document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }  
});

// Chat: to minimize chat window
(function() {
$(document).on('click', '.toggle-window', function(e) {
  e.preventDefault();
  var panel = $(this).parent().parent();
  var messages_list = panel.find('.messages-list');

  panel.find('.panel-body').toggle();
  panel.attr('class', 'panel panel-default');

  if (panel.find('.panel-body').is(':visible')) {
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  }
});
})();


// Paying feature...

// This example displays a marker at the center of Australia.
// When the user clicks the marker, an info window opens.
// The maximum width of the info window is set to 200 pixels.
// function initMap() {
//   const webdog = { lat: 46.5589016, lng: 6.5442158 };
//   const map = new google.maps.Map(document.getElementById("map"), {
//     zoom: 4,
//     center: webdog,
//   });
//   const contentString =
//     '<div id="content">' +
//     '<div id="siteNotice">' +
//     "</div>" +
//     '<h1 id="firstHeading" class="firstHeading">Web Dog</h1>' +
//     '<div id="bodyContent">' +
//     "<p><b>Webdog</b> is a small dog education center " +
//     "situated at Bussigny, Switzerland. </p>" +
//     "</div>" +
//     "</div>";
//   const infowindow = new google.maps.InfoWindow({
//     content: contentString,
//     maxWidth: 200,
//   });
//   const marker = new google.maps.Marker({
//     position: webdog,
//     map,
//     title: "Webdog (Club d'éducation canine)",
//   });

//   marker.addListener("click", () => {
//     infowindow.open({
//       anchor: marker,
//       map,
//       shouldFocus: false,
//     });
//   });
// }