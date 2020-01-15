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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top.css"/>
<script type="text/javascript" src=<c:url value="/resources/js/jquery-3.4.1.min.js"/>></script>
</head>
<body>
	<h1 style="text-align: center; color:black">EZEN TOUR</h1>
	<section id="header-part">
		<div id="container">
		    <nav>
		        <ul>
		            <li><a href="<c:url value="/manager/managerMain.do"/>">EZEN MANAGER MAIN</a></li>
		            <li><a href="#">상품관리</a>
		            <ul>
		                <li><a href="<c:url value="/manager/pack/packWrite.do"/>">상품등록</a></li>
		                <li><a href="#">상품목록</a></li>
		                <li><a href="#">상품이벤트</a></li>
		            </ul>        
		            </li>
		     
		            <li><a href="#">주문관리</a>
		            <ul>
		                <li><a href="#">주문리스트</a></li>
		                <li><a href="#">결제리스트</a></li>
		                <li><a href="#">주문통계</a></li>
		            </ul>        
		            </li>
		            
		            
		            <li><a href="#">사용자관리</a>
		            <ul>
		                <li><a href="#">회원리스트</a></li>
		                <li><a href="#">회원등록</a></li>
		                <li><a href="#">매니저등록</a></li>
		                <li><a href="#">회원등급</a></li>
		            </ul>        
		            </li>
		            
		            <li><a href="#">게시판관리</a>
		            <ul>
		                <li><a href="#">후기게시판</a></li>
		                <li><a href="#">FAQ</a></li>
		                <li><a href="#">건의게시판</a></li>
		                <li><a href="#">공지사항</a></li>
		            </ul>        
		            </li>
		            
		            <li><a href="#">기타 관리</a>
		            <ul>
		                <li><a href="#">쿠폰리스트</a></li>
		                <li><a href="#">쿠폰등록</a></li>
		            </ul>        
		            </li>
		        </ul>
		    </nav>
		</div>
	</section>
	