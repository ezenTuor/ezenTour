<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ezen Tour</title>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/top.css"/>
<script type="text/javascript" src=<c:url value="/resources/js/jquery-3.4.1.min.js"/>></script>
</head>
<body>
	<h1 ><a href="${pageContext.request.contextPath}/index.do" style="text-align: center; color:black"><img src="${pageContext.request.contextPath}/resources/images/mainLogo.png" class="logo"></a></h1>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#pack-title").mouseenter(function() {
				$("#packCate").css("display", "flex");
			});
			$("#pack-title").mouseleave(function() {
				$("#packCate").css("display", "none");
			})
			$("#packCate").mouseenter(function() {
				$("#packCate").css("display", "flex");
			})
			
			$("#packCate").mouseleave(function() {
				$("#packCate").css("display", "none");
			})
		});
	</script>
	
	<section id="header-part">
		<div id="container">
		    <nav>
		        <ul>
		            <li><a href="#" style="visibility: hidden">EZEN</a></li>
		            <li id="pack-title"><a href="#">패키지 여행</a>
		            <!-- First Tier Drop Down -->
		            <ul id="packCate">
		            	<c:if test="${empty areaLi }">
							<li>페이지 오류입니다</li>
						</c:if>
			
						<c:if test="${!empty areaLi }">
							<c:forEach var="areaLiVo" items="${areaLi }">
								<li class="area-sel"><a href="${pageContext.request.contextPath}/package/packageListDetail.do?areaNo=${areaLiVo.areaNo}" id="${areaLiVo.areaNo}" class="li-sel">${areaLiVo.name}</a></li>
							</c:forEach>
						</c:if>
		            </ul>        
		            </li>
		     
		            <li><a href="#">배낭 여행</a>
		            <!-- Second Tier Drop Down -->
		            <ul>
		            </ul>        
		            </li>
		            
		            
		            <li><a href="#">마이페이지</a>
		            <!-- Third Tier Drop Down -->
		            <ul>
		                <li><a href="<c:url value='/myPage/coupon.do'/>">내가받은 쿠폰</a></li>
		                <li><a href="<c:url value='/myPage/mileage.do'/>">마일리지</a></li>
		                <li><a href="<c:url value='/myPage/payment.do'/>">결제 내역</a></li>
		                <li><a href="<c:url value='/myPage/wishList.do'/>">찜 목록</a></li>
		            </ul>        
		            </li>		            
		            
		            <li><a href="#">리뷰게시판</a>
		            <ul>
		                <li><a href="<c:url value='/review/list.do'/>">게시판 목록</a></li>
		                <li><a href="<c:url value='/history/historyList.do'/>">이용내역</a></li>
		            </ul> 
		            
		            <li><a href="#">고객센터</a></li>
		            
		            <li style="float:right; margin-right: 40px">
		               <c:if test="${!empty userNo }">
		                <a href="<c:url value='/member/logout.do'/>">로그아웃</a>
		               </c:if>
		               <c:if test="${empty userNo }">
			            <a href="<c:url value='/member/login.do'/>">로그인</a>		                	
		               </c:if>
		            </li>
		            
		        </ul>
		    </nav>
		</div>
	</section>
	