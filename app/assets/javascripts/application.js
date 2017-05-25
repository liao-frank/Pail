// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$.fn.extend({
    animateCss: function (animationName) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
            $(this).removeClass('animated ' + animationName);
        });
    }
});

var bounce;

function animateLoad() {
	$('#load-animation').show();
}

function clearLoad() {
    $('#load-animation').hide();
}
// console.log('asdf');
// $('.grow').mouseenter(function() {
//     console.log('asdf');
//     var val = 1.5;
//     $(this).css({
//         '-webkit-transform': 'scale(' + val + ')',
//         '-moz-transform': 'scale(' + val + ')',
//         '-ms-transform': 'scale(' + val + ')',
//         '-o-transform': 'scale(' + val + ')',
//         'transform': 'scale(' + val + ')'
//     });
//     val = 1;
//     setTimeout(function(){
//         $(this).css({
//             '-webkit-transform': 'scale(' + val + ')',
//             '-moz-transform': 'scale(' + val + ')',
//             '-ms-transform': 'scale(' + val + ')',
//             '-o-transform': 'scale(' + val + ')',
//             'transform': 'scale(' + val + ')'
//         });
//     }, 1000);

// });