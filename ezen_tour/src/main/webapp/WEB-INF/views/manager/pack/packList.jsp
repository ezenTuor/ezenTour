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
input[type=button]{
	padding: 3px 10px 3px 10px;
	background-color: #9ab6ea;
    border-radius: 7px;
    height: 40px;
    font-size: 16px;
    font-weight: bold;
    color: white;
}
</style>
<article class="managerTable">
	<h2>패키지 목록</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>타이틀</th>
				<th>지역분류</th>
				<th>검색 키워드</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list}">
				<c:forEach var="pack" items="${list}">
					<tr>
						<td>${pack.packNo}</td>
						<td>${pack.name}</td>
						<td>${pack.areaName}</td>
						<td>${pack.keyword}</td>
						<td>${pack.regdate}</td>
						<%-- <td>
							<a href="${pageContext.request.contextPath}/manager/pack/packEdit.do?packNo=${pack.packNo}">
								<input type="button" value="수정">
							</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/manager/detail/detailList.do?packNo=${pack.packNo}">
								<input type="button" value="확인">
							</a>
						</td> --%>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<br>
	<div>
		<select name="condition">
			<option>타이틀</option>
			<option>지역</option>
			<option>키워드</option>
		</select>
		<input type="text" name="keyword">
		<input type="button" value="작성하기">
	</div>
</article>
<%@include file="../../inc/adminBottom.jsp" %>