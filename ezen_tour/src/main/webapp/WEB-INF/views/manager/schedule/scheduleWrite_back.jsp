<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			$.ajax({
				url:"<c:url value='/manager/schedule/scheduleWrite.do'/>",
				type:"post"
				,data:$("#frm1").serialize()
				,dataType:"text"
				,success:function(res){
					alert(res);
					location.href="<c:url value='/manager/detail/detailList.do?packDno=${param.packDno}'/>"
				}
				,error: function(xhr,status, error){
				    alert("에러발생");
			    }
			});
		});
	});
</script>
	<article>
		<h2>패키지 일정 등록 화면</h2>
	
		<div class='progress'>
			<img src="<c:url value='/resources/images/on.png'/>">
			<img src="<c:url value='/resources/images/on.png'/>">
			<img src="<c:url value='/resources/images/on.png'/>">
			<img src="<c:url value='/resources/images/off.png'/>">
		</div>
		<h4>3.패키지 일정 작성</h4>
		<form method="post" action="#" id="frm1">
			<input type="text" name="packDno" value="${param.packDno}">
			<c:set var="i" value="1"/>
			<c:forEach var="Date" items="${list}">
				<div class="schedule${i}">
					<h4>${i}일차</h4>
					<textarea rows="5" cols="20" name="detail">디테일 부분</textarea>
					식사<input type="text" name="meal">
					날짜<input type="text" name="day" value="${Date}" readOnly="readonly">
					호텔<input type="text" name="hotel">
				</div>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			<input type="button" value="확인" id="submit">
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>