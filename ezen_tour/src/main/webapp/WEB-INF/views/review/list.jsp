<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<% String userId=(String)session.getAttribute("userId"); %>

<script type="text/javascript">
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		
		document.frmPage.submit();
	}
</script>

<style type="text/css">
	.reviewList, .pagingNo, .searchForm {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select:none;
	}

	a {
		color: black;
		text-decoration: none;
	}
	
	tr {
		text-align: center;
	}
	tbody tr:nth-child(2n) {
	  background: #cce8f4;
	}
	tbody tr:nth-child(odd) {
	  background: #ffffff;
	}
	
	table {
		margin: auto;
		width: 70%;
	}
	
	td {
		height: 50px;
	}
	
	p{
		text-align: right;
	}
	
	.reviewList {
		margin: auto;
	}
	
	.pagingNo {
		text-align: center;
	}
	
	.searchForm {
		text-align: center;
	}
</style>

<form name="frmPage" method="post" action="<c:url value='/review/list.do'/>">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="currentPage">
</form>

<div>
	<br>
		
	<br>
	
	<div class="reviewList">
		<table summary="번호, 제목, 평점, 작성자, 작성일에 대한 리뷰 정보를 제공">
			<!-- <caption>[리뷰 목록]</caption> -->
			<colgroup>
				<col style="width:10%;" />
				<col style="width:50%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
			</colgroup>
	
			<thead>
				<tr style="color:#666666; font-weight: bold;">
					<td colspan="5">
						<c:if test="${empty param.searchKeyword}">
							<p>총 리뷰 ${pagingInfo.totalRecord}개</p>
						</c:if>
						<c:if test="${!empty param.searchKeyword}">
							<p>'${param.searchKeyword}', ${pagingInfo.totalRecord}건 검색되었습니다.</p>
						</c:if>
					</td>
				</tr>
				<tr style="height: 50px; border-bottom: 2px solid gray; border-top: 2px solid gray;
					background-color: #00CCFF; color:white">
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">평점</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
	
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">리뷰가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list}">
						<tr style="border-bottom: 2px solid lightgray">
							<td style="font-weight:bold">${vo.reviewNo}</td>
							<td>
								<a href="<c:url value='/review/detail.do?no=${vo.reviewNo}'/>" style="font-weight:bold; color:#000099">
									<c:if test="${fn:length(vo.title)>15}">
										${fn:substring(vo.title, 0, 15)}...
									</c:if>
									<c:if test="${fn:length(vo.title)<=15}">
										${vo.title}
									</c:if>
								</a>
							</td>
							<td style="font-weight:bold; color:red">★<span style="font-size:medium; color:black">(${vo.score})</span></td>
							<td>
								${vo.userId}
								<c:if test="${userId==vo.userId}">
									<span style="font-size:medium;">(나)</span>
								</c:if>
							</td>
							<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div style="width:70%; text-align: right; margin: auto">
		<a href='<c:url value="/review/write.do"/>' style="color:#FF6600; text-shadow: 6px 5px 5px gray; font-weight: bold;">☞리뷰 작성하기</a>
	</div>
	
	<div class="pagingNo">
		<c:if test="${pagingInfo.firstPage>1}">
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전으로">
			</a>
		</c:if>
		<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
			<c:if test="${i==pagingInfo.currentPage}">
				<span style="color: red">${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage}">
				<a href="#" onclick="pageFunc(${i})">[${i}]</a>
			</c:if>
		</c:forEach>
	
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
				<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음으로">
			</a>
		</c:if>
	</div>
	
	<div class="searchForm">
		<form name="frmSearch" method="post" action='<c:url value="/review/list.do"/>'>
			<select name="searchCondition">
				<option value="title" 
					<c:if test="${param.searchCondition=='title'}">
						selected="selected"
					</c:if>
				>제목</option>
				<option value="content" 
					<c:if test="${param.searchCondition=='content'}">
						selected="selected"
					</c:if>
				>내용</option>
			</select>
			
			<input type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<br>
	
	<br>

</div>

<%@ include file="../inc/bottom.jsp"%>