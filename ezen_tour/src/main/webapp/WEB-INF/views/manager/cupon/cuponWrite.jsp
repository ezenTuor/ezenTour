<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.css">
<script type="text/javascript">
//ckeditor부분
$(function(){
	discount();
	delType();
	$("input[name=cuponKind]").click(function(){
		discount();
	});
	$("input[name=delType]").click(function(){
		delType();
	})
});

function discount(){
	var sel=$("input[name=cuponKind]:checked").val();
	$("#discount").val("");
	
	//alert(sel);
	$(".view").removeClass("notice");
	if(sel=="P"){
		$(".view").text(" 퍼센트");
	}else if(sel=="D"){
		$(".view").text(" 원");
	}else{
		$(".view").text(" * 할인 타입을 선택해주세요.");
		$(".view").addClass("notice");
	}
}

function delType(){
	var sel=$("input[name=delType]:checked").val();
	$("#deldate").val("");
	//alert(sel);
	$("#deldate").removeClass("datetimepicker");
	$('#deldate').handleDtpicker('destroy');
	$(".view2").removeClass('notice');
	if(sel=="A"){
		$("#deldate").addClass("datetimepicker");
		$(".view2").text(" 날짜를 선택해주세요.");
		$(".view2").addClass('notice');
	}else if(sel=="R"){
		$("#deldate").removeClass("datetimepicker");
		$(".view2").html(" 일 <span class='notice'>기간을 넣어주세요<span>");
	}
	datetimepicker();
}

function datetimepicker(){
	$('.datetimepicker').each(function(){
		$(this).appendDtpicker({
			'locale':'ko',
			'dateFormat': 'YYYY/MM/DD',
			'minuteInterval': 5,
			'closeOnSelected': true,
			'autodateOnStart': false,
			'futureOnly': true,
			'calendarMouseScroll': false,
			'dateOnly':true
		});
	});
}
</script>
<article class="managerForm">
	<h2>쿠폰 등록 (관리자)</h2>
	
	<form name="pdWrite" method="post" enctype="multipart/form-data"
		action="<c:url value="/manager/cupon/cuponWrite.do"/>">
		
		<div>
			<label for="cuponDetail">쿠폰 이름</label>
			<div>
				<input type="text" name="cuponDetail">
			</div>
		</div>
		
		<div>
			<label for="cuponKind">할인 타입</label>
			<div>
				<input type="radio" name="cuponKind" value="P">퍼센트
				<input type="radio" name="cuponKind" value="D">단가
			</div>
		</div>
		<div>
			<label for="discount">할인</label>
			<div>
				<input type="text" name="discount" id="discount">
				<span class="view"></span>
			</div>
		</div>
		<div>
			<label for="delType">만료 타입</label>
			<div>
				<input type="radio" name="delType" value="A">날짜형
				<input type="radio" name="delType" value="R">기간형
			</div>
		</div>
		<div>
			<label for="deldate">만료</label>
			<div>
				<input type="text" name="deldate" id="deldate">
				<span class="view2"></span>
			</div>
		</div>
		
		<p class="managerSubmit">
			<input type="button" value="테스트버튼" id="test">
			<input type="submit" value="전송">
			<a href="<c:url value='/manager/cupon/cuponList.do'/>">
				<input type="button" value="취소">
			</a>
		</p>
	</form>
</article>
<%@include file="../../inc/adminBottom.jsp"%>