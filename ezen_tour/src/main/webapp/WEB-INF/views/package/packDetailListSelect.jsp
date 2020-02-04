<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp" %>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packListSel.css"/>

<div id="packListSel">

	<ul>
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

</div>
<%@include file="../inc/bottom.jsp"%>