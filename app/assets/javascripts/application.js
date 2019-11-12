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
//= require moment
//= require moment/ja.js
//= require fullcalendar
//= require popper
//= require bootstrap-sprockets
//= require tempusdominus-bootstrap-4.js
//= require Chart.min
//= require rails-ujs
//= require bxslider
//= require activestorage

//= require_tree .

// スライドショー
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

// カレンダー
$(document).ready(function() {
    var currentEvents = $('#current_events').data('event-id');
    console.log(currentEvents);
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      navLinks: true,
      selectable: true,
      selectHelper: true,
    	events: currentEvents,
    	editable: true
    })

    var prepare = function(options, originalOptions, jqXHR) {
      var token;
      if (!options.crossDomain) {
        token = $('meta[name="csrf-token"]').attr('content');
        if (token) {
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
      }
    };

    create_event = function(title, start, end){
      $.ajaxPrefilter(prepare);
      $.ajax({
        type: "post",
        url: "/events/create",
        data: {
          title: title,
          start: start.toISOString(),
          end: end.toISOString()
        }
      }).done(function(data){
        alert("登録しました!");
      }).fail(function(data){
        alert("登録できませんでした。");
      });
    };

    update_event = function(id, title, start, end){
      $.ajaxPrefilter(prepare);
      $.ajax({
        type: "post",
        url: '/events/update',
        data: {
          id: id,
          title: title,
          start: start.toISOString(),
          end: end.toISOString()
        }
      }).done(function(data){
        alert("更新しました!");
      }).fail(function(data){
        alert("更新できませんでした。");
      });
    };

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      navLinks: true,
      selectable: true,
      selectHelper: true,
      select: function(start, end) {
        var title = prompt('イベントを追加');
        var eventData;
        if (title) {
          eventData = {
            title: title,
            start: start,
            end: end
          };
          $('#calendar').fullCalendar('renderEvent', eventData, true);
          $('#calendar').fullCalendar('unselect');
          create_event(title, start, end);
        }
      },
      eventClick: function(event, element) {
        var title = prompt('イベントを変更');
        event.title = title;
        $('#calendar').fullCalendar('updateEvent', event);
        update_event(event.id, title, event.start, event.end);
      },
      timezone: 'UTC',
      events: current_events,
      editable: true
    });

});

