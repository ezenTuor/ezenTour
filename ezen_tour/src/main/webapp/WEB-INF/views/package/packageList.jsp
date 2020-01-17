<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packList.css"/>

<%@include file="../inc/top.jsp" %>
<!-- 예시: https://www.ybtour.co.kr/product/main.yb?menu=PKG&dspSid=AA00000 -->

<script>
	$(function(){
		$('a').click(function(){
			
			var id = $(this).attr('id'); 
			$.ajax({
				type:"get",
				url:"<c:url value='/areaPack.do?areaNo="+ id +"'/>",
				dataType:"json", 
				success: function(res){
					if(res.length>0){
						var str = "";
						console.log(res);
						$.each(res, function(idx, item) {
							str = "패키지 이름" + item.name + ", 패키지 등록일" + item.regdate;
							console.log(str);
						})
					}
				},
				error: function(xhr, status, error){
					alert("Error:"+ status+", "+error);
				}
			})
			
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
				<li class="area-sel"><a href=# id="${areaVo.areaNo}">${areaVo.name}</a></li>
			</c:forEach>
		</c:if>
	</ul>
	
	<div id="pack-ex">
		<ul id="packList">
			<li class="even">
				<img src="https://dimgcdn.ybtour.co.kr/TN/ad/ad33ab1dc5d49b3bec7bb72478bd0a8b.tn.410x280.jpg" id="pack-img">
				<div class="smallerBox">
					<div>name</div>
					<div>price</div>
				</div>
			</li>	
			
			<li class="odd">
				<img src="https://dimgcdn.ybtour.co.kr/TN/ad/ad33ab1dc5d49b3bec7bb72478bd0a8b.tn.410x280.jpg" id="pack-img">
				<div class="smallerBox">
					<div>name</div>
					<div>price</div>
				</div>
			</li>	
			
			<li class="even">
				<img src="https://dimgcdn.ybtour.co.kr/TN/ad/ad33ab1dc5d49b3bec7bb72478bd0a8b.tn.410x280.jpg" id="pack-img">
				<div class="smallerBox">
					<div>name</div>
					<div>price</div>
				</div>
			</li>	
			
			<li class="odd">
				<img src="https://dimgcdn.ybtour.co.kr/TN/ad/ad33ab1dc5d49b3bec7bb72478bd0a8b.tn.410x280.jpg" id="pack-img">
				<div class="smallerBox">
					<div>name</div>
					<div>price</div>
				</div>
			</li>		
		</ul>
	
	</div>

	
</div>
<%@include file="../inc/bottom.jsp"%>