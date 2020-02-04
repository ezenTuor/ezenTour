<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript">
	$(function(){
		$("#userId").focus();
		
		$("form[name=frm]").submit(function(){
			if($("#userId").val().length<1){
				$(".error").show();
				$("#userId").focus();
				event.preventDefault();
			}
		});
		
		$("#btUse").click(function(){
			$(opener.document).find("#userId").val("${param.userid}");
			$(opener.document).find("#chkId").val("Y");
			$(opener.document).find("#userId")
				.attr("readonly","readonly");
			
			self.close();
		});
		
	});
</script>
</head>
<body>
<h1>아이디 중복검사</h1>
	<form name="frm" method="post" 
		action="<c:url value='/member/idCheck.do'/>">
		<label for="userId">아이디</label>
		<input type="text" name="userId" id="userId"
			value="${param.userid}">
		<input type="submit" value="아이디 확인">
		<span class="error">아이디를 입력하세요</span>
		
		<c:if test="${result==EXIST_ID }">		
			<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
		</c:if>	
		<c:if test="${result==USEFUL_ID }">		
			<button id="btUse" type="button">사용하기</button>
			<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>
		
	</form>
</body>
</html>