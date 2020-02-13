<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerDetail.css">
<article class="managerDetail">
	<h2>상품 등록 절차</h2>
	<div>
		상품은 [대분류 - 소분류 - 일정]순서로 입력합니다.
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