<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery파일 추가 부분 -->
<script type="text/javascript">
$(function(){
	$("#email2").change(function(){
		if($(this).val()=='etc'){
			$("#email3").val("");
			$("#email3").css("visibility","visible");
			$("#email3").focus();				
		}else{
			$("#email3").css("visibility","hidden");
		}
	});
	
	$("#btnChkId").click(function(){
		var userid=$("#userid").val();
		
		window.open(j_ctxPath+"/member/idCheck.do?user_id="+user_id,"chkId",
	"width=450,height=200,left=0,top=0,location=yes,resizable=yes");
	});
	
	$("#btChkAdminId").click(function(){
		var user_id=$("#user_id").val();
		
		window.open(j_ctxPath+"/admin/manager/idCheck.do?user_id="+user_id,"chkId",
		"width=450,height=200,left=0,top=0,location=yes,resizable=yes");
	});

		
	$("#btnZipcode").click(function(){
		window.open(j_ctxPath+"/zipcode/zipcode.do","zip",
	"width=500,height=600,left=0,top=0,location=yes,resizable=yes");		
	});
});


</script>

<script type="text/javascript">
function validate_phone(ph){
	 var pattern=new RegExp(/^[0-9]*$/g);
	 return pattern.test(ph);
}

function validate_userid(uid){
  var pattern= new RegExp(/^[a-zA-Z0-9_]+$/g);
  return pattern.test(uid);
}
</script>
</head>
<body>
	<article>
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/member/memberWrite.do'/>">
<fieldset>
	<legend>회원 가입</legend>
    <div>        
        <label for="name">성명</label>
        <input type="text" name="name" id="name">
    </div>
    <div>
        <label for="user_id">회원ID</label>
        <input type="text" name="user_id" id="user_id">&nbsp;
        <input type="button" value="중복확인" id="btnChkId" 
        	title="새창열림">
    </div>
    <div>
        <label for="user_pwd">비밀번호</label>
        <input type="Password" name="user_pwd" id="user_pwd">
    </div>
    <div>
        <label for="pwd2">비밀번호 확인</label>
        <input type="Password" name="pwd2" id="pwd2">
    </div>
    <div>
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" 
        	title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  
        	class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  class="width_350">
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;
        <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="회원가입">
    </div>
</fieldset>

    <input type ="text" name="chkId" id="chkId">
        
</form>
</div>
</article>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>