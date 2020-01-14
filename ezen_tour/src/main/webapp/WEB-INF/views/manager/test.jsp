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
<script type="text/javascript" src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
<script type="text/javascript">
$(function(){
    
    CKEDITOR.replace('editor1', {//해당 이름으로 된 textarea에 에디터를 적용
        filebrowserUploadUrl: "${pageContext.request.contextPath}/manager/fileTest.do"
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