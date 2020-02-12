<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"></c:import>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packListSel.css"/>

<div id="packListSel">
	<ul>
	<!-- 
	
		<c:if test="${empty packTwoVo }">
			<span>페이지 오류입니다.</span>
		</c:if>
		<c:if test="${!empty packTwoVo }">
			<c:forEach var="item" items="${packTwoVo}">
			<c:set var="string3" value="${item.imgNames}"></c:set>
			<c:set var = "string4" value ="${fn:split(string3, '|')}" />
				<li>
					<img src="${string4[0]}"/>
					<div><a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo=${item.packNo }">${item.name}</a></div>
					<div>${item.manmax }원~</div>
					<div>${item.packNo }</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
	 -->
	
	<ul>
		<c:if test="${empty packList }">
			<span>검색어에 해당되는 상품이 없습니다.</span>
		</c:if>
		<c:if test="${!empty packList }">
			<c:forEach var="item" items="${packList}">
			<c:set var="string3" value="${item.imgNames}"></c:set>
			<c:set var = "string4" value ="${fn:split(string3, '|')}" />
				<li class="each-li">
					<img src="${string4[0]}" class="img-pack"/>
					<div class="title-box"><a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo=${item.packNo }" class="title-text">${item.name}</a></div>
					<div class="price-box">${item.manmax }원~</div>
					<button class="more-btn"><a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo=${item.packNo }" class="btn-text">출발일 보기</a></button>
				</li>
			</c:forEach>
		</c:if>
	</ul>

</div>
<br>
<br>
<br>
<%@include file="../inc/bottom.jsp"%>