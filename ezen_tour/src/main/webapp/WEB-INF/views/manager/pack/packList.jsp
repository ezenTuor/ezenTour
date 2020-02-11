<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerList.css">
<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}
</script>
<article class="managerTable">
	<h2>패키지 목록</h2>
	
	<c:if test="${!empty searchVo.searchKeyword }">
	<p>검색어 : ${searchVo.searchKeyword}, 
		${pagingInfo.totalRecord }건 검색되었습니다.</p>	
	</c:if>
	
	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/manager/pack/packList.do'/>" name="frmPage" method="post">
		<input type="hidden" name="searchCondition" 
			value="${searchVo.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${searchVo.searchKeyword}">
		<input type="hidden" name="currentPage" >
	</form>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>타이틀</th>
				<th>지역분류</th>
				<th>검색 키워드</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list}">
				<c:forEach var="pack" items="${list}">
					<tr>
						<td>${pack.packNo}</td>
						<td>
							<a href="<c:url value='/manager/pack/packDetail.do?packNo=${pack.packNo}'/>">
								${pack.name}
							</a>
						</td>
						<td>${pack.areaName}</td>
						<td>${pack.keyword}</td>
						<td>${pack.regdate}</td>
						<%-- <td>
							<a href="${pageContext.request.contextPath}/manager/pack/packEdit.do?packNo=${pack.packNo}">
								<input type="button" value="수정">
							</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/manager/detail/detailList.do?packNo=${pack.packNo}">
								<input type="button" value="확인">
							</a>
						</td> --%>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div class="divPage">
		<!-- 이전블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1 }">	
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
			</a>
		</c:if>
		<!-- 페이지 번호 추가 -->						
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" 
			end="${pagingInfo.lastPage }">		
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight: bold">${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageFunc(${i})">
					[${i}]</a>
			</c:if>
		</c:forEach>
		<!--  페이지 번호 끝 -->
		
		<!-- 다음블럭으로 이동 -->
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
				<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
			</a>
		</c:if>	
	</div>
	<br>
	<div>
		<form action="<c:url value='/manager/pack/packList.do'/>" method="post">
			<select name="searchCondition">
				<option value="name"
				<c:if test="${searchVo.searchCondition=='name'}">selected="selected"</c:if>
				>타이틀</option>
				<option value="area_name"
				<c:if test="${searchVo.searchCondition=='area_name'}">selected="selected"</c:if>
				>지역</option>
				<option value="keyword"
				<c:if test="${searchVo.searchCondition=='keyword'}">selected="selected"</c:if>
				>키워드</option>
			</select>
			<input type="text" name="searchKeyword" value="${searchVo.searchKeyword}">
			<input type="submit" id="search" value="검색">
		</form>
		<input type="button" value="작성하기">
	</div>
</article>
<%@include file="../../inc/adminBottom.jsp" %>