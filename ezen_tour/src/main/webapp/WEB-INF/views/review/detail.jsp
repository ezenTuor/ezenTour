<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style type="text/css">
	.reviewDetail {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select:none;
		width: 60%;
		margin: auto;
	}

	a {
	 	color: black;
		text-decoration: none;
	}

	p {
		text-align: left;
	}
</style>

<div class="reviewDetail">
	<p>[패키지] 상세 패키지 명</p>
	
	<br>
	
	<p style="float: right">★(${vo.score})</p>
	<p>${vo.title}</p>
	<p style="float: right"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></p>
	<p>홍길동</p>
	<hr>
	
	<br>
	
	<div>
		<% pageContext.setAttribute("newLine", "\r\n"); %>
		<c:set var="content" value="${fn:replace(vo.content, newLine,'<br>')}"/>
		<p>${content}</p>
	</div>
	
	<br>
	
	<hr>
	<div style="text-align: center">
		<button onclick="location.href='<c:url value="/review/edit.do?no=${param.no}"/>'">수정하기</button>
		<button onclick="location.href='<c:url value="/review/delete.do?no=${param.no}"/>'">삭제하기</button>
		<button onclick="location.href='<c:url value="/review/list.do"/>'">목록으로</button>

		<%-- <a href='<c:url value="/review/edit.do?no=${param.no}"/>'>수정</a> |
		<a href='<c:url value="/review/delete.do?no=${param.no}"/>'>삭제</a> |
		<a href='<c:url value="/review/list.do"/>'>목록</a> --%>
	</div>
</div>

<br>

<%@ include file="../inc/bottom.jsp"%>