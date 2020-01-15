<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packSelect.css"/>
<div id="packSel-body">

<!-- 예시:https://www.ybtour.co.kr/product/localList.yb?menu=PKG&dspSid=AADC000&goodsCd=CIP1106 -->

	<div id="left-menu">
	
	</div>
	
	<div id="right-menu">
	
		<h3>${packVo.name}</h3>
		<div><span>${maxMin.minPrice}원</span>~<span>${maxMin.maxPrice}원</span></div>
		<div><span>주요 방문 도시 |</span>   <span>${packVo.city }</span></div>
	
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