// 検索欄を表示
$('#search-btn').click(function() {
	$('#search-box').slideToggle();
	$("#sesrch-icon").toggleClass("fas fa-search");
	$("#sesrch-icon").toggleClass("fas fa-ban");
});

$("#q_sorts").attr('onchange', 'submit(this.form)');