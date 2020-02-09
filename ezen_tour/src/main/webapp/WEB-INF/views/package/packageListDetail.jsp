<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"></c:import>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packageListDetail.css"/>
<!-- 예시:https://www.ybtour.co.kr/product/localMain.yb?menu=PKG&dspSid=AAD0000 -->
<script>
	function replaceAll(str, searchStr, replaceStr) {
		   return str.split(searchStr).join(replaceStr);
		}


	$(function() {
		$('.li-sel').click(function() {
			var id = $(this).attr('id');
			var idSplit = replaceAll(id, "|", "-");
			console.log(idSplit);
			$.ajax({
				type: "get",
				url : "<c:url value='/paLiDe.do?keyword="+ idSplit +"'/>",
				dataType: "json",
				success: function(res) {
					if(res.length>0){
						var str="";
						$.each(res, function(idx, item){
							var imageName =+ item.imgNames.split('|')[0];
							str = 
							"<li>"+
							"<a href='packSelectSchedule.do?packNo="+item.packNo+"'>"+
							"<img class='pack-img' src='"+imageName+"'>"+
							"<div class='pack-name'>"+item.name+"</div>"+
							"<div class='pack-max'>"+item.manmax+"</div>"+				
							"</li>"
							
							$("#pack-ex").append(str);
						})
					}
				},
				error: function(xhr, status, error) {
					
				}
			})//ajax
		}); //대분류클릭
	})
	
</script>

<div id="pack-list-detail">

	<div id="left-menu">
	</div>
	
	<div id="right-menu">
		<ul id="areaDetail-nav">
			<c:if test="${empty areaDetailList }">
				<span>페이지 오류입니다</span>
			</c:if>

			<c:if test="${!empty areaDetailList }">
				<c:forEach var="areaDetailVo" items="${areaDetailList }">
					<li class="areaDetail-sel"><a href="#" id="${areaDetailVo.keyword}" class="li-sel">${areaDetailVo.name}</a></li>
				</c:forEach>
			</c:if>
		</ul>
		
		<div id ="pack-space">
			<ul id="pack-ex">
				
			</ul>
		</div>

	</div>


</div>
<%@include file="../inc/bottom.jsp"%>