<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul li').click(function(){
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
	#tabs{
		height: 1064px;
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
	}
</style>
</head>
<body>
<div id="tabs">
<h2 style="color: black; float: left; font-weight: bold;">내가받은 쿠폰</h2>
	<br>
	<br>
	<ul>
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
			<caption>쿠폰 목록</caption>
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
			<caption>만기된 쿠폰 목록</caption>
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

</body>
</html>
<%@ include file="../inc/bottom.jsp" %>