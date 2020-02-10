<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
		var nums="";
		
		$(".option").each(function(){
			var temp=$(this).find("input[type=text]").val();
			
			if($(this).find("input[type=checkbox]").is(":checked")){
				if(nums!=""){
					nums+="|";
				}
				nums+=temp;
			}
		});
		$("#wishNums").val(nums);
		$("form[name=insert]").submit();
	});
});
</script>
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
				<col style="width: 5%" />
				<col style="width: 45%" />
				<col style="width: 20%" />
				<col style="width: 15%" />
				<col style="width: 15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">패키지 번호</th>
					<th scope="col">패키지 상세내역</th>
					<th scope="col">연령대별 인원수</th>
					<th scope="col">총 가격</th>
					<th scope="col">찜한 날짜</th>
					<th scope="col">구매 여부</th>
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
						<tr class="option">
							<td>${list.wishNo}</td>
							<td>${list.detail}</td>
							<td>성인 : ${list.man}<br>
								아동 : ${list.child}<br>
								유아 : ${list.baby}</td>
							<td>${list.price}</td>
							<td>${list.wishDate}</td>
							<td>
								<input type="checkbox" >
								<input type="text" value="${list.wishNo}">나중에 히든처리
							</td>
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
		<form action="<c:url value='/payment/payment.do'/>" name="insert" method="post">
			<button id="submit">결제하기</button>
			<input type="text" id="wishNums" name="nums">나중에 히든처리
		</form>
	</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>