function readURL(input) {
 	$('#img_prev_show').html("");
     for(i=0; i<input.files.length; i++){
     	reader = new FileReader();
    reader.readAsDataURL(input.files[i]);
      reader.onload = function (e) {
      $('#img_prev_show').append('<img src="'+ e.target.result + '" class="img_prev img_prev_add">');
       }
     }
 }
 $("#hobby_img_edit").change(function(){
     readURL(this);
 });