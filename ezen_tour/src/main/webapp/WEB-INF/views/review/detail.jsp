<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<% String userId=(String)session.getAttribute("userId"); %>

<style type="text/css">
	.detail {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select:none;
		width: 60%;
		margin: auto;
	}
	
	.packName, .score, .title {
		font-weight: bold;
	}

	a {
		text-decoration: none;
	}

	p {
		text-align: left;
	}
	
	.score {
		color: red;
	}
	.score span, a {
		color: black;
	}
	
	.title {
		color: #000099;
		float: left;
	}
	
	.score {
		text-align: right;
	}
	
	.date {
		float: right;
	}
	
	.writer span, .score span {
		font-size: medium;
	}
</style>

<div class="detail">
	<p class="packName">[패키지] ${vo.packName}</p>
	
	<br>
	
	<p class="title">${vo.title}</p>
	<p class="score">★<span>(${vo.score})</span></p>
	<p class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></p>
	<p class="writer">${vo.userId}<c:if test="${userId==vo.userId}"><span>(나)</span></c:if></p>
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
		<c:import url="/review/reviewMove.do"/>
	</div>
	
	<br>

</div>

<%@ include file="../inc/bottom.jsp"%>