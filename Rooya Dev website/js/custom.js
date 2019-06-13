// ===== Type Animation ==== 
var TxtType = function (el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function () {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;
    }

    setTimeout(function () {
        that.tick();
    }, delta);
};

window.onload = function () {
    var elements = document.getElementsByClassName('typewrite');
    for (var i = 0; i < elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
            new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};

// ===== Heder is Window Sizing ==== 
$(function () {
    $('#hedo').height($(window).height());
});

// ===== Scroll to Top ==== 
$(window).scroll(function () {
    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('#return-to-top').fadeIn(200);    // Fade in the arrow
    } else {
        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
    }
});
$('#return-to-top').click(function () {      // When arrow is clicked
    $('body,html').animate({
        scrollTop: 0                       // Scroll to top of body
    }, 500);
});

$('#home').click(function () {      // When arrow is clicked
    $('body,html').animate({
        scrollTop: 0                       // Scroll to top of body
    }, 500);
});
// ===== Change Button SRC ====

$('#links a').click(function (e) {
    e.preventDefault();
    $('#iframe').attr('src', $(this).attr('href'));
})

// ===== Fillters The Prtfilio ====



$(function () {
    $('.categories a').click(function (e) {
        $('.categories ul li').removeClass('active');
        $(this).parent('li').addClass('active');
        var itemSelected = $(this).attr('data-filter');
        $('.portfolio-item').each(function () {
            if (itemSelected == '*') {
                $(this).removeClass('filtered').removeClass('selected');
                return;
            } else if ($(this).is(itemSelected)) {
                $(this).removeClass('filtered').addClass('selected');
            } else {
                $(this).removeClass('selected').addClass('filtered');
            }
        });
    });
});

// ===== Logos Sliders ====

$(document).ready(function () {
    $('.customer-logos').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,
        arrows: false,
        dots: false,
        pauseOnHover: false,
        responsive: [{
            breakpoint: 768,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 520,
            settings: {
                slidesToShow: 3
            }
        }]
    });
});


// ===== Slow Motion ====


$(document).ready(function () {
    $(window).load(function () {
        $(".se-pre-con").fadeOut("slow");;
    });
})

// ===== Scroll to Change Nav ====

$(function () {
    $(document).scroll(function () {
        var $nav = $(".fixed-top");
        $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    });
});

$(function () {
    $(".readmore").click(function () {
        $(this).text(function (i, v) {
            return v === 'show more' ? 'show less' : 'show more'
        });
    });
})




// ===== Career search ====
$(function () {
    $("#Career_search").on("keyup", function () {
        var value = $("input").val().toLowerCase();
        $("#results .col-md-12").filter(function () {
            
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
           

           

        });
    });
});





