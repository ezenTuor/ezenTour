<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
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
	<article>
		<h2>디테일 테스트중</h2>
		<form name="frm1" method="post" action="#">
			<input type="text" id="datepicker">
		</form>
		<h2>packNo 잘 받는지 테스트</h2>
		<div>
			${param.packNo}
		</div>
		
		<form name="frm" method="post" action="<c:url value='/manager/pack/detailWrite.do'/>">
			<label for="depCode">출국티켓</label>
			
			<!-- 오토컴플리스의 셀렉트기능을 이용해야함 -->
			<!-- [연 월 일 시 분]까지 가져와서 String으로 1차적으로 만든 후 simpleDateFormat을 이용해서 넘겨줘야 함 -->
			<!-- 혹은 아예 Timestamp타입이 아니라 String타입으로 해볼것 -->
			
			<!-- <input type="text" name="depCode">
			<select id="koreaDepHour" name="koreaDepHour"></select> -->
		</form>
		
		
	</article>
<%@include file="../../inc/adminBottom.jsp"%>