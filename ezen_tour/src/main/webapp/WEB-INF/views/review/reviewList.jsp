<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<style type="text/css">

</style>

<div>
<c:set var="max" value="${map['MAX']}"/>
<c:set var="min" value="${map['MIN']}"/>

<c:set var="prev" value="${list['PREV']}"/>
<c:set var="next" value="${list['NEXT']}"/>

	<table style="width: 80%; margin: auto">
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td>등록된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<tr>
					<td style="text-align: left; width:15%">
						<c:if test="${!empty next}">
							<a href="<c:url value='/review/detail.do?no=${next}'/>">☜다음글</a>
						</c:if>
					</td>
					<td style="text-align: center">
						<button onclick="location.href='<c:url value="/review/edit.do?no=${param.no}&pName=${vo.packName}"/>'">수정하기</button>
						<button onclick="location.href='<c:url value="/review/delete.do?no=${param.no}"/>'">삭제하기</button>
						<button onclick="location.href='<c:url value="/review/list.do"/>'">목록으로</button>
					</td>
					<td style="text-align: right; width:15%">
						<c:if test="${!empty prev}">
							<a href="<c:url value='/review/detail.do?no=${prev}'/>">이전글☞</a>
						</c:if>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>