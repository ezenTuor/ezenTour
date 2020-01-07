<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script type="text/javascript">
	$(function(){
		$("#userid").focus();
	
		$(".simpleForm form[name=frmLogin]").submit(function(){
			$(".infobox").each(function(){
				if($(this).val().length<1){
					$(this).next().show();
					$(this).focus();
					event.preventDefault();
				}else{
					$(this).next().hide();
				}
			});
		});
	});
</script>
</head>
<body>
<form name="frmLogin" method="post" 
	action="<c:url value='/login.do'/>">
	<fieldset>
		<legend>로그인</legend>
		<div>
			<label for="userid" class="label">아이디</label>
			<input type="text" name="userid" id="userid" 
				class="infobox">
			<span class="error">아이디를 입력하세요</span>
		</div>			
		<div>
			<label for="pwd" class="label">비밀번호</label>
			<input type="password" name="pwd" id="pwd"
				class="infobox">
			<span class="error">비밀번호를 입력하세요</span>
		</div>
		<div class="align_center">
			<input type="submit" value="로그인">
			<input type="checkbox" name="chkSave" id="chkSave">
			<label for="chkSave">아이디 저장하기</label>
		</div>
	</fieldset>
</form>
</body>
</html>