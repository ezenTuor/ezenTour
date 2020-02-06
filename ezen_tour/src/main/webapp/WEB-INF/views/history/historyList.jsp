<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<% int userNo=(Integer)session.getAttribute("userNo"); %>

<style type="text/css">
	a {
		text-decoration: none;
		color: black;
	}
</style>

<script type="text/javascript">
	
</script>

<p>[이용내역 페이지]</p>

<br>

<c:if test="${empty list}">
	<p>이용내역이 없습니다.</p>
</c:if>

<c:if test="${!empty list}">
	<table border="1" style="text-align:center; margin:auto">
		<caption>※여행 종료일로부터 7일 이후, 리뷰 작성이 불가합니다.</caption>
		
		<thead>
			<tr>
				<th>구매번호</th>
				<th>패키지 이름</th>
				<th>구매가격</th>
				<th>결제 상태</th>
				<th>여행 시작일</th>
				<th>여행 종료일</th>
				<th>리뷰 작성 여부</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${list}">
			<c:set var="review" value="${vo.review}"/>
				<tr>
					<td>${vo.historyNo}</td>
					<td>${vo.name}</td>
					<td>
						<fmt:formatNumber value="${vo.price}" pattern="#,###"/>원
					</td>
					<td>${vo.state}</td>
					<td>
						<fmt:formatDate value="${vo.koreaDep}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<fmt:formatDate value="${vo.koreaEnt}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<c:if test="${review=='N'}">
							<a href="<c:url value='/review/write.do?historyNo=${vo.historyNo}&userNo=${vo.userNo}&review=${vo.review}&name=${vo.name}'/>">
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

<%@ include file="../inc/bottom.jsp" %>