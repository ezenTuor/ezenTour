<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>">
<script type="text/javascript">
	$( function() {
		$( "#datepicker" ).datepicker();
	} );
</script>
	<article>
		<h2>디테일 테스트중</h2>
		<form name="frm1" method="post" action="#">
			<input type="text" id="datepicker">
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>