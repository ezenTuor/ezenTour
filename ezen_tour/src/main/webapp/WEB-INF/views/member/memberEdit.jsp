<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script>
$(function(){
	$("#user_pwd").focus();
	$("#wr_submit").click(function(){
		if($("#user_pwd").val().length<1){
			alert("비밀번호를 입력하세요");
			$("#user_pwd").focus();
			event.preventDefault();				
		}else if($("#user_pwd").val()!=$("#user_pwd2").val()){
			alert("비밀번호가 일치하지 않습니다!");
			$("#user_pwd2").focus();
			event.preventDefault();				
		}else if(!validate_phone($("#hp2").val()) 
				|| !validate_phone($("#hp3").val())){
			alert("휴대폰번호는 숫자만 가능!");
			$("#hp2").focus();
			event.preventDefault();		
		}
	});
});
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function validate_phone(ph){
	 var pattern=new RegExp(/^[0-9]*$/g);
	 return pattern.test(ph);
}

function validate_userid(uid){
  var pattern= new RegExp(/^[a-zA-Z0-9_]+$/g);
  return pattern.test(uid);
}
function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("address_detail").focus();
        }
    }).open();
}
</script>
<style>
	article{
		height: 650px;
	}
	.divform{
		height: 650px;
	}
	form{
		width: 800px;
		margin-left: 551.5px;
	}
	table{
		margin-left: 222.5px;
	}
	
	tr:nth-of-type(7) td:nth-of-type(2){
		width: 550px;
	}
	tr:nth-of-type(4) td:first-of-type{
		width: 110px;
	}
	tr td:first-of-type{
		float: right;
		font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	}
	
	body{
		font-size: 1.0em;
	}
	
	input[type=text], input[type=Password]{
		border-radius: .2em;
		font-size: 0.8em;
	}
	
	legend{
		font-size : 1.9em;
		height: 50px;
		margin-left: 53px;
		font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	}
	.center{
		margin-left: 365.335px
	}
	label {
		margin: 7px;
	}
	input {
		margin: 7px;
	}
</style>
</head>
<body>
	<article>
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/member/memberWrite.do'/>">
<fieldset>
	<legend>회원 정보 수정</legend>
	<hr>
	<table>       
        <tr>
        	<td><label for="name">Name  </label></td>
        	<td><input type="text" name="name" id="name" value="${vo.name }"
        		disabled="disabled">
        	</td>
		</tr>
		<tr>
        	<td><label for="user_id">ID </label></td>
        	<td><input type="text" name="user_id" id="user_id"
        		value="${sessionScope.user_id }" disabled="disabled">&nbsp;
        	<input type="button" value="중복확인" id="btnChkId" 
        		title="새창열림"></td>
        </tr>
        <tr>
        	<td><label for="user_pwd">PassWord</label></td>
        	<td><input type="Password" name="user_pwd" id="user_pwd"></td>
        </tr>
        <tr>
        	<td><label for="pwd2" style="float: right">P.W Check</label></td>
        	<td><input type="Password" name="pwd2" id="pwd2"></td>
        </tr>
		
    	<tr>
        	<td><label>Address  </label></td>
        	<td><input type="text" id="zipcode" name = "zipcode" placeholder="우편번호">
			<input type="button" onclick="Postcode()" value="우편번호 찾기"><br>
			<input type="text" id="address" name="address" placeholder="주소"><br>
			<input type="text" id="address_detail" name="address_detail" placeholder="상세주소">
			<input type="text" id="extraAddress" placeholder="참고항목"></td>
		</tr>

        <tr>
        	<td><label for="hp1">Phone</label></td>
        	<td><select name="hp1" id="hp1" title="휴대폰 앞자리">
            		<option value="010">010</option>
            		<option value="011">011</option>
            		<option value="016">016</option>
            		<option value="017">017</option>
            		<option value="018">018</option>
            		<option value="019">019</option>
       			</select>
        		-
        		<input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        			style="width: 80px;">-
        		<input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        			style="width: 80px;"></td>
		</tr>
        <tr>
        	<td><label for="email1">E-mail</label></td>
        	<td><input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        		<select name="email2" id="email2"  title="이메일주소 뒷자리">
            		<option value="naver.com">naver.com</option>
            		<option value="hanmail.net">hanmail.net</option>
            		<option value="nate.com">nate.com</option>
            		<option value="gmail.com">gmail.com</option>
            		<option value="etc">직접입력</option>
        		</select>
        		<input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        			style="visibility:hidden"></td>
		</tr>
    	<tr>
        	<td><label for="user_ssr">S.S Number</label></td>
    		<td><input type="text" name="user_ssr" placeholder="xxxxxx-ooooooo"></td>
		</tr>
    	<tr>
        	<td><label for="gender">Gender</label></td>
    		<td><input type="radio" name="gender" value="M">남
    			<input type="radio" name="gender" value="F">여</td>
    	</tr>
    </table>
    <div class="center">
    	<input type="submit" id="wr_submit" value="회원가입">
    </div>
    <br><hr>
    <input type="hidden" value="C" name="grade">
    <input type="hidden" value=" " name="del_flag">
</fieldset>

    <input type ="hidden" name="chkId" id="chkId">
        
</form>
</div>
</article>
<%@ include file="../inc/bottom.jsp" %>