<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<section id="main" style="color:black">
	<h2>패키지 등록 화면</h2>
	<form name="pdWrite" method="post" enctype="multipart/form-data"
		action="<c:url value="/manager/pack/packWrite.do"/>">
		<div>
			<label for="packNo">패키지명</label>
			<input type="text" id="packNo" name="packNo">
		</div>
		
		<div>
			<label for="packImages">패키지 이미지</label>
			<input type="file" id="packImages" name="packImages" multiple>
		</div>
		
		<div>
			<label for="destination">대표 목적지</label>
			<input type="text" id="destination" name="destination">
		</div>
		
		<div>
			<label for="airport">대표 이용 항공사</label>
			<input type="text" id="airport" name="airport">
		</div>
		
		<div>
			<label for="airport">대표 이용 항공사</label>
			<input type="text" id="airport" name="airport">
		</div>
		
		<div>
			<label for="days">여행계획일</label>
			<input type="text" id="days" name="days">
		</div>
		
		<div>
			<label for="daysWeek">출발요일</label>
			<input type="text" id="daysWeek" name="daysWeek">
		</div>
		
		<input type="submit" value="전송">
	</form>
</section>
<%@include file="../../inc/adminBottom.jsp"%>