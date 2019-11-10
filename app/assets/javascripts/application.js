// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require Chart.min
//= require rails-ujs
//= require bxslider
//= require activestorage

//= require_tree .
jQuery(document).on('turbolinks:load', function(){
	  $('.slider_index').bxSlider({
	    auto: true,           // 自動スライド
	    speed: 1000,          // スライドするスピード
	    moveSlides: 1,        // 移動するスライド数
	    pause: 3000,          // 自動スライドの待ち時間
	    maxSlides: 1,         // 一度に表示させる最大数
	    slideWidth: 300,      // 各スライドの幅
		randomStart: true,    // 最初に表示するスライドをランダムに設定
	    autoHover: true       // ホバー時に自動スライドを停止
	  });
	});

jQuery(document).on('turbolinks:load', function(){
	  $('.slider_show').bxSlider({
	    auto: true,           // 自動スライド
	    speed: 1000,          // スライドするスピード
	    moveSlides: 1,        // 移動するスライド数
	    pause: 3000,          // 自動スライドの待ち時間
	    maxSlides: 1,         // 一度に表示させる最大数
	    slideWidth: 450,      // 各スライドの幅
		randomStart: true,    // 最初に表示するスライドをランダムに設定
	    autoHover: true       // ホバー時に自動スライドを停止
	  });
	});

$("#challenge_icon").click(function() {
	console.log("test")
	$("#challenge_icon").removeClass("fa-3x").addClass("fa-4x");
});