<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packSelect.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd'});
  } );
  

	    
	    
	$(function() {
		$(document).on("change", ".dateVal", function() { 
			//ajax 붙여서 띄우기
		     //console.log($(this).val());
		     //console.log(typeof $(this).val());
		     var selDate = $(this).val();
		     $.ajax({
		    	type:"get",
		    	url:"<c:url value='/dateSelect.do?koreaDep="+ selDate +"'/>",
		    	dataType: "json",
		    	success: function(res) {
		    		console.log(res);
				},
				error: function(xhr, status, error){
					alert("Error:"+ status+", "+error);
				}
		     })
		     

		}) //내부 change function
	})
</script>

<div id="packSel-body">


<!-- 예시:https://www.ybtour.co.kr/product/localList.yb?menu=PKG&dspSid=AADC000&goodsCd=CIP1106 -->

	<div id="left-menu">
	
	</div>
	
	<div id="right-menu">

		<div class="cal-container">		 
			<div id="datepicker" class="dateVal"></div>
		</div>

		<!-- 이하 본문 -->
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