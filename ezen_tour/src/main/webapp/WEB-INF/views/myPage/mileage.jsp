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
	
</script>
</head>
<body>
	<div id="useful">
		<h2>마일리지</h2>
		<c:if test="${!empty list }">
	${pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>

		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/mileage.do'/>" name="frmPage"
			method="post">
			<input type="text" name="currentPage">
		</form>
		<table class="box2" summary="사용 가능한 마일리지">
			<caption>마일리지 적립/사용 내역</caption>
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 40%" />
				<col style="width: 30%" />
				<col style="width: 20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">마일리지 번호</th>
					<th scope="col">마일리지 내용</th>
					<th scope="col">적립/사용 금액</th>
					<th scope="col">이용 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr class="align_center">
						<td colspan="5">받은 마일리지가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.MILEAGE_NO}</td>
							<td>${list.DETAIL}</td>
							<td>${list.POINT}</td>
							<td>${list.REGDATE}</td>
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

</body>
</html>
<%@ include file="../inc/bottom.jsp" %>