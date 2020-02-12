<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<style type="text/css">
	#divForm{
		width: 900px;
		margin: auto;
	}
	#divForm{
		font-size: 15px;
		border: 0.5px solid gray;
	}
	#firstDiv{
		font-weight: bold;
	}
	#name{
		margin: 15px;
		float: left;
	}
</style>
<div id="divForm">
		<div>
			<span class="sp1">작성자</span> <span>${map['userId']}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${map['regdate']}</span>
		</div>
		<br>
		<hr style="size: 1.5px; color: gray;">
		<br>
		<div class="lastDiv">	
			<p class="content">${map['detail']}</p>
		</div>
		<div class="center">
        	<a href='<c:url value="/myPage/payment.do"/>'>목록</a>			
		</div>
	</div>
<%@ include file="../inc/bottom.jsp" %>