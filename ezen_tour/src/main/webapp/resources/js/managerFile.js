//이미지 미리보기 및 업로드 부분
var uploadFiles = [];
$(function(){
	
	var $drop = $(".drop");
	var files =[];
	
	//직접 입력의 경우
	$("#packImages").on("change", handleImgsFileSelect);
	//
	
	$drop.on("dragenter", function(e) {  //드래그 요소가 들어왔을떄
		$(this).prop("id",'drag-over');
	}).on("dragleave", function(e) {  //드래그 요소가 나갔을때
		$(this).prop("id",'');
	}).on("dragover", function(e) {
		e.stopPropagation();
		e.preventDefault();
	}).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
		e.preventDefault();
		$(this).prop("id",'');
		files = e.originalEvent.dataTransfer.files;  //드래그&드랍 항목
	  
		//기존 항목 초기화
		uploadFiles = [];
		$("#thumbnails").html("");
		
		//input type file에 강제로 넣기
		$("#packImages").prop("files",files);//드래그&드랍한 이미지 input type=file에 저장
	  
		for(var i = 0; i < files.length; i++) {
			var file = files[i];
			var size = uploadFiles.push(file);  //업로드 목록에 추가
			preview(file, size - 1);  //미리보기 만들기
			}
	});


	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
			return function(e) {
				var div = '<div class="thumb"> \<img src="' + e.target.result + '" title="'
				+ escape(f.name) + '"/> \</div>';
				$("#thumbnails").append(div);
			};
		})(file, idx);
		reader.readAsDataURL(file);
	}
});

//직접 입력의 경우
function handleImgsFileSelect(e){
	var files=e.target.files;
	var fileArr=Array.prototype.slice.call(files);
	$("#thumbnails").text("");
	
	var index=0;
	fileArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지 파일만 가능합니다.");
			return;
		}
		
		uploadFiles.push(f);
		
		var reader=new FileReader();
		reader.onload=function(e){
			var img_html="<div class='thumb'> <img id='img_id"+index+"'src=\""+e.target.result+"\" title='"+escape(f.name)+"' /></div>";
			$("#thumbnails").append(img_html);
			index++;
		}
		reader.readAsDataURL(f);
	});
}
//