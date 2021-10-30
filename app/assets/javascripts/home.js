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