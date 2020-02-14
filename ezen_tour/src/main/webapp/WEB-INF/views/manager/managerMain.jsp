<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<article class="managerNotice">
	<h2>상품 등록 절차</h2>
	<div>
		<p class="notice">
			* 상품은 [대분류 - 소분류 - 일정]순서로 입력합니다.
		</p>
		<div>
			[대분류]는 상품의 전체적인 방향을 제시해주며, 공통된 하나의 내용을 가지게 됩니다.<br>
			[소분류]는 디테일한 날짜별로 입력해주시어, 패키지의 각 팀의 상세 내용을 가지게 됩니다.<br>
			[일정]은 패키지의 각 팀의 일정을 날짜별로 가지게 됩니다.
		</div>
		<br>
		<div>
			상품을 등록하시는 경우엔 순서대로 입력으로 넘어가게 되며<br>
			중간에 페이지를 이탈하실 경우 마지막 전송까지만 입력됩니다.<br>
			중간에 페이지를 이탈하셔도 상품이용에는 문제가 생기지 않으나,<br>
			원할한 정보 제공을 위해 일정가지 입력해 주시기 바랍니다.
		</div>
	</div>
</article>
<%@include file="../inc/adminBottom.jsp"%>