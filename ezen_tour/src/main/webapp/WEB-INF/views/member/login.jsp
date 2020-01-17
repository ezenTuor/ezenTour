<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script type="text/javascript">
	$(function(){
		$("#userid").focus();
		$(".error").hide();
	
		$("form[name=frmLogin]").submit(function(){
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
		$("#FindId").click(function() {
			window.open("<c:url value='/member/idFind.do'/>","아이디 찾기",
					"width=700, height=600, resizable=yes");
		});
		$("#FindPwd").click(function() {
			window.open("<c:url value='/member/pwdFind.do'/>","비밀번호 찾기",
					"width=700, height=600, resizable=yes");
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
			<label for="user_id" class="label">아이디</label>
			<input type="text" name="user_id" id="user_id" 
				class="infobox">
			<span class="error">아이디를 입력하세요</span>
		</div>			
		<div>
			<label for="user_pwd" class="label">비밀번호</label>
			<input type="password" name="user_pwd" id="user_pwd"
				class="infobox">
			<span class="error">비밀번호를 입력하세요</span>
		</div>
		<div class="align_center">
			<input type="submit" value="로그인">
			<input type="checkbox" name="chkSave" id="chkSave">
			<label for="chkSave">아이디 저장하기</label>
			<a id="FindId" href="#" style="color: black">Find ID</a>
			<a id="FindPwd" href="#" style="color: black">Find PassWord</a>
		</div>
	</fieldset>
</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>