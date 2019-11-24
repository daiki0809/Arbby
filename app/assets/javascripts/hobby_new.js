function readURL(input) {
	$('#img_prev_index').html("");
   for(i=0; i<input.files.length; i++){
   	reader = new FileReader();
  reader.readAsDataURL(input.files[i]);
    reader.onload = function (e) {
    $('#img_prev_index').append('<img src="'+ e.target.result + '" class="img_prev img_prev_add">');
     }
   }
}

$("#hobby_img").change(function(){
   readURL(this);

});
