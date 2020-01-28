<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('details', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/managerFile/imageUpload.do'/>",
    });
});
</script>
<script type="text/javascript">
$( function() {
		$( "#datepicker" ).datepicker();
		
		/* var html=[];
		var value="";
		
		for(var i=0; i<24; i++){
			if(i<10){
				value="0"+i;
			}else{
				value=i;
			}
			html[i]="<option value="+value+">"+value+"</option>";
		}
		$("#koreaDepHour").append(html.join('')); */
} );
</script>
<style type="text/css">
	.triple{
		border-left:0px !important;
	}
	.double{
		border-left:0px !important;
	}
	.triple>div{
		width:25% !important;
	}
	.double>div{
		width:40% !important;
	}
	.triple>label{
		border-left:2px solid lightgray !important;
	}
	.double>label{
		border-left:2px solid lightgray !important;
	}
</style>
<article class="managerForm">
	<h2>디테일 테스트중</h2>
	<form name="frm1" method="post" action="#">
		<input type="text" id="datepicker">
	</form>
		<h2>packNo 잘 받는지 테스트</h2>
	<div>
		${param.packNo}
	</div>
	
	<h2>패키지 디테일 등록 화면</h2>
	
	<div class='progress'>
		<img src="<c:url value='/resources/images/on.png'/>">
		<img src="<c:url value='/resources/images/on.png'/>">
		<img src="<c:url value='/resources/images/off.png'/>">
		<img src="<c:url value='/resources/images/off.png'/>">
	</div>
	<h4>2.패키지 소분류 작성</h4>
	<form name="pdWrite" method="post" enctype="multipart/form-data"
		action="<c:url value="/manager/pack/detailWrite.do"/>">
		<div>
			<label for="depCode">출국티켓</label>
			<div>
				번호 : <input type="text" name="depCode">
				출발시간 : <input type="text" name="">
				도착시간 : <input type="text" name="">
			</div>
		</div>
		<div>
			<label for="entCode">입국티겟</label>
			<div>
				번호 : <input type="text" name="entCode">
				출발시간 : <input type="text" name="">
				도착시간 : <input type="text" name="">
			</div>
		</div>
		<div class="triple">
			<label for="man">성인가격</label>
			<div>
				<input type="text" name="man"> 원
			</div>
			<label for="child">유아가격</label>
			<div>
				<input type="text" name="child"> 원
			</div>
			<label for="baby">아동가격</label>
			<div>
				<input type="text" name="baby"> 원
			</div>
		</div>
		<div>
			<label for="airline">항공사명</label>
			<div>
				<input type="text" name="airline">
			</div>
		</div>
		<div>
			<label for="shopping">쇼핑여부</label>
			<div>
				<input type="radio" value="Y" name="shopping">개인 쇼핑 가능
				<input type="radio" value="N" name="shopping">개인 쇼핑 불가능
			</div>
		</div>
		
		<div>
			<label for="details">디테일</label>
			<div>
				<textarea cols="10" rows="5" name="details" ></textarea>
			</div>
		</div>
		
		<div class="double">
			<label for="capecity">수용인원</label>
			<div>
				<input type="text" name="capecity"> 명
			</div>
			
			<label for="capecityMin">최소인원</label>
			<div>
				<input type="text" name="capecityMin"> 명
			</div>
		</div>
		
		<p class="managerSubmit">
			<input type="button" value="테스트버튼" id="test">
			<input type="submit" value="전송">
		</p>
	</form>
</article>
<%@include file="../../inc/adminBottom.jsp"%>