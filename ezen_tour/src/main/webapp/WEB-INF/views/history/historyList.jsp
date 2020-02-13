<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<% int userNo=(Integer)session.getAttribute("userNo"); %>

<style type="text/css">
	.history {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select: none;
		background-color: #fff7f2;
	}

	a {
		text-decoration: none;
		color: black;
	}
	
	.historyHead, .historyBody {
		text-align: left;
	}
	
	.historyHead, .historyBody, .historyList {
		width: 65%;
		margin: auto;
	}
	
	.historyHead a {
		font-size: 1.2em;
	}
	
	.historyBody {
		height: 35px;
	}
	
	.historyBody span {
		font-size: large;
	}
	
	.historySearch {
		text-align: right;
		float: right;
	}
	.historyList {
		border: 1px solid lightgray;
		background: #fff;
	}
	
	.historyList, input[type=text] {
		text-align: center;
	}
	
	thead {
		background: #cccccc;
		margin-bottom: 10px;
		border: 1px solid lightgray;
	}
	thead tr, tbody tr {
		height: 45px;
	}
	thead th {
		border: 1px solid white;
	}
	tbody td {
		border-right: 1px solid lightgray;
	}
	
	.writeChange, .packName a {
		font-weight: bold;
	}
	
	.packName a {
		color: #330099;
	}
	
	.writeChange a, .historyBody span {
		color: red;
	}
	.writeChange span {
		color: #BBBBBB;
		text-decoration: line-through;
	}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$("#startDate").datepicker({
		/*	달력버튼
		showOn: "both",
		buttonImage: "images/calendar.gif",
		*/
		changeMonth: true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: "yy-mm-dd",
		maxDate: 0,
		onClose: function(selectedDate) {
			$("#endDate").datepicker("option", "minDate", selectedDate);
		}
	});
	
	$("#endDate").datepicker({
		/*	달력버튼
		showOn: "both",
		buttonImage: "images/calendar.gif",
		*/
		changeMonth: true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: "yy-mm-dd",
		maxDate: 0,
		onClose: function(selectedDate) {
			$("#startDate").datepicker("option", "maxDate", selectedDate);
		}
	});
	
	$("form[name=historySearch]").submit(function(){
		if($('#startDate').val().length<1){
			alert("시작일을 정해주세요");
			event.preventDefault();
			$("#startDate").focus();
		}else if($("#endDate").val().length<1){
			alert("범위를 설정해주세요");
			event.preventDefault();
			$("#endDate").focus();
		}
	});
});
</script>

<div class="history">
	<p class="historyHead">
		<br>
		<a href="<c:url value='/history/historyList.do'/>">[ 이용내역 조회 ]</a>
	</p>
	
	<br>
	
	<div class="historyBody">
		<span>
			※리뷰는 패키지 종료일 기준, 7일 이내 작성 가능합니다! &nbsp;
			<button onClick="location.href='<c:url value='/history/historyAll.do'/>'">전체 조회</button>
		</span>
		
		<form class="historySearch" name="historySearch" method="post" action="<c:url value='/history/historyMtM.do'/>">
			<input type="text" id="startDate" name="startDate" value="${param.startDate}" size="15px" readOnly>
			~
			<input type="text" id="endDate" name="endDate" value="${param.endDate}" size="15px" readOnly>
			<input type="submit" value="조회하기">
		</form>
	</div>
	
	<c:if test="${empty list}">
		<br><br>
		<p>이용내역이 없습니다.</p>
	</c:if>
	
	<c:if test="${!empty list}">
		<table class="historyList">
			<colgroup>
				<col style="width:15%;" />
				<col style="width:40%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
			</colgroup>
			
			<thead>
				<tr>
					<th scope="col">구매번호</th>
					<th scope="col">패키지 이름</th>
					<th scope="col">구매가격</th>
					<th scope="col">결제일</th>
					<th scope="col">리뷰 작성 여부</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="vo" items="${list}">
				<c:set var="check" value="${vo.check}"/>
					<tr>
						<td>${vo.historyNo}</td>
						<td class="packName">
							<a href="<c:url value='#'/>">${vo.name}</a>
						</td>
						<td>
							<fmt:formatNumber value="${vo.price}" pattern="#,###"/>원
						</td>
						<td>
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td class="writeChange">
							<c:if test="${check=='N'}">
								<a href="<c:url value='/review/write.do?historyNo=${vo.historyNo}&name=${vo.name}'/>">
									작성하기
								</a>
							</c:if>
							<c:if test="${check=='Y'}">
								<span>완료</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	
	<br>
	
	<br>
	
</div>
<%@ include file="../inc/bottom.jsp" %>