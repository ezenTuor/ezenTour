<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
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
			var temp=$(this).find("input[type=hidden]").val();
			
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
<style type="text/css">
	#PackageWishList{
		width: 1064px;
		margin: auto;
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
    	font-size: 13px;
    	color: #424242;
    	line-height: 18px;
	}
	#PackageWishList ul li{
		float: left;
		width: 530px;
		border-top: 1px solid gray;
		border-left: 1px solid gray;
		border-right: 1px solid gray;
		text-align: center;
		height: 55px;
		background-color: #ddd;
	}
	
	#useful ul li{
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
	#attention{
		width: 1064px;
		margin: auto;
		align-content: center;
		border-bottom: 1px solid gray;
		border-left: 1px solid gray;
		border-top: 1.5px solid black;
		border-right: 1px solid gray;
		margin-bottom: 30px;
		margin-top: 30px;
	}
	#information{	
    	float: left;
    	margin-top: 93px;
    	margin-bottom: 93px;
    	margin-left: 15px;
	}
	#attentionContent{
		list-style: circle;
		font-size: 13px;
    	color: #424242;
    	margin-left: 115px;
	}
</style>
</head>
<body>
<div id="PackageWishList">
		<h2 style="color: black; float: left; font-weight: bold;">Package WishList</h2>
		<br>
		<br>
		<c:if test="${!empty list }">
		${pagingInfo.totalRecord }건 검색되었습니다.
		</c:if>
		<br>
		<br>
		<!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/myPage/wishList.do'/>" name="frmPage"
			method="post">
			<input type="hidden" name="currentPage">
		</form>
		<table class="box2" summary="내가 찜한 패키지">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 40%" />
				<col style="width: 20%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
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
						<td colspan="6" style="text-align: center;">찜 등록한 패키지가 없습니다.</td>
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
								<input type="hidden" value="${list.wishNo}">나중에 히든처리
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
			<input type="hidden" id="wishNums" name="nums">나중에 히든처리
		</form>
	</div>
	<div id="attention">
	<img src='<c:url value="/resources/images/information.jpg"/>'
		style="width: 70px; height: 70px;" id="information">
	<ul id="attentionContent">
		<li>발급받으신 쿠폰은 PC의 결제 페이지에서 사용하실 수 있습니다.</li>
		<li>모든 쿠폰은 ID당 1회 발급되며, 1개의 예약에 1개의 쿠폰만 사용하실 수 있습니다.</li>
		<li>일부 상품에는 쿠폰을 사용하실 수 없습니다.</li>
		<li>유효기간이 지난 쿠폰은 재발행 되지 않습니다.</li>
		<li>모든 쿠폰은 쿠폰의 유효기간과 상관없이 예약 및 결제 취소를 할 경우, 사용한 쿠폰은 재발급 되지 않습니다.</li>
		<li>단, 해외항공쿠폰의 경우 당일 취소 시 쿠폰의 유효기간이 남아있다면 사용한 쿠폰은 재발급 됩니다.</li>
		<li>해외항공쿠폰 사용 시, 기본요금에 한해 적용됩니다. (TAX, 유류할증료 제외)</li>
		<li>모든 쿠폰은 당사 사정에 의해 변경 및 조기 종료될 수 있습니다.</li>
	</ul>
</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>