<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<article>
	<table border=1>
		<thead>
			<tr>
				<th>소분류번호</th>
				<th>출발일</th>
				<th>귀국일</th>
				<th>최소인원</th>
				<th>최대인원</th>
				<th>현재인원</th>
				<th>어른가격</th>
				<th>유아가격</th>
				<th>아동가격</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list}">
				<c:forEach var="detail" items="${list}">
					<tr>
						<td>${detail.packDno}</td>
						<td>${detail.koreaDep}</td>
						<td>${detail.koreaEnt}</td>
						<td>${detail.capecityMin}</td>
						<td>${detail.capecity}</td>
						<td>${detail.capecityCur}</td>
						<td>${detail.man}</td>
						<td>${detail.child}</td>
						<td>${detail.baby}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</article>
<%@include file="../../inc/adminBottom.jsp" %>