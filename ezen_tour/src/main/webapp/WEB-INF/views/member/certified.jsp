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
<!-- <script type="text/javascript">
	$(function() {
		$("#check").click(function(){
			$.ajax({
				url:"<c:url value='/member/certified.do'/>",
				data:"#cerNum.val()=${param.sb}",
				success:function(res){
					location.href='<c:url value="/member/certified.do"/>';
				},
				error:function(xhr,status,error){
					alert("error : "+status+","+ error);
				}
			});
		});
	});
</script> -->
</head>
<body>
	<form name="frm" method="post" action="<c:url value='/member/certified.do'/>" > 
		<div>
			<label >인증번호</label>
			<input type="text" name="cerNum" id="cerNum" placeholder="인증번호">
			<input type="submit" value="인증하기" id="check">
		</div>
	</form>
</body>
</html>