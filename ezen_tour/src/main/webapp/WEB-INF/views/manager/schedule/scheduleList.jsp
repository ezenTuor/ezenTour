<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
	<article>
		<h2>패키지 일정</h2>
			<c:set var="i" value="1"/>
			<c:forEach var="vo" items="${list}">
				<div class="schedule${i}">
					<h4>${i}일차</h4>
					일정번호 - ${vo.scheduleNo} <br>
					내용 - ${vo.detail} <br>
					day - ${vo.day} <br>
					식사 - ${vo.meal} <br>
					숙박 - ${vo.hotel}
				</div>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>