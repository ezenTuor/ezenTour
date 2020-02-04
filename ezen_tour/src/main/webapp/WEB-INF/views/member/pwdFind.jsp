<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<div>
  		<form action="<c:url value='/member/pwdFind.do'/>" method="post">
    		<p>
    			<input type="text" name="userId" id="userId" value="${param.userId}"
    			placeholder="ID">
    		</p>
    		<p>
    			<input type="text" name="email1"  id="email1" value="${param.email1}" 
    			placeholder="E-mail">@
        			<select name="email2" id="email2"  title="이메일주소 뒷자리">
            			<option value="naver.com">naver.com</option>
            			<option value="hanmail.net">hanmail.net</option>
            			<option value="nate.com">nate.com</option>
            			<option value="gmail.com">gmail.com</option>
            			<option value="etc">직접입력</option>
        			</select>
        		<input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        			style="visibility:hidden" value="${param.email3}">
    		</p>
        	<input type="submit" value="확인">
    	</form>
  	</div>
</body>
</html>