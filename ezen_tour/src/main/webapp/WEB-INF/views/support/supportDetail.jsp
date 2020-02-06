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
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.name}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.regdate}</span>
		</div>
		
		<div class="lastDiv">	
			<p class="content">${content }</p>
		</div>
		<div class="center">
			<a href='#'>수정</a>
        	<a href='#'>삭제</a>
        	<a href='#'>답변</a>
        	<a href='<c:url value="/support/support.do"/>'>목록</a>			
		</div>
	</div>
</body>
</html>