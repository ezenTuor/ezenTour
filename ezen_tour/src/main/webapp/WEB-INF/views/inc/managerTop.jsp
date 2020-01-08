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

</head>
<body>
	<header id="main-body">
		<div id="container">
		    <nav>
		        <ul>
		            <li><a href="#">Home</a></li>
		            <li><a href="#">WordPress</a>
		            <!-- First Tier Drop Down -->
		            <ul>
		                <li><a href="#">Themes</a></li>
		                <li><a href="#">Plugins</a></li>
		                <li><a href="#">Tutorials</a></li>
		            </ul>        
		            </li>
		            <li><a href="#">Web Design</a>
		            <!-- First Tier Drop Down -->
		            <ul>
		                <li><a href="#">Resources</a></li>
		                <li><a href="#">Links</a></li>
		                <li><a href="#">Tutorials</a>
		            	<!-- Second Tier Drop Down -->
		                <ul>
		                    <li><a href="#">HTML/CSS</a></li>
		                    <li><a href="#">jQuery</a></li>
		                    <li><a href="#">Other</a>
		                        <!-- Third Tier Drop Down -->
		                        <ul>
		                            <li><a href="#">Stuff</a></li>
		                            <li><a href="#">Things</a></li>
		                            <li><a href="#">Other Stuff</a></li>
		                        </ul>
		                    </li>
		                </ul>
		                </li>
		            </ul>
		            </li>
		            <li><a href="#">Graphic Design</a></li>
		            <li><a href="#">Inspiration</a></li>
		            <li><a href="#">Contact</a></li>
		            <li><a href="#">About</a></li>
		        </ul>
		    </nav>
		</div>
	</header>
	
	