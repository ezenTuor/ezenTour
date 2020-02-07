<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="divForm">
<form name="frmEdit" method="post" enctype="multipart/form-data"
	action="<c:url value='/support/supportEdit.do'/>"> 
    <input type="hidden" name="no" value="${supportVo.supportNo}">
    
    <fieldset>
	<legend>글수정</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title"  
            	value="${supportVo.title}" class="infobox" />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" 
            	value="${sessionScope.name}" class="infobox"/>
        </div>     
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40">${supportVo.content}</textarea>
        </div>
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="글목록" 
			onclick="location.href='<c:url value='/support/support.do'/>'" />         
        </div>
	</fieldset>
</form>    
</div>
</body>
</html>