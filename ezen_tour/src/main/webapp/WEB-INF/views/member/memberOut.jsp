<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#userPwd").focus();
		
		$(".simpleForm form[name=frmOut]").submit(function(){			
			if($("#userPwd").val().length<1){
				$("#userPwd").next().show();
				$("#userPwd").focus();
				event.preventDefault();
			}else{
				$("#userPwd").next().hide();
				
				if(!confirm("회원탈퇴하시겠습니까?")){
					event.preventDefault();
				}
			}
		});
	});
</script>
<article class="simpleForm">
	<form name="frmOut" method="post" 
		action="<c:url value='/member/memberOut.do'/>">
		<fieldset>
			<legend>회원탈퇴</legend>
			<p class="p">회원탈퇴하시겠습니까?</p>
					
			<div>
				<label for="pwd" >비밀번호</label>
				<input type="password" name="userPwd" id="userPwd">
				<span class="error">비밀번호를 입력하세요</span>
			</div>
			<div class="align_center">
				<input type="submit" value="회원탈퇴">
				<input type="reset" value="취소">				
			</div>
		</fieldset>
	</form>
</article>
<%@ include file="../inc/bottom.jsp" %>