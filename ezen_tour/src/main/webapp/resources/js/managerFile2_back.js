//이미지 미리보기 및 업로드 부분
$(function(){
	var uploadFiles = [];
	var $drop = $(".drop");
	var files =[];

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
				var div = '<div class="thumb"> \<div class="close" data-idx="'
				+ idx + '">X</div> \<img src="' + e.target.result + '" title="'
				+ escape(f.name) + '"/> \</div>';
				$("#thumbnails").append(div);
			};
		})(file, idx);
		reader.readAsDataURL(file);
	}

	/*$("#test").on("click", function() {
		var formData = new FormData();
		$.each(uploadFiles, function(i, file) {
			if(file.upload != 'disable')  //삭제하지 않은 이미지만 업로드 항목으로 추가
			formData.append('upload-file', file, file.name);
		});*/
	/*$.ajax({
		url: '/api/etc/file/upload',
	    data : formData,
	    type : 'post',
	    contentType : false,
	    processData: false,
	    success : function(ret) {
	    	alert("완료");
	    	}
		});
	});*/
	
	$("#thumbnails").on("click", ".close", function(e) {
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		uploadFiles[idx].upload = 'disable';  //삭제된 항목은 업로드하지 않기 위해 플래그 생성
		$target.parent().remove();  //프리뷰 삭제
		//파일도 같이 업로드에서 제외처리(테스트 중)
	});
	
	$("#test").click(function(){
		$("#packImages").prop("files",files);//드래그&드랍한 이미지 input type=file에 저장
	});
});