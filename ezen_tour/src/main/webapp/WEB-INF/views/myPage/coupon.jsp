<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">

</script>
</head>
<body>
<h2>내가받은 쿠폰</h2>
<div class="use_flag">
	<table class="box2" summary="사용 가능한 쿠폰">
	<caption>수령한 쿠폰 목록</caption>
	<colgroup>
		<col style="width:9%" />
		<col style="width:50%" />
		<col style="width:11%" />
		<col style="width:15%" />	
		<col style="width:15%" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">쿠폰 번호</th>
		<th scope="col">설명</th>
		<th scope="col">할인방식</th>
		<th scope="col">할인률 / 할인금액</th>	
		<th scope="col">만료날짜</th>
	  </tr>
	</thead> 
		<tbody>
			<c:if test="${empty list}">
				<tr class="align_center">
					<td colspan="5">사용 가능한 쿠폰이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">		
				<c:forEach var="map" items="${list }">
					<tr>
						<td>${map['CUPON_SERIAL']}</td>
						<td>${map['CUPON_DETAIL']}</td>
						<td>${map['CUPON_KIND']}</td>
						<td class="align_right">${map['DISCOUNT']}</td>
						<td>${map['DELDATE']}</td>
						<td><a href="#">취소</a></td>					
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>