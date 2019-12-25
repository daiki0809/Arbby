function readURL(input) {
	$('#img_prev_index').html("");
   for(i=0; i<input.files.length; i++){
   	reader = new FileReader();	//FileReaderオブジェクトを作成
  reader.readAsDataURL(input.files[i]);	//DataURIScheme文字列を取得します。
  //読み込みが正常に完了した時に発火するイベント
    reader.onload = function (e) {
    $('#img_prev_index').append('<img src="'+ e.target.result + '" class="img_prev img_prev_add">');
     }
   }
}

$("#hobby_img").change(function(){
   readURL(this);

});
