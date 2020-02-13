<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerDetail.css">   
<article class="managerDetail">
	<h4>[${supportViewVo.userId}(${supportViewVo.name})]님의 문의사항</h4>
	<div>
		<div>${supportViewVo.title}</div>
	</div>
	<div>
		<div>${supportViewVo.content}</div>
	</div>
	<br><br><hr>
	<h4>답변</h4>
	<div>
		<div>${suportAdmin.title}</div>
	</div>
	<div>
		<div>${suportAdmin.content}</div>
	</div>
</article>

<%@include file="../../inc/adminBottom.jsp"%>