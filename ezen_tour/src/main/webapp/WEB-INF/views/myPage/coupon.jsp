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
	$( function() {
    	$( "#tabs" ).tabs();
  	});
</script>
</head>
<body>
<div id="tabs">
	<ul>
		<li><a href="#useful">사용 가능한 쿠폰</a></li>
		<li><a href="#n_useful">사용 불가 쿠폰</a></li>
	</ul>
	<div id="useful">
		<h2>내가받은 쿠폰</h2>
		<c:if test="${!empty list }">
	${pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>

		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/coupon.do'/>" name="frmPage"
			method="post">
			<input type="text" name="currentPage">
		</form>
		<table class="box2" summary="사용 가능한 쿠폰">
			<caption>수령한 쿠폰 목록</caption>
			<colgroup>
				<col style="width: 9%" />
				<col style="width: 50%" />
				<col style="width: 11%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
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
						<td colspan="5">사용 가능한 쿠폰이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.CUPON_SERIAL}</td>
							<td>${list.CUPON_DETAIL}</td>
							<td>${list.CUPON_KIND}</td>
							<td class="align_right">${list.DISCOUNT}</td>
							<td>${list.DELDATE}</td>
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


	<div id="n_useful">
		<h2>만기된 쿠폰</h2>
		<c:if test="${!empty N_list }">
	${N_pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>

		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/coupon.do'/>" name="frmPage"
			method="post">
			<input type="text" name="currentPage">
		</form>
		<table class="box2" summary="사용 불가능한 쿠폰">
			<caption>만기된 쿠폰 목록</caption>
			<colgroup>
				<col style="width: 9%" />
				<col style="width: 50%" />
				<col style="width: 11%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
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
						<td colspan="5">만기된 쿠폰이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty N_list}">
					<c:forEach var="list" items="${N_list }">
						<tr>
							<td>${N_list.CUPON_SERIAL}</td>
							<td>${N_list.CUPON_DETAIL}</td>
							<td>${N_list.CUPON_KIND}</td>
							<td class="align_right">${N_list.DISCOUNT}</td>
							<td>${N_list.DELDATE}</td>
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