<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<script type="text/javascript">
$(function(){
	$(".editbutton").each(function(){
		$(this).hover(function(){
			$(this).attr('src','${pageContext.request.contextPath}/resources/images/edit2.png');
		}, function(){
			$(this).attr('src','${pageContext.request.contextPath}/resources/images/edit1.png');
		});
	});
});
</script>
<article>
	<table border=1>
		<thead>
			<tr>
				<th>번호</th>
				<th>타이틀</th>
				<th>작성일</th>
				<th>수정하기</th>
				<th>소분류 확인하기</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list}">
				<c:forEach var="pack" items="${list}">
					<tr>
						<td>${pack.packNo}</td>
						<td>${pack.name}</td>
						<td>${pack.regdate}</td>
						<td>
							<a href="${pageContext.request.contextPath}/manager/pack/packEdit.do?packNo=${pack.packNo}">
								<img class="editbutton"  src="${pageContext.request.contextPath}/resources/images/edit1.png">
							</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/manager/pack/detailList.do?packNo=${pack.packNo}">
								확인하기 버튼
							</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</article>
<%@include file="../../inc/adminBottom.jsp" %>