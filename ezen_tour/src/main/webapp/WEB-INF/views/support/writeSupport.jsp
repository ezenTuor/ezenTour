<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('content', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl : "<c:url value='/managerFile/userUpload.do'/>",
    	uploadUrl : "<c:url value='/managerFile/userUpload.do'/>",
    	extraPlugins : 'uploadimage'
    });
	$("form[name=frmWrite]").submit(function(){
		if($("#title").val()==''){
			alert("제목을 입력하세요");
			$("#title").focus();
			event.preventDefault();
		}else if(!$("#pwd").val()){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			event.preventDefault();
		}
	});
});
</script>
<style type="text/css">
	#writeform{
		width: 1064px;
		margin: auto;
		margin-bottom: 45px;
	}

	#writeField{
		width: 800px;
		margin: auto;
		font-size: 20px;
    	color: #424242;
	}
</style>
</head>
<body>
<div class="divForm">
<form id="writeform" name="frmWrite" method="post" enctype="multipart/form-data"
	action="<c:url value='/support/writeSupport.do'/>" >
	<h2 style="color: black; float: left; font-weight: bold;">건의사항 작성</h2>
 	<fieldset id="writeField">
	<br><br>
        <div class="firstDiv">
            <label for="title" style="font-weight: bold;">제목</label>
            <br>
            <input type="text" id="title" name="title" style="width: 300px;"/>
        </div>
        <div>  
        	<label for="content" style="font-weight: bold;">내용</label>
        	<br>      
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
<%@ include file="../inc/bottom.jsp" %>