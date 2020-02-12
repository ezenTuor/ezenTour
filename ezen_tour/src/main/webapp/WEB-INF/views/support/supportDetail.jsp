<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#divForm,#replyForm,#center{
		width: 900px;
		margin: auto;
	}
	#divForm{
		font-size: 15px;
		border: 0.5px solid gray;
	}
	#firstDiv{
		font-weight: bold;
	}
	#name{
		margin: 15px;
		float: left;
	}
</style>
</head>
<body>
	<div id="divForm">
		<div id="firstDiv">
			<span class="sp1">제목</span> <span>${map['title']}</span>
		</div>
		<hr style="size: 1.5px; color: gray;">
		<div id="name">
			<span class="sp1">작성자</span> <span>${map['userId']}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${map['regdate']}</span>
		</div>
		<br>
		<br>		
		<div class="lastDiv">	
			<p class="content">${map['content']}</p>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div id="replyForm">
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">																
				<div class="firstDiv">
					<span class="sp1">제목</span> <span>${vo.title}</span>
				</div>
				<hr style="size: 1.5px; color: gray;">
				<div>
					<span class="sp1">등록일</span> <span>${vo.regdate}</span>
				</div>
				<br>
				<br>
				<div class="lastDiv">	
					<p class="content">${vo.content}</p>
				</div>
	  		</c:forEach>
	  	</c:if>
	</div>
	<div id="center">
		<a href='#'>수정하기</a>
       	<a href='#'>삭제하기</a>
       	<a href='#'>답변달기</a>
       	<a href='<c:url value="/support/support.do"/>'>목록</a>			
	</div>
</body>
</html>