<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="divForm">
		<div>
			<span class="sp1">작성자</span> <span>${map['userId']}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${map['regdate']}</span>
		</div>
		
		<div class="lastDiv">	
			<p class="content">${map['detail']}</p>
		</div>
		<div class="center">
        	<a href='<c:url value="/myPage/payment.do"/>'>목록</a>			
		</div>
	</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>