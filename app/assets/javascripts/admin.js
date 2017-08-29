var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};


document.addEventListener("turbolinks:load", function() {
  docReadyJS();
});
//on page load
var docReadyJS = function() {
  //when document is ready
$(document).ready(function(){
  //rating system
  refreshRating();
//elevate zoom
    $('.img-zoom').elevateZoom({
      zoomType: "lens",
      constrainType:"height", 
      constrainSize:274,
      cursor: "crosshair",
      zoomWindowFadeIn: 500,
      zoomWindowFadeOut: 750
      });

// Sort by Date hover timeline effect
  $("#timeline-year-left, #timeline-year-right").each(function() {
    var back = ["#dd859e", "#f0dcc0", "#d5d5d5", "#ff426a", "#b6caf1"];
    var rand = back[Math.floor(Math.random() * back.length)];
    var t,
      $year = $(this),
      $correspondingTitle = $(this).next()

    $year.hover(
      function() {
      console.log("hello")
      $correspondingTitle.css("background-color", rand)
      $correspondingTitle.css("border-radius", "20px")
    },
    function (){
      $correspondingTitle.css("background-color", "transparent");
      $correspondingTitle.css("border", "none")
  });
  })
// Bootstrap DateTimePicker v4
  $(function() {             
   $('.datetimepicker').datetimepicker({
        format: 'YYYY-MM-DD',
        useCurrent: true
    });
  });

// populate date ended if ongoing
$('.checkbox').click(function(){
    if (this.checked) {
      $('.date_ended').data("DateTimePicker").date(moment(new Date()));
    }
  })


//Sort by Artist Name expand bio effect    
  $(".artist-name-rows").each(function() {
  var t,
      $self = $(this),
      $contentBox = $self.find('.content'),
      $artistName = $self.find("#artist-name"),
      newHeight = $contentBox.innerHeight()*5

      $self.find("#artist-name, #bio").hover(function() {
        clearTimeout(t);
        $contentBox.stop().animate({
          'height' : newHeight
        }, {
          step: function() {
            $contentBox.css("overflow-y", "hidden");
          }
        });
      }, function() {
        clearTimeout(t);
        t=setTimeout(function() {
          $contentBox.stop().animate({
            'height' : 80
          }, {
            step: function() {
              $contentBox.css("overflow-y", "auto");
            }
          });
        }, 2000)
      });
  });

  //generate random colors for overlay
  var colors = ["#dd859e", "#f0dcc0", "#d5d5d5", "#ff426a", "#b6caf1", "#dd859e", "#f0dcc0", "#d5d5d5", "#ff426a", "#b6caf1"], c;

$(".dimmed-overlay").css("backgroundColor", function(index, value) {
    // if `index` : `0` define `c` as copy of `colors` array
    if (!index) c = colors.slice();
    return c.splice(Math.floor(Math.random() * c.length), 1)
});

$(".artist-name-rows").css("backgroundColor", function(index, value) {
    // if `index` : `0` define `c` as copy of `colors` array
    if (!index) c = colors.slice();
    return c.splice(Math.floor(Math.random() * c.length), 1)
});

  //prepare products page slider
  $('.regular').slick({
        dots: false,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: true
      });
//prepare page responsivity
  $( window ).resize(function() {
    if($(window).width() < 767) {
      window.sessionStorage.clear();
     $(".navbar-fixed-side").css("width", "100%");
     $("#toggle").css("display", "none");
     $(".mobile-show-container-img").css("display", "block");
     $(".show-container-img").css("display", "none");
    } else {
      $(".navbar-fixed-side").css("width", "230px");
      $("#toggle").css("display", "block");
      $(".mobile-show-container-img").css("display", "none");
      $(".show-container-img").css("display", "flex");
    }});

  $("#toggle").click( function(){
    console.log("toggleclicked")
      if ($(this).hasClass("isDown") ) {
          window.sessionStorage.clear();
          $( ".navbar-fixed-side" ).animate({ "width": "120px" }, "fast" );  
          $( ".content-container" ).animate({ "margin-left": "120px" }, "fast" );
          $( ".navbar-icons").css("display", "block");
          $( ".navbar-links").css("display", "none");
          $(this).removeClass("isDown");
          var menuDown = $( ".navbar-links").css("display");
          console.log(menuDown)
          sessionStorage.setItem('menuStatus', 'menuDown');
          console.log(sessionStorage.getItem('menuStatus'));
          $( window ).resize(function() {
            if($(window).width() > 767) {
              $(".navbar-fixed-side").css("width", "120px");
              $( ".navbar-links").css("display", "none");
              $( ".navbar-icons").css("display", "block");
          }});
      } else {
          window.sessionStorage.clear();
          $( ".navbar-fixed-side" ).animate({ "width": "230px" }, "fast" );
          $( ".content-container" ).animate({ "margin-left": "230px" }, "fast" );
          $( ".navbar-links").css("display", "block");
          $( ".navbar-icons").css("display", "none");
          $(this).addClass("isDown");
          var menuUp = $( ".navbar-links").css("display");
          console.log(menuUp);
          sessionStorage.setItem('menuStatus', 'menuUp');
          console.log(sessionStorage.getItem('menuStatus'));
          $( window ).resize(function() {
            if($(window).width() > 767) {
              $(".navbar-fixed-side").css("width", "230px");
              $( ".navbar-links").css("display", "block");
              $( ".navbar-icons").css("display", "none");

          }});
    }
    return false;
    });
      if (sessionStorage.getItem('menuStatus') === 'menuDown') {
          $(".navbar-fixed-side").css({"width": "120px"});
          $(".content-container").css({"margin-left": "120px"});
          $( ".navbar-links").css("display", "none");
          $( ".navbar-icons").css("display", "block");
          $("#toggle").removeClass("isDown");
        } else if (sessionStorage.getItem('menuStatus') === 'menuUp') {
          $(".navbar-fixed-side").css({"width": "230px"});
          $(".content-container").css({"margin-left": "230px"});
          $( ".navbar-links").css("display", "block");
          $( ".navbar-icons").css("display", "none");
        }
        else {
          return false;
        }
    });
  
  }




