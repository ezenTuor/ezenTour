<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top.jsp</title>
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
		            <li><a href="#">EZEN MAIN</a></li>
		            <li><a href="#">패키지 여행</a>
		            <!-- First Tier Drop Down -->
		            <ul>
		                <li><a href="#">Themes</a></li>
		                <li><a href="#">Plugins</a></li>
		                <li><a href="#">Tutorials</a></li>
		            </ul>        
		            </li>
		     
		            <li><a href="#">배낭 여행</a>
		            <!-- Second Tier Drop Down -->
		            <ul>
		                <li><a href="#">Themes</a></li>
		                <li><a href="#">Plugins</a></li>
		                <li><a href="#">Tutorials</a></li>
		            </ul>        
		            </li>
		            
		            
		            <li><a href="#">마이페이지</a>
		            <!-- Third Tier Drop Down -->
		            <ul>
		                <li><a href="#">Themes</a></li>
		                <li><a href="#">Plugins</a></li>
		                <li><a href="#">Tutorials</a></li>
		            </ul>        
		            </li>
		            
		            <li><a href="#">고객센터</a></li>
		        </ul>
		    </nav>
		</div>
	</section>
	