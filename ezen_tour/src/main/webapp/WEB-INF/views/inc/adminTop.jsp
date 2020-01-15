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
			<div class="managerLogin">
				<a href="<c:url value='/index.do'/>">서비스 페이지 바로가기</a>
				<c:if test="${!empty sessionScope.adminId }">
					${sessionScope.name}님 환영합니다. <a href="<c:url value='/manager/logout.do'/>">로그아웃</a>
				</c:if>
				<c:if test="${empty sessionScope.adminId }">
					<form>
						<label for="adminId">아이디</label>
						<input type="text" name="adminId" id="adminId">
						<label for="adminPwd">비밀번호</label>
						<input type="text" name="adminPwd" id="adminPwd">
						<input type="submit" value="로그인">
					</form>
				</c:if>
			</div>
		</div>
		<section class="navSection">
			<div class="managerNav">
				<h3>상품관리</h3>
				<div>
					<ul>
		                <li><a href="<c:url value="/manager/pack/packWrite.do"/>">상품등록</a></li>
		                <li><a href="#">상품목록</a></li>
		                <li><a href="#">상품이벤트</a></li>
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
		                <li><a href="#">회원리스트</a></li>
		                <li><a href="#">회원등록</a></li>
		                <li><a href="#">매니저등록</a></li>
		                <li><a href="#">회원등급</a></li>
		            </ul>
				</div>
				<h3>게시판 관리</h3>
				<div>
					<ul>
		                <li><a href="#">후기게시판</a></li>
		                <li><a href="#">FAQ</a></li>
		                <li><a href="#">건의게시판</a></li>
		                <li><a href="#">공지사항</a></li>
		            </ul>
				</div>
				<h3>기타 관리</h3>
				<div>
					<ul>
		                <li><a href="#">쿠폰리스트</a></li>
		                <li><a href="#">쿠폰등록</a></li>
		            </ul>
				</div>
			</div>
		</section>
		<section class="managerMain">