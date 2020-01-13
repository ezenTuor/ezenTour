<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packageDetail.css"/>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>



<div id="pack-detail">
	<div>${packVo.name }</div>
	
	<div id="fir-line"></div>
	
	<div id="pack-semi-detail">
		<div>상품번호   |  00000ABC</div> 
		<div><span>고객리뷰   |  00/00</span><a href=#>여행후기</a></div>
	
	</div>
	
	<!-- 캐러셀 start -->
	<div class="carousel">
		<div class="carousel-inner">
			<input class="carousel-open" type="radio" id="carousel-1"
				name="carousel" aria-hidden="true" hidden="" checked="checked">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/0079D8/fff/?text=Without">
			</div>
			<input class="carousel-open" type="radio" id="carousel-2"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/DA5930/fff/?text=JavaScript">
			</div>
			<input class="carousel-open" type="radio" id="carousel-3"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/F90/fff/?text=Carousel">
			</div>
			<label for="carousel-3" class="carousel-control prev control-1">‹</label>
			<label for="carousel-2" class="carousel-control next control-1">›</label>
			<label for="carousel-1" class="carousel-control prev control-2">‹</label>
			<label for="carousel-3" class="carousel-control next control-2">›</label>
			<label for="carousel-2" class="carousel-control prev control-3">‹</label>
			<label for="carousel-1" class="carousel-control next control-3">›</label>
			<ol class="carousel-indicators">
				<li><label for="carousel-1" class="carousel-bullet">•</label></li>
				<li><label for="carousel-2" class="carousel-bullet">•</label></li>
				<li><label for="carousel-3" class="carousel-bullet">•</label></li>
			</ol>
		</div>
	</div>
	<!-- 캐러셀 end -->
	
	<div id="travel-detail">
		<div id="travel-sche">
		 상세 정보 들어감
		</div>
		
		<div id="travel-credit">
		결제 정보 들어감
		</div>
	
	</div>
	
	

</div>
<%@include file="../inc/bottom.jsp"%>