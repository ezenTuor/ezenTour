<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packageListDetail.css"/>
<!-- 예시:https://www.ybtour.co.kr/product/localMain.yb?menu=PKG&dspSid=AAD0000 -->
<div id="pack-list-detail">

	<div id="left-menu">
	</div>
	
	<div id="right-menu">
		<ul id="areaDetail-nav">
			<c:if test="${empty areaDetailList }">
				<span>페이지 오류입니다</span>
			</c:if>

			<c:if test="${!empty areaDetailList }">
				<c:forEach var="areaDetailVo" items="${areaDetailList }">
					<li class="areaDetail-sel"><a href=# id="${areaDetailVo.tagNo}">${areaDetailVo.name}</a></li>
				</c:forEach>
			</c:if>
		</ul>
		<div id ="pack-space">
		
		</div>

	</div>


</div>
<%@include file="../inc/bottom.jsp"%>