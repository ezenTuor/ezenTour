<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("form[name=frmWrite]").submit(function(){
		if($("#title").val()==''){
			alert("제목을 입력하세요");
			$("#title").focus();
			event.preventDefault();
		}else if($("#name").val().length<1){
			alert("이름을 입력하세요");
			$("#name").focus();
			event.preventDefault();
		}else if(!$("#pwd").val()){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			event.preventDefault();
		}
	});
});
</script>
</head>
<body>
<form name="frmWrite" method="post" 
	action="<c:url value='/support/supportReply.do'/>" >
	<input type="hidden" name="groupNo" value="${vo.groupNo }">
	<input type="hidden" name="step" value="${vo.step }">
	<input type="hidden" name="sortNo" value="${vo.sortNo }">
	
 <fieldset>
	<legend>답변달기</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" 
            	value="Re : ${vo.title }" />
        </div>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
        </div>             
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="글목록" 
            onclick
            ="location.href	='<c:url value='/support/support.do'/>'" />         
        </div>
    </fieldset>
</form>
</div>
</body>
</html>