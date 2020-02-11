<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerDetail.css">
<article class="managerDetail">
	<h2>회원 정보 상세보기</h2>
	<div>
		<label>유저번호</label>
		<div>${memberVo.userNo}</div>
	</div>
	<div>
		<label>아이디</label>
		<div>${memberVo.userId}</div>
	</div>
	<div>
		<label>이름</label>
		<div>${memberVo.name}</div>
	</div>
	<div>
		<label>우편번호</label>
		<div>${memberVo.zipcode}</div>
	</div>
	<div>
		<label>주소</label>
		<div>${memberVo.address} ${memberVo.addressDetail}</div>
	</div>
	<div>
		<label>연락처</label>
		<c:if test="${!empty memberVo.hp1}">
			<div>${memberVo.hp1 }-${memberVo.hp2 }-${memberVo.hp3 }</div>
		</c:if>
		<c:if test="${empty memberVo.hp1}">
			<div>입력사항 없음</div>
		</c:if>
	</div>
	<div>
		<label>이메일</label>
		<c:if test="${!empty memberVo.email1}">
			<div>${memberVo.email1 }@${memberVo.email2 }</div>
		</c:if>
		<c:if test="${empty memberVo.email1}">
			<div>입력사항 없음</div>
		</c:if>
	</div>
	<div>
		<label>회원 등급</label>
		<div>${memberVo.grade}</div>
	</div>
	<div>
		<label>가입일</label>
		<div>${memberVo.regdate}</div>
	</div>
	<div>
		<label>탈퇴일</label>
		<c:if test="${!empty memberVo.deldate}">
			<div>${memberVo.deldate }</div>
		</c:if>
		<c:if test="${empty memberVo.deldate }">
			<div>해당 사항이 없습니다.</div>
		</c:if>
	</div>
	<div>
		<label>마일리지</label>
		<div>${memberVo.mileage}</div>
	</div>
</article>
<%@include file="../../inc/adminBottom.jsp"%>