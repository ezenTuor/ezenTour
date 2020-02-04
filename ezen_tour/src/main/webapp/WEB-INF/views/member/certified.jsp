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
	$(function() {
		$.ajax({
			url:"<c:url value='/pwdFind.do'/>",
			data:"#cerNum.val()=${param.sb}",
			success:function(res){
				location.href('<c:url value="/member/certify.do"/>')
			},
			error:function(xhr,status,error){
				alert("error : "+status+","+ error);
			}
		});
	});
</script>
</head>
<body>
	<form> 
		<div>
			<label >인증번호</label>
			<input type="text" name="cerNum" id="cerNum" placeholder="인증번호"
			value="${param.sb}">
			<input type="button" id="인증하기">
		</div>
	</form>
</body>
</html>