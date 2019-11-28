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
//= require users.coffee

// スライドショー
jQuery(function(){
	  $('.slider_index').bxSlider({
	    auto: true,           // 自動スライド
	    speed: 1000,          // スライドするスピード
	    moveSlides: 1,        // 移動するスライド数
	    pause: 3000,          // 自動スライドの待ち時間
	    maxSlides: 1,         // 一度に表示させる最大数
	    slideWidth: 300,      // 各スライドの幅
		randomStart: true,    // 最初に表示するスライドをランダムに設定
	    autoHover: true,      // ホバー時に自動スライドを停止
	    nextSelector:'#next-btn-none'
	  });
	});

jQuery(function(){
	  $('.slider_show').bxSlider({
	    auto: true,           // 自動スライド
	    speed: 1000,          // スライドするスピード
	    moveSlides: 1,        // 移動するスライド数
	    pause: 3000,          // 自動スライドの待ち時間
	    maxSlides: 1,         // 一度に表示させる最大数
	    slideWidth: 450,      // 各スライドの幅
		randomStart: true,    // 最初に表示するスライドをランダムに設定
	    autoHover: true,       // ホバー時に自動スライドを停止
	    nextSelector:'#next-btn-none'
	  });
	});

// カレンダー
jQuery(function(){
  $('#calendar-modal').click(function() {
    $('.menu-trigger').toggleClass('active');
    $('#sp-menu').fadeToggle();
    $('#calendar').fullCalendar('destroy');
      var currentEvents = {};
             $.ajaxSetup({ cache: false });
             $.ajax({
                 url: '/events/catch',
                 dataType: 'json',
                 async: false,
                 success: function(data) {
                  $('#calendar').fullCalendar({
                    lang: 'ja',
                    header: {
                      left: 'prev,next today',
                      center: 'title',
                      right: 'month,agendaWeek,agendaDay'
                    },

                    // 時間の書式
                      timeFormat: 'H(:mm)',

                     // ボタン文字列
                    buttonText: {
                          today:    '今日',
                          month:    '月',
                          week:     '週',
                          day:      '日'
                    },

                    navLinks: true,
                    selectable: true,
                    selectHelper: false,
                    events: data,
                    editable: false,

                    views: {
                      month: {
                          titleFormat: "YYYY年 MM月",
                      },
                      week: {
                          titleFormat: "YYYY年　MM月 D日",
                          columnFormat: "dddd",
                      },
                      day: {
                          titleFormat: "YYYY年　MM月 D日",
                      }
                  },
                     // 月名称
                      monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                      // 月略称
                      monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                      // 曜日名称
                      dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
                      // 曜日略称
                      dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],

                  });
                 }
             });
  });
});

// カレンダー一括削除
jQuery(function(){
  $("#event-delete_all_btn").click(function(){
  Swal.fire({
    title: '本当に削除しますか？',
    text: '一度削除すると、イベントは戻せません',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'OK'
  }).then((result) => {
    if (result.value) {
      $.ajax({
        url: '/events/delete_all',
        type: 'delete',
      });
    }
  });
});
});

// ハンバーガメニュー
jQuery(function(){
  $(function() {
    $('.menu-trigger').on('click', function() {
      $(this).toggleClass('active');
      $('#sp-menu').fadeToggle();
      return false;
    });
   });
});