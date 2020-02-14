<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 투어</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/manager.js"></script>
</head>
<body>
	<section>
		<div class="managerHeader">
			<h1 class = "managerTitle" >
				<a href="<c:url value="/manager/managerMain.do"/>">EZEN TOUR</a>
			</h1>
		</div>
		<section class="navSection">
			<div class="managerNav">
				<h3>상품관리</h3>
				<div>
					<ul>
		                <li><a href="<c:url value="/manager/pack/packWrite.do"/>">상품등록</a></li>
		                <li><a href="<c:url value='/manager/pack/packList.do'/>">상품목록</a></li>
		            </ul>  
				</div>
				<h3>주문관리</h3>
				<div>
					<ul>
		                <li><a href="#">주문리스트</a></li>
		                <li><a href="#">결제리스트</a></li>
		                <li><a href="#">주문통계</a></li>
		            </ul>       
				</div>
				<h3>사용자관리</h3>
				<div>
		            <ul>
		                <li><a href="<c:url value='/manager/member/memberList.do'/>">회원리스트</a></li>
		                <li><a href="#">회원등록</a></li>
		                <li><a href="#">매니저등록</a></li>
		                <li><a href="#">회원등급</a></li>
		            </ul>
				</div>
				<h3>건의 사항 관리</h3>
				<div>
					<ul>
		                <li><a href="<c:url value='/manager/support/supportList.do'/>">건의사항 목록</a></li>
		            </ul>
				</div>
				<h3>기타 관리</h3>
				<div>
					<ul>
		                <li><a href="<c:url value='/manager/cupon/cuponList.do'/>">쿠폰리스트</a></li>
		                <li><a href="<c:url value='/manager/cupon/cuponWrite.do'/>">쿠폰등록</a></li>
		            </ul>
				</div>
			</div>
		</section>
		<section class="managerMain">