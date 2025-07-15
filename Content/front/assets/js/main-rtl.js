(function ($) {
    'use strict';

    var Wizard = {
        init: function () {
            this.Basic.init();
        },
        Basic: {
            init: function () {
                this.preloader();
                this.NeedJobSlide();
                this.FileUpload();
            },
            preloader: function () {
                $(window).on('load', function () {
                    $('#preloader').fadeOut('slow', function () { $(this).remove(); });
                });
            },
            NeedJobSlide: function () {
                $('#need-job-slide-id').owlCarousel({
                    margin: 30,
                    rtl: true,
                    nav: true,
                    dots: false,
                    loop: true,
                    smartSpeed: 1000,
                    navText: ["<i class='fas fa-arrow-left'></i>", "<i class='fas fa-arrow-right'></i>"],
                    responsive: { 0: { items: 1 }, 900: { items: 3 } }
                });
            },
            FileUpload: function () {
                $('.custom-file-input').on('change', function () {
                    var fileName = $(this).val().split('\\').pop();
                    $(this).siblings('.custom-file-label')
                        .addClass('selected').html(fileName);
                });
            }
        }
    };

    $(document).ready(function () { Wizard.init(); });

})(jQuery);     // ← نمرّر jQuery 3.6 هنا
