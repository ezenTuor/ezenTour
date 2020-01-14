<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packSelect.css"/>
<div id="packSel-body">

<!-- 예시:https://www.ybtour.co.kr/product/localList.yb?menu=PKG&dspSid=AADC000&goodsCd=CIP1106 -->

	<div id="left-menu">
	
	</div>
	
	<div id="right-menu">
	
		<h3>패키지 상품명이 들어가는 부분</h3>
		<div><span>가격최저</span>~<span>가격최대</span></div>
		<div><span>주요 방문 도시</span>   <span>주요 도시 목록</span></div>
	
		<ul>
			<li id="title-tag">
				<div class="dep">출발/도착 일시</div>
				<div class="air">항공</div>
				<div class="during">기간</div>
				<div class="packname">상품명</div>
				<div class="price">기타</div>
				<div class="res">예약상태</div>
			</li>
			
			<!-- for문 돌리기 -->
			<!-- 
			<li>
				<div class="dep">출발/도착 일시</div>
				<div class="air">항공</div>
				<div class="during">기간</div>
				<div class="packname">상품명</div>
				<div class="price">기타</div>
				<div class="res"><button value=""></div>
			</li>
			
			 -->
		</ul>
	
	</div>

</div>
<%@include file="../inc/bottom.jsp"%>