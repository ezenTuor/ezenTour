<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#select li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
<style type="text/css">
	#tabs{
		width: 1064px;
		margin: auto;
	}
	table{
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		margin: auto;
		width: 1064px;
	}
	table th{
		background-color: #ddd;
		border-right: 1px solid #ccc;
   		border-bottom: 1px solid #ccc;
    	border-top: 1px solid #fff;
    	border-left: 1px solid #fff;
	}
	table td{
		vertical-align: top;
    	border-right: 1px solid #ccc;
    	border-bottom: 1px solid #ccc;
    	font-size: 13px;
    	color: #424242;
    	line-height: 18px;
	}
	#tabs ul li{
		float: left;
		width: 530px;
		border-top: 1px solid gray;
		border-left: 1px solid gray;
		border-right: 1px solid gray;
		text-align: center;
		height: 55px;
		background-color: #ddd;
	}
	
	.tab-content{
			display: none;
	}

	.tab-content.current{
			display: inherit;
	}
	#tabs ul li.current{
		border-top: 1px solid black;
		border-left: 1px solid black;
		border-right: 1px solid black;
		background-color: white;
	}
	tr th{
    	text-align: center;
    	background-color: #f2f2f2;
    	font-size: 13px;
    	font-weight: 600;
    	border-right: 1px solid #e4e4e4;
    	border-bottom: 1px solid #e4e4e4;
	}
	#attention{
		width: 1064px;
		margin: auto;
		align-content: center;
		border-bottom: 1px solid gray;
		border-left: 1px solid gray;
		border-top: 1.5px solid black;
		border-right: 1px solid gray;
		margin-bottom: 30px;
		margin-top: 30px;
	}
	#information{	
    	float: left;
    	margin-top: 93px;
    	margin-bottom: 93px;
    	margin-left: 15px;
	}
	#attentionContent{
		list-style: circle;
		font-size: 13px;
    	color: #424242;
    	margin-left: 115px;
	}
</style>
<div id="tabs">
<h2 style="color: black; float: left; font-weight: bold;">내가받은 쿠폰</h2>
	<br>
	<br>
	<ul id="select">
		<li class="tab-link current" data-tab="useful">사용 가능한 쿠폰</li>
		<li class="tab-link" data-tab="n_useful">사용 불가 쿠폰</li>
	</ul>
	<br>
	<div id="useful" class="tab-content current">
		
		<br>
		<br>
		<c:if test="${!empty list }">
	${pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>

		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/coupon.do'/>" name="frmPage"
			method="post">
			<input type="hidden" name="currentPage">
		</form>
		<table class="box2" summary="사용 가능한 쿠폰">
			<colgroup>
				<col style="width: 11%" />
				<col style="width: 48%" />
				<col style="width: 11%" />
				<col style="width: 17%" />
				<col style="width: 13%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">쿠폰 번호</th>
					<th scope="col">설명</th>
					<th scope="col">할인방식</th>
					<th scope="col">할인률 / 할인금액</th>
					<th scope="col">만료날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr class="align_center">
						<td colspan="5" style="text-align: center;">사용 가능한 쿠폰이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.cuponSerial}</td>
							<td>${list.cuponDetail}</td>
							<td>${list.cuponKind}</td>
							<td class="align_right">${list.discount}</td>
							<td>${list.deldate}</td>
							<td><a href="#">취소</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="divPage">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
					src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
				</a>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<span style="color: blue; font-weight: bold">${i}</span>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})"> [${i}]</a>
				</c:if>
			</c:forEach>

			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
					src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
				</a>
			</c:if>
		</div>
	</div>


	<div id="n_useful" class="tab-content">		<br>
		<br>
		<c:if test="${!empty N_list }">
	${N_pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>

		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/coupon.do'/>" name="frmPage"
			method="post">
			<input type="hidden" name="currentPage">
		</form>
		<table class="box2" summary="사용 불가능한 쿠폰">
			<colgroup>
				<col style="width: 11%" />
				<col style="width: 48%" />
				<col style="width: 11%" />
				<col style="width: 17%" />
				<col style="width: 13%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">쿠폰 번호</th>
					<th scope="col">설명</th>
					<th scope="col">할인방식</th>
					<th scope="col">할인률 / 할인금액</th>
					<th scope="col">만료날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty N_list}">
					<tr class="align_center">
						<td colspan="5" style="text-align: center;">만기된 쿠폰이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty N_list}">
					<c:forEach var="list" items="${N_list }">
						<tr>
							<td>${N_list.cuponSerial}</td>
							<td>${N_list.cuponDetail}</td>
							<td>${N_list.cuponKind}</td>
							<td class="align_right">${N_list.discount}</td>
							<td>${N_list.deldate}</td>
							<td><a href="#">취소</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="divPage">
			<c:if test="${N_pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${N_pagingInfo.firstPage-1})"> <img
					src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
				</a>
			</c:if>

			<c:forEach var="i" begin="${N_pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==N_pagingInfo.currentPage }">
					<span style="color: blue; font-weight: bold">${i}</span>
				</c:if>
				<c:if test="${i!=N_pagingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})"> [${i}]</a>
				</c:if>
			</c:forEach>

			<c:if test="${N_pagingInfo.lastPage<N_pagingInfo.totalPage }">
				<a href="#" onclick="pageFunc(${N_pagingInfo.lastPage+1})"> <img
					src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
				</a>
			</c:if>
		</div>
	</div>
</div>
<div id="attention">
	<img src='<c:url value="/resources/images/information.jpg"/>'
		style="width: 70px; height: 70px;" id="information">
	<ul id="attentionContent">
		<li>발급받으신 쿠폰은 PC의 결제 페이지에서 사용하실 수 있습니다.</li>
		<li>모든 쿠폰은 ID당 1회 발급되며, 1개의 예약에 1개의 쿠폰만 사용하실 수 있습니다.</li>
		<li>일부 상품에는 쿠폰을 사용하실 수 없습니다.</li>
		<li>유효기간이 지난 쿠폰은 재발행 되지 않습니다.</li>
		<li>모든 쿠폰은 쿠폰의 유효기간과 상관없이 예약 및 결제 취소를 할 경우, 사용한 쿠폰은 재발급 되지 않습니다.</li>
		<li>단, 해외항공쿠폰의 경우 당일 취소 시 쿠폰의 유효기간이 남아있다면 사용한 쿠폰은 재발급 됩니다.</li>
		<li>해외항공쿠폰 사용 시, 기본요금에 한해 적용됩니다. (TAX, 유류할증료 제외)</li>
		<li>모든 쿠폰은 당사 사정에 의해 변경 및 조기 종료될 수 있습니다.</li>
	</ul>
</div>
<%@ include file="../inc/bottom.jsp" %>