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
			[대분류]는 상품의 전체적인 방향을 제시해주며, 공통된 하나의 내용을 가지게 됩니다.
			[소분류]는 디테일한 날짜별로 입력해주시어, 패키지의 각 팀의 상세 내용을 가지게 됩니다.
			[일정]은 패키지의 각 팀의 일정을 날짜별로 가지게 됩니다.
		</div>
	</div>
	<div>
		<label>패키지명</label>
		<div>${packVo.name}</div>
	</div>
	<div>
		<label>패키지 이미지</label>
		<div>
			<c:if test="${!empty packVo.imgNames}">
				<c:forEach var="imgName" items="${fn:split(packVo.imgNames, '|') }">
					<img src="<c:url value='/resources/pd_images/${imgName}'/>">
				</c:forEach>
			</c:if>
		</div>
	</div>
</article>
<%@include file="../inc/adminBottom.jsp"%>