<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerDetail.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('content', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/managerFile/imageUpload.do'/>",
    });
});
</script>
<article>
	<article class="managerDetail">
		<h4>[${supportViewVo.userId}(${supportViewVo.name})]님의 문의사항</h4>
		<div>
			<div>${supportViewVo.title}</div>
		</div>
		<div>
			<div>${supportViewVo.content}</div>
		</div>
	</article>
	
	<article class="managerForm">
		<h4>답변하기</h4>
		<form name="supportWrite" method="post" enctype="multipart/form-data"
			action="<c:url value="/manager/support/supportWrite.do"/>">
			<div>
				<div>
					<input type="text" name="title" style="width: 70%">
				</div>
			</div>
			<div>
				<div>
					<textarea cols="10" rows="5" name="content" id="content"></textarea>
				</div>
			</div>
			<p class="managerSubmit">
				<input type="hidden" name="groupNo" value="${supportViewVo.groupNo}">
				<input type="submit" value="전송">
				<a href="<c:url value='/manager/support/supportList.do'/>">
					<input type="button" value="취소">
				</a>
			</p>
		</form>
	</article>
</article>
<%@include file="../../inc/adminBottom.jsp"%>