<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
	<article class="managerForm">
		<h2>패키지 등록 화면</h2>
		<form name="pdWrite" method="post" enctype="multipart/form-data"
			action="<c:url value="/manager/pack/packWrite.do"/>">
			<div>
				<label for="name">패키지명</label>
				<input type="text" id="name" name="name">
			</div>
			<div>
				<label for="packImages">패키지 이미지</label>
				<input type="file" id="packImages" name="packImages" multiple>
			</div>
			
			<div>
				<label for="country">해당국가</label>
				<input type="text" id="country" name="country">
			</div>
			<div>
				<label for="city">해당도시</label>
				<input type="text" id="city" name="city">
			</div>
			
			<div>
				<label for="keyword">키워드</label>
				<input type="text" id="keyword" name="keyword">
			</div>
			
			<div>
				<label for="airport">이용 항공사</label>
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
			
			<div>
				<label for="detail">상세설명</label>
				<input type="text" id="detail" name="detail">
			</div>
			
			<input type="submit" value="전송">
			
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>