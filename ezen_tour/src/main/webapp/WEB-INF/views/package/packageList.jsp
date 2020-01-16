<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packList.css"/>

<%@include file="../inc/top.jsp" %>
<!-- 예시: https://www.ybtour.co.kr/product/main.yb?menu=PKG&dspSid=AA00000 -->

<script>
	$(function(){
		$('a').click(function(){
			
			$.ajax({
				type:"get",
				url:"",
				dataType:"json", 
				success: function(res){
					console.log('aa');
				},
				error: function(xhr, status, error){
					alert("Error:"+ status+", "+error);
				}
			})
			
			//$('#유럽').click(function(){
			//	console.log('aa');
			//})
		})
	})
</script>

<div>
	<ul id="area-nav">
		<c:if test="${empty areaList }">
			<span>페이지 오류입니다</span>
		</c:if>  
		
		<c:if test="${!empty areaList }">
			<c:forEach var="areaVo" items="${areaList }">	
				<li class="area-sel" id="${areaVo.name}"><a href=#>${areaVo.name}</a></li>
			</c:forEach>
		</c:if>
	</ul>
	
	<div id="pack-ex">
	
	</div>

	
</div>
<%@include file="../inc/bottom.jsp"%>