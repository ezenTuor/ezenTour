<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('textarea', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/managerFile/imageUpload.do'/>",
    });
});

</script>
	<article>
		<form action="#" method="post">
			<textarea rows="3" cols="10" id="textarea"></textarea>
		</form>
	</article>
<%@include file="../inc/bottom.jsp" %>