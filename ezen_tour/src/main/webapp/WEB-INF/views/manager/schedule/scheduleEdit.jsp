<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<script type="text/javascript">
	$(function(){
		/* $("#submit").click(function(){
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
		}); */
	});
</script>
	<article>
		<h2>패키지 일정 편집 화면</h2>
		<form method="post" action="<c:url value='/manager/schedule/scheduleEdit.do'/>" id="frm1">
			<input type="text" name="packDno" value="${param.packDno}">
			<c:set var="i" value="1"/>
			<c:forEach var="vo" items="${list}">
				<div class="schedule${i}">
					<h4>${i}일차</h4>
					<input type="text" name="scheduleNo" value="${vo.scheduleNo}">나중에 히든처리
					<textarea rows="5" cols="20" name="detail">${vo.detail}</textarea>
					식사<input type="text" name="meal" value="${vo.meal}">
					날짜<input type="text" name="day" value="${vo.day}" readOnly="readonly">
					호텔<input type="text" name="hotel" value="${vo.hotel}">
				</div>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			<input type="submit" value="확인">
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>