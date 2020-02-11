<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String id=(String)session.getAttribute("userId"); %>

<style type="text/css">
	.move {
		width: 80%;
		margin: auto;
	}
	
	.nextMove, .prevMove {
		width: 15%;
	}
	
	.nextMove {
		text-align: left;
	}
	.center {
		text-align: center;
	}
	.prevMove {
		text-align: right;
	}
	
	a {
		color: #663333;
		font-weight: bold;
	}
</style>

<div>
	<c:set var="prev" value="${list['PREV']}"/>
	<c:set var="next" value="${list['NEXT']}"/>
	<c:set var="id" value="<%=id %>"/>

	<table class="move">
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td>등록된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<tr>
					<td class="nextMove">
						<c:if test="${!empty next}">
							<a href="<c:url value='/review/detail.do?no=${next}'/>">◀다음글</a>
						</c:if>
					</td>
					<td class="center">
						<c:if test="${vo.userId==id}">
							<button onClick="location.href='<c:url value="/review/edit.do?no=${param.no}&pName=${vo.packName}"/>'">수정하기</button>
							<button onClick="location.href='<c:url value="/review/delete.do?no=${param.no}"/>'">삭제하기</button>
						</c:if>
						<button onClick="location.href='<c:url value="/review/list.do"/>'">목록으로</button>
					</td>
					<td class="prevMove">
						<c:if test="${!empty prev}">
							<a href="<c:url value='/review/detail.do?no=${prev}'/>">이전글▶</a>
						</c:if>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>