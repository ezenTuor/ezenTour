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
	form{
		width: 800px;
		margin-left: 551.5px;
	}
	fieldset{
		margin-left: 222.5px;
	}
</style>
</head>
<article>
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/member/memberEdit.do'/>">
<fieldset>
	<legend>회원 정보 수정</legend>
    <div>        
        <label for="name">성명</label>
        <span>${vo.name}</span>
    </div>
    <div>
        <label for="user_id">회원ID</label>
        <span>${sessionScope.user_id}</span>
    </div>
    <div>
        <label for="user_pwd">비밀번호</label>
        <input type="Password" name="user_pwd" id="user_pwd">
    </div>
    <div>
        <label for="user_pwd2">비밀번호 확인</label>
        <input type="Password" name="user_pwd2" id="user_pwd2">
    </div>
    <div>
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80"
        	value="${vo.zipcode}">
        <input type="button" onclick="Postcode()" value="우편번호 찾기"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  
        	class="width_350"
        	value="${vo.address}"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address_detail" title="상세주소"  
        	class="width_350"
        	value="${vo.address_detail}" >
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;
        <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010"
            	<c:if test="${vo.hp1=='010'}">
            		selected
            	</c:if>
            >010</option>
            <option value="011"
            	<c:if test="${vo.hp1=='011'}">
            		selected
            	</c:if>
            >011</option>
            <option value="016"
            	<c:if test="${vo.hp1=='016'}">
            		selected
            	</c:if>
            >016</option>
            <option value="017"
            	<c:if test="${vo.hp1=='017'}">
            		selected
            	</c:if>
            >017</option>
            <option value="018"
            	<c:if test="${vo.hp1=='018'}">
            		selected
            	</c:if>
            >018</option>
            <option value="019"
            	<c:if test="${vo.hp1=='019'}">
            		selected
            	</c:if>
            >019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" value="${vo.hp2}">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" value="${vo.hp3}">
    </div>
    <div>
    	<!-- 직접 입력 처리 -->
    	<c:set var="etcYn" value="" />
    	<c:choose>
    		<c:when test="${vo.email2=='naver.com' || 
    			vo.email2=='hanmail.net' || vo.email2=='nate.com'
    			|| vo.email2=='gmail.com' || empty vo.email2}">
		    	<c:set var="etcYn" value="N" />    			
    		</c:when>
    		<c:otherwise>
		    	<c:set var="etcYn" value="Y" />    			
    		</c:otherwise>
    	</c:choose>
    	
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" 
        title="이메일주소 앞자리" value="${vo.email1}">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">        	        
            <option value="naver.com"
            	<c:if test="${vo.email2=='naver.com' }">            	
            		selected="selected"
            	</c:if>
            >naver.com</option>
            <option value="hanmail.net"
            	<c:if test="${vo.email2=='hanmail.net' }">            	
            		selected="selected"
            	</c:if>
            >hanmail.net</option>
            <option value="nate.com"
            	<c:if test="${vo.email2=='nate.com' }">            	
            		selected="selected"
            	</c:if>
            >nate.com</option>
            <option value="gmail.com"
            	<c:if test="${vo.email2=='gmail.com' }">            	
            		selected="selected"
            	</c:if>
            >gmail.com</option>
            <option value="etc"
            	<c:if test="${etcYn=='Y'}">            	
            		selected="selected"
            	</c:if>            	         	
            >직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	<c:if test="${etcYn=='Y'}">    
        		style="visibility:visible;"
        		value="${vo.email2}"
        	</c:if>
        	<c:if test="${etcYn!='Y'}">    
        		style="visibility:hidden"
        	</c:if>
        	>
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>

</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp"%>