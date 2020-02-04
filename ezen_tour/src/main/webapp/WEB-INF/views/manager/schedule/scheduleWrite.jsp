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
		<form method="post" action="#" id="frm1">
			<input type="text" name="packDno" value="${param.packDno}">
			<c:set var="i" value="0"/>
			<c:forEach var="Date" items="${list}">
				<div class="schedule${i}">
					<textarea rows="5" cols="10" name="detail">디테일 부분</textarea>
					식사<input type="text" name="meal">
					날짜<input type="text" name="day" value="${Date}" readOnly="readonly">
					호텔<input type="text" name="hotel">
				</div>
			</c:forEach>
			<input type="button" value="확인" id="submit">
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>