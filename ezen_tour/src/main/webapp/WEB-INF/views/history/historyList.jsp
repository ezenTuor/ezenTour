<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<% int userNo=(Integer)session.getAttribute("userNo"); %>

<style type="text/css">
	a {
		text-decoration: none;
		color: black;
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

<div style="background-color:#fff7f2">
	<p style="width:70%; margin:auto; text-align: left">
		[이용내역 조회]
	</p>
	
	<br>
	
	<div style="width:70%; margin:auto; text-align:left; height:35px">
		<span>
			※여행 종료일로부터 7일 이후, 리뷰 작성이 불가합니다.&nbsp;
			<button onclick="location.href='<c:url value='/history/historyAll.do'/>'">전체 조회하기</button>
		</span>
		
		<form name="historySearch" method="post" action="<c:url value='/history/historyMtM.do'/>"
			style="text-align: right; float:right">
			<input type="text" id="startDate" name="startDate" value="${param.startDate}" readOnly
				size="15px" style="text-align: center">
			~
			<input type="text" id="endDate" name="endDate" value="${param.endDate}" readOnly
				size="15px" style="text-align: center">
			<input type="submit" value="조회하기">
		</form>
	</div>
	
	<c:if test="${empty list}">
		<p>이용내역이 없습니다.</p>
	</c:if>
	
	<c:if test="${!empty list}">
		<table style="text-align:center; margin:auto; width:70%; border:1px solid lightgray; background:#ffffff">
			<thead style="background:lightgray; margin-bottom:10px">
				<tr style="height:40px">
					<th>구매번호</th>
					<th>패키지 이름</th>
					<th>구매가격</th>
					<th>결제 상태</th>
					<th>결제일</th>
					<th>리뷰 작성 여부</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="vo" items="${list}">
				<c:set var="review" value="${vo.review}"/>
					<tr style="height:45px">
						<td>${vo.historyNo}</td>
						<td>
							<a href="<c:url value='#'/>">
								${vo.name}
							</a>
						</td>
						<td>
							<fmt:formatNumber value="${vo.price}" pattern="#,###"/>원
						</td>
						<td>${vo.state}</td>
						<td>
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<%-- <c:if test="${vo.koreaEnt}"></c:if> --%>
							<c:if test="${review=='N'}">
								<a href="<c:url value='/review/write.do?historyNo=${vo.historyNo}&name=${vo.name}'/>">
									작성하기
								</a>
							</c:if>
							<c:if test="${review=='Y'}">
								완료
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