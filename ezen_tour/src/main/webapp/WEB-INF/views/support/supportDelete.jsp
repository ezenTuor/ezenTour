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
	$(function(){
		$('form[name=frmDelete]').submit(function(){			
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>
<div class="divForm">
	<form name="frmDelete" method="post"	
		action="<c:url value='/support/supportDelete.do'/>" >
        <input type="hidden" name="no" value="${param.no}" />   
        <input type="text" name="groupNo" value="${param.groupNo}" />
        <input type="text" name="step" value="${param.step}" />
           
		<fieldset>
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp">${param.no}번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div>           
	            <label for="pwd">비밀번호</label>
	            <input type="password" id="pwd" name="pwd" />   
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" 
                	OnClick
      ="location.href='<c:url value='/support/support.do'/>'" />
	        </div>
	    </fieldset>
    </form>
</div>
</body>
</html>