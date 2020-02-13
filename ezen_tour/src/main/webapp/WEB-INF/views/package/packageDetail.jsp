<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packageDetail.css"/>

<script>

	$(document).ready(function() {
		var aaa = $("#regdate").text();
		console.log(aaa);
		var curdate = new Date(aaa);
		var realDate = curdate.getTime();
		console.log(realDate)
		$("#itemCode").text(realDate);

	})
</script>


<div id="pack-detail">
	<div style="font-size: 40px;font-weight: 600; padding: 20px 0px 20px 10px;">${packVo.name }</div>
	
	<div id="fir-line"></div>
	
	<div id="pack-semi-detail">
		<div style="display: flex">상품번호   |   <div id="itemCode"></div></div> 
		<div id="regdate" style="display:none">${packVo.regdate }</div>
		<div>
		<span>고객 만족도   |  ${avgScore}점  / 5.0점</span>
		</div>
	
	</div>
	
<!-- 
	<c:set var="string3" value="${packVo.imgNames}"></c:set>
	<c:forEach items="${fn:split(string3, '|') }" var="item">
	    ${item}<br/>
	</c:forEach>

 -->
 
 <!-- ${pageContext.request.contextPath}/resources/images/mainLogo.png 이걸로 바꾸기 -->
	<!-- 캐러셀 start -->
	<div class="carousel">
		<div class="carousel-inner">
			<c:set var="string3" value="${packVo.imgNames}"></c:set>
			<c:forEach items="${fn:split(string3, '|') }" var="item" varStatus="status">
			    <input class="carousel-open" type="radio" id="carousel-${status.count }"
					name="carousel" aria-hidden="true" hidden="" checked="checked">
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/pd_images/${item}" style="width:1280px; height: 280px">
			</div>
			</c:forEach>
			<!-- 
			<input class="carousel-open" type="radio" id="carousel-1"
				name="carousel" aria-hidden="true" hidden="" checked="checked">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/0079D8/fff/?text=Without">
			</div>
			<input class="carousel-open" type="radio" id="carousel-2"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/DA5930/fff/?text=JavaScript">
			</div>
			<input class="carousel-open" type="radio" id="carousel-3"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/F90/fff/?text=Carousel">
			</div>
			 -->
			<label for="carousel-3" class="carousel-control prev control-1">‹</label>
			<label for="carousel-2" class="carousel-control next control-1">›</label>
			<label for="carousel-1" class="carousel-control prev control-2">‹</label>
			<label for="carousel-3" class="carousel-control next control-2">›</label>
			<label for="carousel-2" class="carousel-control prev control-3">‹</label>
			<label for="carousel-1" class="carousel-control next control-3">›</label>
			<ol class="carousel-indicators">
				<li><label for="carousel-1" class="carousel-bullet">•</label></li>
				<li><label for="carousel-2" class="carousel-bullet">•</label></li>
				<li><label for="carousel-3" class="carousel-bullet">•</label></li>
			</ol>
		</div>
	</div>
	<!-- 캐러셀 end -->
	
	<div id="travel-detail">
		<div id="travel-sche">
			<div class="content-1">
				<div class="guidance">
					${packVo.detail}
				</div>
			</div>
			<ul class="menu">
				<li><a href="#">여행일정</a></li>
				<li><a href="#">여행자 보험</a></li>
				<li><a href="#">참고사항</a></li>
			</ul>
			<div class="container" >
				${schDetail}
			
			</div>	

		</div>
		
		

		<div id="travel-credit">
			<div id="sticky-credit"> 
			
			<div><span style="font-weight: 600">출발</span><span><fmt:formatDate pattern="yyyy-MM-dd" value="${packDetailVo.koreaDep }" /></span></div>
			<div><span style="font-weight: 600">도착</span><span><fmt:formatDate pattern="yyyy-MM-dd" value="${packDetailVo.koreaEnt }" /></span></div>
			<div><span style="font-weight: 600">항공</span><span>${packDetailVo.airline }</span></div>
			<a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo=${packDetailVo.packNo }" id="changeDate">출발일 변경</a>
			<div style="background: white; height: 4px; margin-top: 20px; margin-bottom: 10px;"></div>
			
			<div style="font-weight: 600; font-size: 40px; margin-bottom: 30px; margin-top: 20px">여행비용</div>
			<div><span style="font-weight: 600">성인</span><span class="man-price">${packDetailVo.man }</span>원</div>
			<div><span style="font-weight: 600">아동</span><span class="child-price">${packDetailVo.child }</span>원</div>
			<div><span style="font-weight: 600">유아</span><span class="baby-price">${packDetailVo.baby }</span>원</div>
			
			<div><span style="font-weight: 600">남은좌석</span><span class="left">${packDetailVo.capecityCur }</span>석</div>
			
			
			<script type="text/javascript">
			
				$(document).ready(function () {
					
					$("select").on("change", function() {
						var manprice = $(".man-price").text();
						var childprice = $(".child-price").text();
						var babyprice = $(".baby-price").text();
						var adt = $(".adult option:selected").val();
						var chd = $(".child option:selected").val();
						var bab = $(".baby option:selected").val();
						var totalPrice = manprice*adt + childprice*chd + babyprice*bab;
						$('.total-p').val(totalPrice);
					})
					
					$(".ck-btn").on("click", function() {
						var sit = $(".left").text();
						var adt = $(".adult option:selected").val();
						var chd = $(".child option:selected").val();
						var bab = $(".baby option:selected").val();
						var total = adt*1+chd*1+bab*1;
						if(total>sit){
							event.preventDefault();
							alert("예약 가능한 인원 수를 넘어섰습니다.");
						} else if((adt+chd+bab)==0){
							event.preventDefault();
							alert("1명 이상을 선택해주세요!");
						}
					})
					
					$("form[name=intoCart]").submit(function() {
						alert("찜 목록에 추가되었습니다.")
					})
				})
			
			</script>
			
			
			<form name="intoCart" method="post"
				action="<c:url value='/package/packageDetail.do?packDno=${packDetailVo.packDno }'/>" id="intoCart">
			성인 인원 : 
				<select class="adult" name="man">
					<c:forEach var="i" begin="0" end="${packDetailVo.capecityCur }" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			<br>
				
			아동 인원 : 
				<select class="child" name="child">
					<c:forEach var="i" begin="0" end="${packDetailVo.capecityCur }" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			<br>
				
			유아 인원 : 
				<select class="baby" name="baby">
					<c:forEach var="i" begin="0" end="${packDetailVo.capecityCur }" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<input type="text" value="${packDetailVo.packDno }" name="packDno" style="display:none">
			<br>
				총 금액 : <input type="text" class="total-p" name="price" value="0" readonly="readonly">
				<input type="text" name="detail" value="별거없음.." style="display:none">
				<input type="text" name="userNo" value="${userNo} " style="display:none" >
			<br>
				<input type="submit" value="장바구니 담기" class="ck-btn">
			</form>
			</div> <!-- sticky -->
		</div>
	
	</div>
	

</div>

<%@include file="../inc/bottom.jsp"%>