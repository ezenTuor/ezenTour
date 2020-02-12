<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerList.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}
</script>
<article class="managerTable">
	<h2>마일리지 </h2>
	
	<h4>
		[${memberVo.name }]님의 마일리지
		<c:if test="${!empty list }">
			${pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>
		<br>
		현재 마일리지는 [${memberVo.mileage}]입니다.
	</h4>
	
	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/manager/member/mileage.do'/>" name="frmPage" method="post">
		<input type="text" name="currentPage">현재 페이지
		<input type="text" name="userId" value="${memberVo.userId}">
	</form>
	
	<table>
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
					<td colspan="5">마일리지 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="detail" items="${list}">
					<tr>
						<td>${detail.mileageNo}</td>
						<td>${detail.detail}</td>
						<td>${detail.point}</td>
						<td>${detail.regdate}</td>
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
	
	<p>
		<a href="<c:url value='/manager/member/memberDetail.do?userId=${memberVo.userId}'/>">
			<button>회원정보보기</button>
		</a>
	</p>
</article>
<%@include file="../../inc/adminBottom.jsp"%>