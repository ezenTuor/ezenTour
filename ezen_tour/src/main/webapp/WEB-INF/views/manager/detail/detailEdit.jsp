<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/jquery.simple-dtpicker.css">
<script>
$(function(){
	$('.datetimepicker').each(function(){
		$(this).appendDtpicker({
			'locale':'ko',
			'dateFormat': 'YYYY/MM/DD [hh:mm]',
			'minuteInterval': 5,
			'closeOnSelected': true,
			'autodateOnStart': false,
			'futureOnly': true,
			'calendarMouseScroll': false
		});
	});
});
</script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('details', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/managerFile/imageUpload.do'/>",
    });
});
</script>
<article class="managerForm">
	<h2>패키지 디테일 수정 화면</h2>
	
	<form name="pdWrite" method="post" enctype="multipart/form-data"
		action="<c:url value="/manager/detail/detailEdit.do"/>">
		<div>
			<label for="depCode">출국티켓</label>
			<div>
				번호 : <input type="text" name="depCode" autocomplete="off" value="${detailVo.depCode}">
				출발시간 : <input type="text" name="koreaDep" class="datetimepicker" autocomplete="off" value="${detailVo.koreaDep}">
				도착시간 : <input type="text" name="localEnt" class="datetimepicker" autocomplete="off" value="${detailVo.localEnt}">
			</div>
		</div>
		<div>
			<label for="entCode">입국티겟</label>
			<div>
				번호 : <input type="text" name="entCode" autocomplete="off" value="${detailVo.entCode}">
				출발시간 : <input type="text" name="localDep" class="datetimepicker" autocomplete="off" value="${detailVo.localDep}">
				도착시간 : <input type="text" name="koreaEnt" class="datetimepicker" autocomplete="off" value="${detailVo.koreaEnt}">
			</div>
		</div>
		<div>
			<label>패키지가격</label>
			<div>
				성인 : <input type="text" name="man" value="${detailVo.man}"> 원 <br>
				유아 : <input type="text" name="child" value="${detailVo.child}"> 원 <br>
				아동 : <input type="text" name="baby" value="${detailVo.baby}"> 원
			</div>
		</div>
		<div>
			<label for="airline">항공사명</label>
			<div>
				<input type="text" name="airline" value="${detailVo.airline}">
			</div>
		</div>
		<div>
			<label for="shopping">쇼핑여부</label>
			<div>
				<input type="radio" value="Y" name="shopping"
				<c:if test="${detailVo.shopping=='Y'}"> checked="checked"</c:if>
				>개인 쇼핑 가능
				<input type="radio" value="N" name="shopping"
				<c:if test="${detailVo.shopping=='N'}"> checked="checked"</c:if>
				>개인 쇼핑 불가능
			</div>
		</div>
		
		<div>
			<label for="details">디테일</label>
			<div>
				<textarea cols="10" rows="5" name="details" >${detailVo.details}</textarea>
			</div>
		</div>
		
		<div>
			<label>인원설정</label>
			<div>
				수용인원 : <input type="text" name="capecity" value="${detailVo.capecity}"> 명 <br>
				최소인원 : <input type="text" name="capecityMin" value="${detailVo.capecityMin}"> 명
				<input type="text" name="capecityCur" value="${detailVo.capecityCur}">나중에 히든처리
			</div>
		</div>
		
		<p class="managerSubmit">
			<input type="hidden" name="packDno" value="${detailVo.packDno}">
			<input type="button" value="테스트버튼" id="test">
			<input type="submit" value="전송">
		</p>
	</form>
</article>
<%@include file="../../inc/adminBottom.jsp"%>