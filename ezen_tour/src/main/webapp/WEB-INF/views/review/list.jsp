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
	.list {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select: none;
		position: relative;
	}
	.list:after {
		position: absolute;
		content : "";
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		opacity : 0.7;
		z-index: -1;
		background-color: rgba(249, 249, 249);
		background-image: url("<c:url value='/resources/images/cloud2.jpg'/>");
		background-repeat: no-repeat;
		background-size: 100% 100%;
	}

	a {
		text-decoration: none;
	}
	
	.listHead {
		font-size: 1.5em;
		color: black;
	}
	.listHead a {
		background: -webkit-linear-gradient(#003CA1, #00CCFF);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
		font-size: 1.5em;
	}
	
	.reviewList {
		opacity: 0.96;
		box-shadow: 0px 0px 20px #000;
		margin: 10px auto;
	}
	
	.count {
		color: #666666;
	}
	.count p, .write {
		text-align: right;
	}
	
	.reviewListHead {
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		background-color: #00CCFF;
		color: #fff;
	}
	
	.lists {
		border-bottom: 2px solid lightgray;
	}
	.reviewTitle a {
		color: #000066;
	}
	.score {
		color: red;
	}
	.score span, a {
		color: black;
	}
	.me, .score span {
		font-size: medium;
	}
	
	.listHead, tr, .pagingNo, .searchForm, .btn {
		text-align: center;
	}
	tbody tr:nth-child(2n) {
		background: #cce8f4;
	}
	tbody tr:nth-child(odd), .btn {
		background: #fff;
	}
	td, .reviewListHead {
		height: 50px;
	}
	
	.write, .reviewList, .count {
		width: 70%;
	}
	.write a {
		color: #FF6600;
		text-shadow: 6px 5px 3px lightgray;
	}
	
	.pagingNo span {
		color: #F2F8D7;
	}
	.pagingNo a {
		color: #003399;
	}
	.pagingNo img {
		width: 1%;
	}
	
	
	.list, .write, .count {
		margin: auto;
	}
	.listHead, .count, .reviewNo, .reviewTitle a, .score, .write a, .pagingNo a {
		font-weight: bold;
	}
	
	
	.btn {
		border-radius: 4px;
	}
	
	.null {
		height: 150px;
	}
	
	/* 네온 글씨 : 클래스명에 맞게 .neon 변경
	@font-face {
		font-family: neon;
		src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
	}
	.neon {
		font-family: neon;
		animation: neon 1s ease infinite;
		-moz-animation: neon 1s ease infinite;
		-webkit-animation: neon 1s ease infinite;
	}
	@keyframes neon {
		0%, 100% {
			text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
			color: #FED128;
		}
		50% {
			text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
			color: #806914;
		}
	}
	*/
</style>

<form name="frmPage" method="post" action="<c:url value='/review/list.do'/>">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="currentPage">
</form>

<div class="list">
	<div>
		<p class="listHead">
			<br><br><br>
			<a href="#" onClick="history.go(0)">여행 후기 게시판</a>
		</p>
		
		<br>
		
		<div class="count">
			<c:if test="${empty param.searchKeyword}">
				<p>총 리뷰 ${pagingInfo.totalRecord}개</p>
			</c:if>
			<c:if test="${!empty param.searchKeyword}">
				<p>'${param.searchKeyword}', ${pagingInfo.totalRecord}건 검색되었습니다.</p>
			</c:if>
		</div>
	
		<table class="reviewList" summary="번호, 제목, 평점, 작성자, 작성일에 대한 리뷰 정보를 제공">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:50%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
			</colgroup>
			
			<thead>
				<tr class="reviewListHead">
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">평점</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
	
			<tbody>
				<c:if test="${empty list}">
					<tr class="null">
						<td colspan="5">리뷰가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list}">
						<tr class="lists">
							<td class="reviewNo">${vo.reviewNo}</td>
							<td class="reviewTitle">
								<a href="<c:url value='/review/detail.do?no=${vo.reviewNo}'/>">
									<c:if test="${fn:length(vo.title)>15}">
										${fn:substring(vo.title, 0, 15)}...
									</c:if>
									<c:if test="${fn:length(vo.title)<=15}">
										${vo.title}
									</c:if>
								</a>
							</td>
							<td class="score">★<span>(${vo.score})</span></td>
							<td>
								${vo.userId}
								<c:if test="${userId==vo.userId}">
									<span class="me">(나)</span>
								</c:if>
							</td>
							<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div class="write">
		<a class="neon" href='<c:url value="/review/write.do"/>'>☞리뷰 작성하기</a>
	</div>
	
	<div class="pagingNo">
		<c:if test="${pagingInfo.firstPage>1}">
			<a href="#" onClick="pageFunc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/resources/images/last2.png'/>" alt="이전으로">
			</a>
		</c:if>
		<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
			<c:if test="${i==pagingInfo.currentPage}">
				<span>&nbsp;${i}&nbsp;</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage}">
				<a href="#" onClick="pageFunc(${i})">&nbsp;${i}&nbsp;</a>
			</c:if>
		</c:forEach>
	
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
			<a href="#" onClick="pageFunc(${pagingInfo.lastPage+1})">
				<img src="<c:url value='/resources/images/first2.png'/>" alt="다음으로">
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
			<input class="btn" type="submit" value="검색">
		</form>
	</div>
	
	<br><br>

</div>

<%@ include file="../inc/bottom.jsp"%>