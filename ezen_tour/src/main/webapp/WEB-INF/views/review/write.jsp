<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
	.reviewWrite {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select:none;
		text-align: center;
	}

	#title {
		border: 0px solid;
		border-bottom: 1px solid gray;
		text-align: center;
		font-size: 25px;
	}

	.contentEditor {
		margin: auto;
		width: 65%;
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#title').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			};
		});
		
		$("form[name=frmWrite]").submit(function(){
			var str=CKEDITOR.instances.content.getData();
			
			var newText=str.replace(/(<([^>]+)>)/ig, "");
			var newText2=newText.replace(/&nbsp;/gi, "");
			var newText3=newText2.replace(/\n/g,"");
			var newText4=newText3.replace(/\s/g,"");
			
			if($("#title").val().length<1){
				alert("제목을 입력해주세요");
				event.preventDefault();
				$("#title").focus();
			}else if($('select option:selected').val()==0){
				alert("해당 패키지의 평점을 선택해주세요");
				event.preventDefault();
				$("#rating").focus();
			}else if(newText4.length<1){
				alert("작성된 내용이 없습니다.");
				event.preventDefault();
				$("#content").focus();
			}
		});
		
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:"<c:url value='/managerFile/imageUpload.do'/>"
		});
	});
</script>

<div class="reviewWrite">
	<form name="frmWrite" method="post" action="<c:url value='/review/write.do'/>">
		<!-- 합칠 때, value수정 -->
		<input type="hidden" name="userNo" value="1">
		<input type="hidden" name="historyNo" value="1">
		<fieldset>
			<legend>[패키지 이름]</legend>
			
			<br>
			
			<div>
				<label for="title">제목 : </label>
				<input type="text" id="title" name="title"/>
			</div>
			
			<br>
			
			<div>
				<label for="score">평점 : </label>
				<select id="score" name="score">
					<option>선택하세요</option>
					<option value="1">☆</option>
					<option value="2">☆☆</option>
					<option value="3">☆☆☆</option>
					<option value="4">☆☆☆☆</option>
					<option value="5">☆☆☆☆☆</option>
				</select>
			</div>
			
			<br>
			
			<div class="contentEditor">
				<textarea id="content" name="content" rows="12" cols="40"></textarea>
			</div>
			
			<br>
			
			<div>
				<input type="submit" value="작성하기" onclick="message()"/>
				<input type="button" value="목록으로" onclick="location.href='<c:url value='/review/list.do'/>'"/>
			</div>
		</fieldset>
	</form>
</div>

<br>

<%@ include file="../inc/bottom.jsp" %>