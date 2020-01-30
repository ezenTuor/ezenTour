<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<article>
	<table border=1>
		<thead>
			<tr>
				<th>번호</th>
				<th>타이틀</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list}">
				<c:forEach var="pack" items="${list}">
					<tr>
						<td>${pack.packNo}</td>
						<td>${pack.name}</td>
						<td>${pack.regdate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</article>
<%@include file="../../inc/adminBottom.jsp" %>