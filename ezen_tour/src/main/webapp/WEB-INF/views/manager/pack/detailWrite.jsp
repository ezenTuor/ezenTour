<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('detail', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/managerFile/imageUpload.do'/>",
    });
});
</script>
<script type="text/javascript">
$( function() {
		$( "#datepicker" ).datepicker();
} );
</script>
	<article>
		<h2>디테일 테스트중</h2>
		<form name="frm1" method="post" action="#">
			<input type="text" id="datepicker">
		</form>
		
		<h2>packNo 잘 받는지 테스트</h2>
		<div>
			${param.packNo}
		</div>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>