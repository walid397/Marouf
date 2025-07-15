(function ($) {
	"use strict";

	/*------------- preloader js --------------*/
	$(window).on('load', function () {
		$('#preloader').delay(350).fadeOut('slow');
		$('body').delay(350).css({ 'overflow': 'visible' });
	})

	$(document).ready(function () {
		$('.sidebox span').on('click', function (e) {
			e.preventDefault();
			$(this).siblings('div.select').slideToggle();
			$(this).toggleClass('active');
		});
	});


	// meanmenu
	$('#mobile-menu').meanmenu({
		meanMenuContainer: '.mobile-menu',
		meanScreenWidth: "991",
		meanExpand: ['<i class="fal fa-plus"></i>'],
	});
	////////////////////////////////////////////////////
	// 03. Info Bar Js
	$("#sidebar-toggle").on("click", function () {
		$(".sidebar__area").addClass("sidebar-opened");
		$(".body-overlay").addClass("opened");
	});
	$(".sidebar__close-btn").on("click", function () {
		$(".sidebar__area").removeClass("sidebar-opened");
		$(".body-overlay").removeClass("opened");
	});
	$(".body-overlay").on("click", function () {
		$(".sidebar__area").removeClass("sidebar-opened");
		$(".body-overlay").removeClass("opened");
	});

	// sticky
	var wind = $(window);
	var sticky = $('#sticky-header');
	wind.on('scroll', function () {
		var scroll = wind.scrollTop();
		if (scroll < 100) {
			sticky.removeClass('sticky');
		} else {
			sticky.addClass('sticky');
		}
	});


  // active
  $('.history-wrapper,.about-me-wrapper').on('mouseenter', function () {
    $(this).addClass('active').parent().siblings().find('.history-wrapper,.about-me-wrapper').removeClass('active');
  })




	// mainSlider
	function mainSlider() {
		var BasicSlider = $('.slider-active');
		BasicSlider.on('init', function (e, slick) {
			var $firstAnimatingElements = $('.single-slider:first-child').find('[data-animation]');
			doAnimations($firstAnimatingElements);
		});
		BasicSlider.on('beforeChange', function (e, slick, currentSlide, nextSlide) {
			var $animatingElements = $('.single-slider[data-slick-index="' + nextSlide + '"]').find('[data-animation]');
			doAnimations($animatingElements);
		});
		BasicSlider.slick({
			autoplay: false,
			autoplaySpeed: 10000,
			dots: false,
			fade: true,
			arrows: true,
			prevArrow: '<button type="button" class="slick-prev"><i class="far fa-angle-double-left"></i></button>',
		    nextArrow: '<button type="button" class="slick-next"><i class="far fa-angle-double-right"></i></button>',
			responsive: [
				{
					breakpoint: 1200,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						infinite: true,
					}
				},
				{
					breakpoint: 991,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						arrows: false,
					}
				},
				{
					breakpoint: 767,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						arrows: false,
					}
				}
			]
		});

		function doAnimations(elements) {
			var animationEndEvents = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
			elements.each(function () {
				var $this = $(this);
				var $animationDelay = $this.data('delay');
				var $animationType = 'animated ' + $this.data('animation');
				$this.css({
					'animation-delay': $animationDelay,
					'-webkit-animation-delay': $animationDelay
				});
				$this.addClass($animationType).one(animationEndEvents, function () {
					$this.removeClass($animationType);
				});
			});
		}
	}
	mainSlider();



	// testimonial - active
	$('.testimonial-active').slick({
		dots: true,
		arrows: true,
		infinite: true,
		speed: 300,
		prevArrow: '<button type="button" class="slick-prev"><i class="far fa-angle-double-left"></i></button>',
		nextArrow: '<button type="button" class="slick-next"><i class="far fa-angle-double-right"></i></button>',
		slidesToShow: 1,
		slidesToScroll: 1,
		responsive: [
			{
				breakpoint: 1200,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1,
					infinite: true,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1,
					arrows: false,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1,
					arrows: false,
				}
			}
		]
	});

	// brand - active
	$('.brand-active').slick({
		dots: false,
		arrows: true,
		infinite: true,
		autoplay:true,
		speed: 300,
		prevArrow: '<button type="button" class="slick-prev"><i class="far fa-angle-left"></i></button>',
		nextArrow: '<button type="button" class="slick-next"><i class="far fa-angle-right"></i></button>',
		slidesToShow: 6,
		slidesToScroll: 1,
		responsive: [
			{
				breakpoint: 1200,
				settings: {
					slidesToShow: 6,
					slidesToScroll: 1,
					infinite: true,
				}
			},
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 4,
					slidesToScroll: 1,
					arrows: false,
				}
			},
			{
				breakpoint: 767,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 1,
					arrows: false,
				}
			}
		]
	});


	/* counter */
	$('.counter').counterUp({
		delay: 10,
		time: 1000
	});

		/* magnificPopup video view */
		$('.popup-video').magnificPopup({
			type: 'iframe'
		});

		/* magnificPopup img view */
		$('.popup-image').magnificPopup({
			type: 'image',
			gallery: {
				enabled: true
			}
		});


		$('#portfolio-grid').imagesLoaded(function () {
			// init Isotope
			var $grid = $('#portfolio-grid').isotope({
				itemSelector: '.grid-item',
				percentPosition: true,
				masonry: {
					// use outer width of grid-sizer for columnWidth
					columnWidth: 1
				}
			});
			// filter items on button click
			$('.portfolio-menu').on('click', 'button', function () {
				var filterValue = $(this).attr('data-filter');
				$grid.isotope({ filter: filterValue });
			});
		});


		//for menu active class
		$('.portfolio-menu button').on('click', function (event) {
			$(this).siblings('.active').removeClass('active');
			$(this).addClass('active');
			event.preventDefault();
		});

	// data - background
	$("[data-background]").each(function () {
		$(this).css("background-image", "url(" + $(this).attr("data-background") + ")")
	})



	// scrollToTop
	$.scrollUp({
		scrollName: 'scrollUp', // Element ID
		topDistance: '300', // Distance from top before showing element (px)
		topSpeed: 300, // Speed back to top (ms)
		animation: 'fade', // Fade, slide, none
		animationInSpeed: 200, // Animation in speed (ms)
		animationOutSpeed: 200, // Animation out speed (ms)
		scrollText: '<i class="fas fa-angle-up"></i>', // Text for element
		activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	});

	// niceSelect
	$('.niceformnew select').niceSelect();
	// WOW active
	new WOW().init();

	$(".rating-stars i").hover(function () {
	    $(this).toggleClass("fa-star fa-star-o");
	    $(this).prevAll().toggleClass("fa-star fa-star-o");
	});

	$("select").select2({
	    dir: "rtl",
	    placeholder: "Select",
	    allowClear: true
	});

		$("#CountryID").select2({
			placeholder: "الدولة",
        allowClear: true
    });
  

	$("#CityID").select2({
		placeholder: "المدينة",
		allowClear: true
	});


	if (typeof ($.fn.knob) != 'undefined') {
		$('.knob').each(function () {
		  var $this = $(this),
			knobVal = $this.attr('data-rel');

		  $this.knob({
			'draw': function () {
			  $(this.i).val(this.cv + '%')
			}
		  });

		  $this.appear(function () {
			$({
			  value: 0
			}).animate({
			  value: knobVal
			}, {
			  duration: 2000,
			  easing: 'swing',
			  step: function () {
				$this.val(Math.ceil(this.value)).trigger('change');
			  }
			});
		  }, {
			accX: 0,
			accY: -150
		  });
		});
	  }

	  ///////////////////////////////////////////
		///////////////////////////////////////////
		///////////////////////////////////////////
		///////////////////////////////////////////

		/* sakil js area start*/
	    //testimonial 2 active
  $('.testimonial__slider-active').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
	fade: true,
	centerMode: true,
	dots: true,
    asNavFor: '.testimonial__nav',

  });
  $('.testimonial__nav').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: '.testimonial__slider-active',
    dots: false,
	centerMode: true,
	arrows: false,
    centerPadding: 0,
    focusOnSelect: true,
    prevArrow: '<button type="button" class="slick-prev"><i class="fas fa-angle-left"></i></button>',
    nextArrow: '<button type="button" class="slick-next"><i class="fas fa-angle-right"></i></button>',
  });


  $('.newslidecr').owlCarousel({
      loop: true,
      margin: 20,
      autoplay: true,
      autoplayTimeout: 2000,
      smartSpeed: 500,
      items: 4,
      rtl: true,
      navText: ['<button class="btn"><i class="fal fa-angle-left"></i></button>', '<button class="btn"><i class="fal fa-angle-right"></i></button>'],
      nav: true,
      dots: true,
      responsive: {
          0: {
              items: 1
          },
          576: {
              items: 1
          },
          767: {
              items: 2
          },
          992: {
              items:3
          },
          1200: {
              items: 4
          },
          1600: {
              items: 4
          }
      }
  });

	$('.related-job-slider ').owlCarousel({
		loop:true,
		margin:30,
		autoplay:false,
		autoplayTimeout:3000,
		smartSpeed:500,
		items:6,
		navText:['<button><i class="fal fa-angle-left"></i></button>','<button><i class="fal fa-angle-right"></i></button>'],
		nav:true,
		dots:false,
		responsive:{
			0:{
				items:1
			},
			576:{
				items:1
			},
			767:{
				items:1
			},
			992:{
				items:1
			},
			1200:{
				items:1
			},
			1600:{
				items:1
			}
		}
	});

  	////////////////////////////////////////////////////
    // 10. brand__slider
	$('.brand__slider').owlCarousel({
		loop:true,
		margin:30,
		autoplay:false,
		autoplayTimeout:3000,
		smartSpeed:500,
		items:6,
		navText:['<button><i class="fal fa-angle-left"></i></button>','<button><i class="fal fa-angle-right"></i></button>'],
		nav:false,
		dots:false,
		responsive:{
			0:{
				items:1
			},
			576:{
				items:2
			},
			767:{
				items:3
			},
			992:{
				items:4
			},
			1200:{
				items:4
			},
			1600:{
				items:4
			}
		}
	});


	/* Price filter active */
	if ($("#slider-range").length) {
		$("#slider-range").slider({
			range: true,
			min: 0,
			max: 500,
			values: [30, 240],
			slide: function (event, ui) {
				$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
			}
		});
		$("#amount").val("$" + $("#slider-range").slider("values", 0) +
			" - $" + $("#slider-range").slider("values", 1));


		$('#filter-btn').on('click', function () {
			$('.filter-widget').slideToggle(1000);
		});
	}


	})(jQuery);