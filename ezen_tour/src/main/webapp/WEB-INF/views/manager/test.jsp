<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.css">
<script>
$(function(){
	$('.picker').appendDtpicker({
		'locale':'ko',
		'dateFormat': 'YYYY/MM/DD [hh:mm]',
		'minuteInterval': 5,
		'closeOnSelected': true
	});
});
</script>
<h2>테스트2</h2>
	<article>
		<form action="#" method="post">
			<input type="text" class="picker">
		</form>
	</article>
<%@include file="../inc/adminBottom.jsp" %>