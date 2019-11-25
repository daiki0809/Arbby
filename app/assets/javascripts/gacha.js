
Swal.fire('ガチャの心得', 'いかなる趣味も受け入れること!<br>これ出来ぬ者、ガチャ引くべからず！');


function repeat_show(elems$) {
	console.log('1')
		loopSleep( gon.rare, 200, function(i){elems$.eq(i).addClass('rare-show');
		});

		function loopSleep(_loopLimit,_interval, _mainFunc){
		  var loopLimit = _loopLimit;
		  var interval = _interval;
		  var mainFunc = _mainFunc;
		  var i = 0;
		  var loopFunc = function () {
		    var result = mainFunc(i);
		    if (result === false) {
		      // break機能
		      return;
		    }
		    i = i + 1;
		    if (i < loopLimit) {
		      setTimeout(loopFunc, interval);
		    }
		  }
		  loopFunc();
		}
	}

	$("#gacha button").click(function(color) {
		$(this).hide();
		$("#rare").show('slow', function(){
			repeat_show($(".rare_icon"));
		});
			if( gon.rare <= 2 ) {
				var color = "gray";
			} else if ( gon.rare <= 4 ) {
				var color = "#CC0000";
			} else {
				var color = "#D0FF43";
			}
		setTimeout(function(){
			$("#gacha_hobby").show('slow', function(){
			$(this).css('border', `10px solid ${color}`);
			})
		}, 2000);
	});