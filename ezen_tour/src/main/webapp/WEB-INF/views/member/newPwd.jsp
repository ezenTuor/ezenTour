<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function () {
		$("#submit").click(function () {
			if($("#newPwd").val() != $("#newPwdSec").val()){
				alert("입력된 비밀번호가 일치하지 않습니다.");
				event.preventDefault();
				$("#newPwdSec").focus();
			}
		});
	});
</script>
</head>
<body>
	<form action="<c:url value='/member/newPwd.do'/>" method="post">
		<label>새 비밀번호</label>
		<input type="text" id="newPwd" name="newPwd"><br>
		<label>비밀번호 확인</label>
		<input type="text" id="newPwdSec" name="newPwdSec">
		<input type="submit" id="submit" value="변경">
	</form>
</body>
</html>