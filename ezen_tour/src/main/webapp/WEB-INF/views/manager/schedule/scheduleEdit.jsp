<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	var listSize=${fn:length(list)};
	//alert(listSize);
	
	$("textarea").each(function(){
		var id= $(this).attr('id');
		//alert(id);
		
		CKEDITOR.replace(id, {//해당 이름으로 된 textarea에 에디터를 적용
			filebrowserUploadUrl : "<c:url value='/managerFile/imageUpload.do'/>",
	    	uploadUrl : "<c:url value='/managerFile/imageUpload.do'/>",
	    	extraPlugins : 'uploadimage',
	    	toolbarGroups:[
	    		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
	    		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
	    		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
	    		{ name: 'forms', groups: [ 'forms' ] },
	    		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	    		{ name: 'colors', groups: [ 'colors' ] },
	    		'/',
	    		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
	    		{ name: 'links', groups: [ 'links' ] },
	    		{ name: 'insert', groups: [ 'insert' ] },
	    		{ name: 'about', groups: [ 'about' ] },
	    		'/',
	    		{ name: 'styles', groups: [ 'styles' ] },
	    		{ name: 'tools', groups: [ 'tools' ] },
	    		{ name: 'others', groups: [ 'others' ] }
	    	],
			removeButtons:'Source,Templates,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CopyFormatting,RemoveFormat,NumberedList,BulletedList,Indent,Outdent,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language,Flash,Save,NewPage,Preview,Print,Copy,Cut,PasteText,ShowBlocks,Maximize'
	    	
		});
	});
});
</script>
<style>
.schedule{
    position: relative;
}

.day {
    position: absolute;
    top: -25px;
}
.schedule .day label {
    background: white;
    border: 2px solid lightgray;
}
.managerForm>form>div{
	margin-top: 30px;
	display: block;
}
.schedule .detail{
	width: 90%;
    margin: 20px;
}
</style>
<article class="managerForm">
	<h2>패키지 일정 편집 화면</h2>
	
	<form name="pdWrite" method="post" enctype="multipart/form-data"
		action="<c:url value='/manager/schedule/scheduleEdit.do'/>">
		<input type="text" name="packDno" value="${param.packDno}">
		<c:set var="i" value="1"/>
		
		<c:forEach var="vo" items="${list}">
			<div class="schedule">
				<div class="day">
					<label>${i}일차 <span>${fn:substring(vo.day,0,10) }</span></label>
					
				</div>
				<div class="detail">
					<textarea rows="5" cols="10" name="detail" id="detail${i}">${vo.detail}</textarea>
				</div>
				<div>
					식사<input type="text" name="meal" value="${vo.meal}">
					호텔<input type="text" name="hotel" value="${vo.hotel}">
					<input type="text" name="day" value="${vo.day}" readOnly="readonly">
					<input type="text" name="scheduleNo" value="${vo.scheduleNo}">나중에 히든처리
				</div>
			</div>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>
		<p class="managerSubmit">
			<input type="button" value="테스트버튼" id="test">
			<input type="submit" value="전송">
		</p>
	</form>
</article>
<%@include file="../../inc/adminBottom.jsp"%>