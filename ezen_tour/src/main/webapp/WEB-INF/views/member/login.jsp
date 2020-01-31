<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
var j_ctxPath="/tour";
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
		$("#FindId").click(function(){
			window.open(j_ctxPath+"/member/idFind.do","아이디 찾기",
			"width=500,height=600,left=0,top=0,location=yes,resizable=yes");	
		});
		
		$("#FindPwd").click(function(){
			window.open(j_ctxPath+"/member/pwdFind.do","비밀번호 찾기",
			"width=500,height=600,left=0,top=0,location=yes,resizable=yes");
		});
	});
</script>
<style type="text/css">
	.align_center a{
		text-decoration: none;
	}
	.search{
		margin: 10px;
	}
	fieldset{
		width: 600px;
		height: 500px;
		margin-left: 646px;
		border-color: #e4e4e5;
	}
	fieldset div{
		margin-top: 20px;
	}
	#find{
		margin-top: 10px;
		border-top: 1px solid #e4e4e5;
		width: 300px;
		margin-left: 148px;
	}
	form{
		height: 600px;
	}
	#bottom-part {
	background: gray;
	width: 100%;
	height: 250px;
	color: white;
	font-size: 7px;
	word-break: break-all;
	line-height: 32px;
	word-wrap:break-word !important;
	font-family: 'Open Sans', sans-serif;
	}
	.infobox{
		border-radius: .4em;
	}
</style>
</head>
<body>
<form name="frmLogin" method="post" 
	action="<c:url value='/login.do'/>">
	<div>
	<fieldset>
		<div align="center" style="margin-top: 150px;">
			<label for="user_id" class="label">아이디</label><br>
			<input type="text" name="user_id" id="user_id" 
				class="infobox" style="width: 300px; height: 35px;
				margin-top: 5px;">
			<span class="error">아이디를 입력하세요</span>
		</div>			
		<div align="center">
			<label for="user_pwd" class="label">비밀번호</label><br>
			<input type="password" name="user_pwd" id="user_pwd"
				class="infobox" style="width: 300px; height: 35px;
				margin-top: 5px;">
			<span class="error">비밀번호를 입력하세요</span>
		</div>
		<div align="center">
			<input type="submit" value="로그인">
			<input type="checkbox" name="chkSave" id="chkSave">
			<label for="chkSave">아이디 저장하기</label>
			<br>
		</div>
		<div id="find" align="center">
			<a id="FindId" href="#" style="color: black" class="search">Find ID</a>
			<a id="FindPwd" href="#" style="color: black" class="search">Find PassWord</a>
		</div>
	</fieldset>
	</div>
</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>