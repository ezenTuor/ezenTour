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
	<p>[패키지] ${vo.packName}</p>
	
	<br>
	
	<p style="float: right">★(${vo.score})</p>
	<p>${vo.title}</p>
	<p style="float: right"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></p>
	<p>${vo.userId}</p>
	<hr>
	
	<br>
	
	<div>
		<% pageContext.setAttribute("newLine", "\r\n"); %>
		<c:set var="content" value="${fn:replace(vo.content, newLine,'<br>')}"/>
		<p>${content}</p>
	</div>
	
	<br>
	
	<hr>
	<div>
		<c:import url="/review/reviewList.do"/>
	</div>
</div>

<br>

<%@ include file="../inc/bottom.jsp"%>