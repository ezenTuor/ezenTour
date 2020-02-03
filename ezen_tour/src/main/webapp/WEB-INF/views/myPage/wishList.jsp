<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="PackageWishList">
		<h2>Package WishList</h2>
		<c:if test="${!empty list }">
		${pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>

		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/wishList.do'/>" name="frmPage"
			method="post">
			<input type="text" name="currentPage">
		</form>
		<table class="box2" summary="내가 찜한 패키지">
			<caption>Package List</caption>
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 45%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">패키지 번호</th>
					<th scope="col">패키지 상세내역</th>
					<th scope="col">패키지 출발</th>
					<th scope="col">패키지 복귀</th>
					<th scope="col">찜한 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr class="align_center">
						<td colspan="5">찜 등록한 패키지가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.WISH_NO}</td>
							<td>${list.DETAIL}</td>
							<td>${list.START_DATE}</td>
							<td>${list.END_DATE}</td>
							<td>${list.WISH_DATE}</td>
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