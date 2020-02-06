<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<style>
article.managerSchedule {
    padding: 10px;
    background: #ecf0f7;
}
.managerSchedule>h2{
	margin-left: 20%;
}
.schedule {
    width: 90%;
    border: 3px solid #8aadfb;
    margin: 30px auto;
    padding: 10px;
    background: white;
    position: relative;
}
.managerSchedule>div{
	width: 800px;
    margin: 30px auto;
}
.day{
	padding:3px;
	position: absolute;
    top: -25px;
    background: white;
    border: 2px solid #8aadfb;
}
.day>span{
	margin-left:30px;
}
</style>
	<article class="managerSchedule">
		<h2>패키지 일정</h2>
		<div>
		<c:set var="i" value="1"/>
		<c:forEach var="vo" items="${list}">
			<div class="schedule">
				
				<div class="day">
					<label>${i}일차</label>
					<span>
						${fn:substring(vo.day,0,10)}
					</span>
				</div>
				
				<%-- <div>
					<label>일정번호</label>
					<span>${vo.scheduleNo}</span>
				</div> --%>
				<div>
					${vo.detail}
				</div>
				<hr>
				<div>
					<label>식사</label>
					<span>${vo.meal}</span>
				</div>
				<hr>
				<div>
					<label>숙박</label>
					<span>${vo.hotel}</span>
				</div>
			</div>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>
		</div>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>