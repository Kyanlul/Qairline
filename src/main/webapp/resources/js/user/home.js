//Mouse trail
var dots = [],
    mouse = {
        x: 0,
        y: 0
    };

// The Dot object used to scaffold the dots
var Dot = function () {
    this.x = 0;
    this.y = 0;

    // Create a <div> or <img> element for the trail
    this.node = (function () {
        var n = document.createElement("div");
        n.className = "trail";
        document.body.appendChild(n);
        return n;
    }());
};

// The Dot.prototype.draw() method sets the position of
// the object's <div> node
Dot.prototype.draw = function () {
    this.node.style.left = this.x + "px";
    this.node.style.top = this.y + "px";

    // Optionally, change a specific dot to an icon

};

// Creates the Dot objects, populates the dots array
for (var i = 0; i < 18; i++) {
    var d = new Dot();
    dots.push(d);
}

// This is the screen redraw function
function draw() {
    // Make sure the mouse position is set everytime
    // draw() is called.
    var x = mouse.x,
        y = mouse.y;

    // This loop is where all the 90s magic happens
    dots.forEach(function (dot, index, dots) {
        var nextDot = dots[index + 1] || dots[0];

        dot.x = x;
        dot.y = y;
        dot.draw();
        x += (nextDot.x - dot.x) * .6;
        y += (nextDot.y - dot.y) * .6;

    });
}

// Track mouse movements
document.addEventListener("mousemove", function (event) {
    mouse.x = event.pageX;
    mouse.y = event.pageY;
});

// Animate the trail
function animate() {
    draw();
    requestAnimationFrame(animate);
}

animate();


addEventListener("mousemove", function (event) {
    //event.preventDefault();
    mouse.x = event.pageX;
    mouse.y = event.pageY;
});

// animate() calls draw() then recursively calls itself
// everytime the screen repaints via requestAnimationFrame().
function animate() {
    draw();
    requestAnimationFrame(animate);
}

// And get it started by calling animate().
animate();

(function ($) {
    "use strict";

    const notificationBell = document.getElementById("NotificationBell");

    // Spinner
    var spinner = document.getElementById("spinner");

    window.addEventListener("load", function () {
        spinner.style.display = "none";
    })



    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.navbar').addClass('sticky-top shadow-sm');
        } else {
            $('.navbar').removeClass('sticky-top shadow-sm');
        }
    });

    // Notification button
    notificationBell.onclick = function() {
        window.location.href = "test.html"; // Thay "yourpage.html" bằng trang đích của bạn
    }


    // International Tour carousel
    $(".InternationalTour-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : false,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:2
            },
            1200:{
                items:3
            }
        }
    });


    // packages carousel
    $(".packages-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: false,
        dots: false,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:2
            },
            1200:{
                items:3
            }
        }
    });


    // testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:2
            },
            1200:{
                items:3
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });

})(jQuery);

