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
	
	$(document).ready(function() {
		$("#tab2").on("click", function() {
			$("#pack-ex").empty();
		})
	})


	$(function() {
		$('.li-sel').click(function() {
			$("#pack-ex").empty();
			var id = $(this).attr('id');
			var idSplit = replaceAll(id, "|", "-");
			console.log(idSplit);
			$.ajax({
				type: "post",
				url : "<c:url value='/paLiDe.do'/>",
				data:{keyword:idSplit},
				dataType: "json",
				success: function(res) {
					if(res.length>0){
						var str="";
						$.each(res, function(idx, item){
							var imageName = item.imgNames.split('|')[0];
							str = 
							"<li class='pack-lii'>"+
							"<a href='packSelectSchedule.do?packNo="+item.packNo+"' class='de-li-pack'>"+
							"<img class='pack-img' src='"+imageName+"'>"+
							"<div class='info-box'><div class='pack-name'>"+item.name+"</div>"+
							"<div class='pack-max'>"+item.manmax+"</div></div>"+				
							"</a></li>"
							
							$("#pack-ex").append(str);
						})
					} else {
						var str= "상품이 존재하지 않습니다";
						$("#pack-ex").append(str);	
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
		<div style="margin-bottom:15px; font-weight: 600; text-align: center">여행지를 검색해보세요!</div>
		<c:import url="/package/packCategory.do"></c:import>
	</div>
	
	<div id="mid-line">  </div>
	
	<div id="right-menu">

		<div class="tabset">
			<!-- Tab 1 -->
			<input type="radio" name="tabset" id="tab1" aria-controls="marzen"
				checked> <label for="tab1">지역별 추천</label>
			<!-- Tab 2 -->
			<input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
			<label for="tab2">조기예약 특가</label>

			<div class="tab-panels">
				<section id="marzen" class="tab-panel">
					<p>
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
					</p>
	
				</section>
				
				<section id="rauchbier" class="tab-panel">
					<p>
						<strong>준비 중입니다.</strong>
					</p>
				
				</section>
			
			</div>

		</div>


		
		
		<div id ="pack-space">
			<ul id="pack-ex">
				
			</ul>
		</div>

	</div>


</div>
<%@include file="../inc/bottom.jsp"%>