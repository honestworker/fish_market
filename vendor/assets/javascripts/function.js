$(function () {

    "use stric";
    // Scroll Top 

    var scrollButton = $("#scroll-top");

    $(window).scroll(function () {

        if ($(this).scrollTop() >= 150) {
            scrollButton.show();
        } else {
            scrollButton.hide();
        }

    });


    // scroll top

    scrollButton.click(function () {

        $("html,body").animate({
            scrollTop: 0
        }, 1500);
    });

    // loading

    $(window).on('load', function () {
        if ($('#page-preloader').length) {
            $('#page-preloader').delay(200).fadeOut(500);
        }
    });

    // change bars

    $('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function () {
        $(this).toggleClass('open');
    });


    //   resize window 

    $('#home').height($(window).height() - 100);

    $(window).resize(
        function () {
            $('header').height($(window).height() - 100);
        }
    );


    // active linkes header

    $('.navs li').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
    });

    // smooth scroll to div 

    $('.navs li a').click(function () {
        $('html,body').animate({
            scrollTop: $('#' + $(this).data('value')).offset().top - 77
        }, 1000);

    });


    // change navbar top

    var nav = $(".navbar.navbar-default");

    $(window).scroll(function () {

        if ($(this).scrollTop() >= 60) {
            nav.addClass('navbar-fixed-top navbars ');
        } else {
            nav.removeClass('navbar-fixed-top navbars ');

        }

    });


    // remove collapse in mobile

    $('.navbar.navbar-default .navs').click(function () {
        $('.navbar.navbar-default .navbar-collapse').removeClass('in');
        $('.navbar-header .navbar-toggle').removeClass('open');
    });


    // remove active panel
    $('#accordion-1').on('show.bs.collapse', function (n) {
        $(n.target).siblings('.panel-heading').toggleClass('active');
    });
    $('#accordion-1').on('hide.bs.collapse', function (n) {
        $(n.target).siblings('.panel-heading').toggleClass('active');
    });

    // picture
    $(".test").owlCarousel({
        items: 1,
        autoplay: 4000,
        loop: true,
        nav: false,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        responsive: {
            0: {
                items: 1
            },
            1200: {
                items: 1
            }
        }
    });

    // accordion
    $('#accordion-1').on('show.bs.collapse', function (n) {
        $(n.target).siblings('.panel-heading').find('.panel-title i').toggleClass('fa-angle-up fa-angle-down');
    });
    $('#accordion-1').on('hide.bs.collapse', function (n) {
        $(n.target).siblings('.panel-heading').find('.panel-title i').toggleClass('fa-angle-down fa-angle-up');
    });

    // Trriger mixItUp

    $("#popular").mixItUp();

    // Active Ul Li In Porto

    $(".popular .select li").click(function () {

        $(this).addClass("selected").siblings().removeClass("selected");
    });

    // slider
    var tpj = jQuery;

    var revapi8;
    $( document ).on('turbolinks:load', function() {
        if (tpj("#rev_slider_8_1").revolution == undefined) {
            revslider_showDoubleJqueryError("#rev_slider_8_1");
        } else {
            revapi8 = tpj("#rev_slider_8_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "../../revolution/js/",
                sliderLayout: "auto",
                dottedOverlay: "none",
                delay: 9000,
                navigation: {
                    keyboardNavigation: "on",
                    keyboard_direction: "horizontal",
                    mouseScrollNavigation: "off",
                    onHoverStop: "off",
                    touch: {
                        touchenabled: "on",
                        swipe_threshold: 75,
                        swipe_min_touches: 1,
                        swipe_direction: "horizontal",
                        drag_block_vertical: false
                    },
                    arrows: {
                        style: "hesperiden",
                        enable: true,
                        hide_onmobile: false,
                        hide_onleave: false,
                        tmp: '',
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 10,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 10,
                            v_offset: 0
                        }
                    }
                },
                gridwidth: 800,
                gridheight: 550,
                lazyType: "single",
                shadow: 0,
                spinner: "off",
                stopLoop: "on",
                stopAfterLoops: 0,
                stopAtSlide: 1,
                shuffle: "off",
                autoHeight: "off",
                disableProgressBar: "off",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                    simplifyAll: "off",
                    nextSlideOnWindowFocus: "off",
                    disableFocusListener: false,
                }
            });
        }
    }); /*ready*/


    // main feshSlider
    var revapi116;
    $( document ).on('turbolinks:load', function() {
        if (tpj("#rev_slider_116_1").revolution == undefined) {
            revslider_showDoubleJqueryError("#rev_slider_116_1");
        } else {
            revapi116 = tpj("#rev_slider_116_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "../../revolution/js/",
                sliderLayout: "fuulwidth",
                dottedOverlay: "none",
                delay: 9000,
                navigation: {
                    keyboardNavigation: "off",
                    keyboard_direction: "horizontal",
                    mouseScrollNavigation: "off",
                    onHoverStop: "off",
                    touch: {
                        touchenabled: "on",
                        swipe_threshold: 75,
                        swipe_min_touches: 1,
                        swipe_direction: "horizontal",
                        drag_block_vertical: false
                    },
                    arrows: {
                        style: "gyges",
                        enable: true,
                        hide_onmobile: true,
                        hide_under: 600,
                        hide_onleave: true,
                        hide_delay: 200,
                        hide_delay_mobile: 1200,
                        tmp: '',
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 30,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 30,
                            v_offset: 0
                        }
                    }
                },
                viewPort: {
                    enable: true,
                    outof: "pause",
                    visible_area: "80%"
                },
                visibilityLevels: [1240, 1024, 778, 480],
                gridwidth: 1024,
                gridheight: 900,
                lazyType: "none",
                shadow: 0,
                spinner: "off",
                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,
                shuffle: "off",
                autoHeight: "off",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                    simplifyAll: "off",
                    nextSlideOnWindowFocus: "off",
                    disableFocusListener: false,
                }
            });
        }
    }); /*ready*/



    // example-modal
    $('#example-modal').on('shown.bs.modal', function () {
        $(".slider_inner").owlCarousel({
            items: 1,
            dots: false,
            autoplay: 4000,
            loop: true,
            nav: true,
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            responsive: {
                0: {
                    items: 1
                },
                1200: {
                    items: 1
                }
            }
        });
    })
    $(".slider_inner2").owlCarousel({
        items: 1,
        dots: false,
        autoplay: 4000,
        loop: true,
        nav: false,
        margin: 3,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        responsive: {
            0: {
                items: 1
            },
            1200: {
                items: 2
            }
        }
    });

    $("#owl-demo3").owlCarousel({
        items: 4,
        dots: true,
        autoplay: 4000,
        loop: true,
        nav: false,
        margin: 3,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        responsive: {
            300: {
                items: 1
            },
            600: {
                items: 2
            },
            900: {
                items: 3
            },
            1028: {
                items: 3
            },
            1200: {
                items: 4
            }
        }

    });


});