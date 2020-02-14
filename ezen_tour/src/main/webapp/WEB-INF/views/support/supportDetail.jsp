<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	#divForm{
		width: 1064px;
		margin: auto;
		margin-bottom: 45px;
	}

	#detailField{
		width: 800px;
		margin: auto;
		font-size: 20px;
    	color: #424242;
	}
	#main{
		width : 810px;
		height : 480px;
		padding:5px;
		border: 1px solid gray;
		margin-bottom: 3px;
	}
	#inline{
		width: 810px;
		color: gray;
	}
	#name,#date{
		font-size: 15px;
	}
	#center a{
		color: black;
		font-size: 15px;
	}
</style>
</head>
<body>
	<div id="divForm">
	<fieldset id="detailField">
	<div id="main">
		<div id="firstDiv">
			<span class="sp1">제목</span>
			<br>
			<span>${map['title']}</span>
		</div>
		<hr style="width : 810px; color: gray;">
		<div id="name">
			<span class="sp1">작성자</span> <span>${map['userId']}</span>
		</div>
		<div id="date">
			<span class="sp1">등록일</span> <span>${map['regdate']}</span>
		</div>
		<hr style="width : 810px; color: gray;">
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
	  	<c:if test="${empty list }">
	  		답글이 없습니다.
	  	</c:if>
	</div>
	<div id="center">
		<a href='<c:url value="/support/supportEdit.do?supportNo=${supportNo}"/>'>수정하기</a>
       	<a href='<c:url value="/support/support.do"/>'>목록</a>			
	</div>
	</fieldset>
	</div>
</body>
</html>