<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packCategory.css"/>

<div id="pack-cate">

	<form id="search-form" name="searchFrm" method="post"
		action="<c:url value='/package/packCategory.do'/>">
		<input type="text" placeholder="검색어를 입력하세요" name="keyword" id="search-text">
		<input type="submit" value="검색" id="search-sbm">
	</form>

</div>