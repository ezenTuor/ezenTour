<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 화면입니다.</title>
</head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.4.1.js"/>"></script>
<script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	CKEDITOR.config.allowedContent = true;
	CKEDITOR.filebrowserUploadMethod = 'form';
    CKEDITOR.replace('editor1', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/manager/imageUpload.do'/>"
    });
    CKEDITOR.on('dialogDefinition', function( ev ){
	    var dialogName = ev.data.name;
	    var dialogDefinition = ev.data.definition;
	 
	    switch (dialogName) {
	    	case 'image': //Image Properties dialog
	        	//dialogDefinition.removeContents('info');
	            dialogDefinition.removeContents('Link');
	            dialogDefinition.removeContents('advanced');
	            break;
	    }
	});
});
</script>
<body>
<form name="test" method="get" action="#">
	<textarea name="editor1" id="editor1" rows="10" cols="80">
		This is my textarea to be replaced with CKEditor.
    </textarea>
</form>
</body>
</html>