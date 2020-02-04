<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.css">
<script>
$(function(){
	$('.picker').appendDtpicker({
		'locale':'ko',
		'dateFormat': 'YYYY/MM/DD [hh:mm]'
	});
});
</script>
</head>
<body>
<h2>테스트1</h2>
	<form action="#" method="post">
		<input type="text" class="picker">
	</form>
</body>
</html>