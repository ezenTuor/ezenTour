<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<style>
article.managerTable {
    background: #ecf0f7;
    padding: 10px;
}
table {
    text-align: center;
    width: 90%;
    border-top: 3px solid #5a90f3;
}

th {
    padding-top: 10px;
    padding-bottom: 10px;
}

thead {
    border-bottom: 1px solid #8eb0fd;
}

img.editbutton {
    height: 40px;
}

td {
    padding-top: 5px;
    padding-bottom: 5px;
}

tbody {
    border-bottom: 2px solid #5a90f3;
}
</style>
<article class="managerTable">
	<h2>패키지 일정</h2>
	<table>
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