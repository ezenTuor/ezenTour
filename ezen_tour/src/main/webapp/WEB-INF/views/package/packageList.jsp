<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packList.css"/>

<jsp:include page="../inc/top.jsp" flush="true"/>

<!-- 예시: https://www.ybtour.co.kr/product/main.yb?menu=PKG&dspSid=AA00000 -->


<script>
	$(function(){
		$('a').click(function(){
			$("#pack-ex").empty();
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
							if(idx%2==0){
								var imageName = item.imgNames.split('|')[0]
								str = '<li class="even"><a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo='+item.packNo+'">'+
									'<img src="'+imageName+'" id="pack-img">'+
									'<div class="smallerBox">'+
									'<div>'+item.name+'</div>'+
									'<div>'+item.city+'</div>'+
									'<div>'+item.detail+'</div>'+
									'</a></div>'+
								'</li>'
								
								$("#pack-ex").append(str);
								
								var myStylesLocation = "${pageContext.request.contextPath}/resources/css/packList.css";
								$('<style type="text/css"></style>')
							    .html('@import url("' + myStylesLocation + '")')
							    .appendTo("head");
							} else if(idx%2!==0){
								var imageName = item.imgNames.split('|')[0]
								str = '<li class="odd"><a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo='+item.packNo+'">'+
									'<img src="'+imageName+'" id="pack-img">'+
									'<div class="smallerBox">'+
									'<div>'+item.name+'</div>'+
									'<div>'+item.city+'</div>'+
									'<div>'+item.detail+'</div>'+
									'</a></div>'+
								'</li>'
								
								$("#pack-ex").append(str);	
							}
						})
					} else {
						var str= "상품이 존재하지 않습니다";
						$("#pack-ex").append(str);	
					}
				},
				error: function(xhr, status, error){
					alert("Error:"+ status+", "+error);
				}
			})
			
		})
	})
</script>


<!-- 상세 리스트로 페이지 넘길 때 쓸 것 
<c:url value='/package/packageListDetail.do?areaNo=${areaVo.areaNo}'/>" 
 -->
 
<div>
	<ul id="area-nav">
		<c:if test="${empty areaList }">
			<span>페이지 오류입니다</span>
		</c:if>  
		
		<c:if test="${!empty areaList }">
			<c:forEach var="areaVo" items="${areaList }">	
				<li class="area-sel"><a href="#" id="${areaVo.areaNo}">${areaVo.name}</a></li>
			</c:forEach>
		</c:if>
	</ul>
	
	
	<div id="pack-ex">
	
	<!-- 
	
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
	 -->
	
	</div>

	
</div>
<%@include file="../inc/bottom.jsp"%>