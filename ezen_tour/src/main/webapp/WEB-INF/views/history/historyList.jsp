<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

[이용내역 페이지]

<br>
<!-- 버튼으로 바꾸고, submit할 때, state랑 review체크해서 넘기기 -->
<c:forEach var="vo" items="${list}">
	<a href="<c:url value='/review/write.do?historyNo=${vo.historyNo}&userNo=${vo.userNo}&review=${vo.review}&name=${vo.name}'/>" style="color:black">
		<span>
			history_no=${vo.historyNo}
			user_no=${vo.userNo}
			state=${vo.state}
			pack_dno=${vo.packDno}
			price=${vo.price}
			review=${vo.review}
			koreaDep=${vo.koreaDep}
			koreaEnt=${vo.koreaEnt}
			name=${vo.name}
		</span>
	</a>
	<br>
</c:forEach>


<%@ include file="../inc/bottom.jsp" %>