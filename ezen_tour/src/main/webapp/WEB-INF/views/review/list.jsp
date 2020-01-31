<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

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
	  background: lightgray;
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
			<tr>
				<td colspan="5">
					<c:if test="${empty param.searchKeyword}">
						<p>총 리뷰 ${pagingInfo.totalRecord}개</p>
					</c:if>
					<c:if test="${!empty param.searchKeyword}">
						<p>'${param.searchKeyword}', ${pagingInfo.totalRecord}건 검색되었습니다.</p>
					</c:if>
				</td>
			</tr>
			<tr style="height: 40px; border-bottom: 3px solid red">
				<!-- 검색 부분을 변형해서 정렬조건으로 변경 -->
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
					<tr>
						<td>${vo.reviewNo}</td>
						<td>
							<a href="<c:url value='/review/detail.do?no=${vo.reviewNo}'/>">
								<c:if test="${fn:length(vo.title)>15}">
									${fn:substring(vo.title, 0, 15)}...
								</c:if>
								<c:if test="${fn:length(vo.title)<=15}">
									${vo.title}
								</c:if>
							</a>
						</td>
						<td>★(${vo.score})</td>
						<td>${vo.userId}</td>
						<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tr style="border-top:1px solid gray">
			<td colspan="5" style="text-align: right">
				<a href='<c:url value="#"/>' style="color:green">☞이용내역 확인하고 리뷰 작성하기</a>
			</td>
		</tr>
	</table>
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

<br>

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

<%@ include file="../inc/bottom.jsp"%>