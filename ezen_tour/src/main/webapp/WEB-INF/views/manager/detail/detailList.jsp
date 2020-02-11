<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerList.css">
<style>
	.managerTable b{
		display:inline-block;
		border: 1px solid white;
		border-radius: 5px;
		background: lightblue;
		padding:5px;
	}
</style>
<article class="managerTable">
	<h2>패키지 소분류 </h2>
	
	<h4>
		해당 패키지 - 
		<a href="<c:url value='/manager/pack/packDetail.do?packNo=${packVo.packNo}'/>"  title="패키지 확인하기">
			<b>${packVo.name}</b>
		</a>
	</h4>
	
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

	<p>
		<a href="<c:url value='/manager/detail/detailWrite.do?packNo=${packVo.packNo}'/>">
			<button>작성하기</button>
		</a>
		<a href="<c:url value='/manager/pack/packList.do'/>">
			<button>대분류목록</button>
		</a>
	</p>
</article>
<%@include file="../../inc/adminBottom.jsp" %>