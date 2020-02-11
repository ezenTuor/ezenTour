<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
	.write {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select: none;
	}

	#title {
		border: 0px solid;
		border-bottom: 1px solid gray;
		font-size: 25px;
	}

	.contentEditor {
		margin: auto;
		width: 65%;
	}
	
	.write, #title {
		text-align: center;
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#packs").change(function(){
			var temp=$(this).val();
			$("#historyNo").val(temp);
		});
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
			
			if($('#packName option:selected').val()=='0'){
				alert("패키지를 선택해주세요");
				event.preventDefault();
				$("#packName").focus();
			}else if($("#title").val().length<1){
				alert("제목을 입력해주세요");
				event.preventDefault();
				$("#title").focus();
			}else if($('#score option:selected').val()==0){
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
			filebrowserUploadUrl : "<c:url value='/managerFile/userUpload.do'/>",
	    	uploadUrl : "<c:url value='/managerFile/userUpload.do'/>",
	    	extraPlugins : 'uploadimage'
		});
	});
</script>

<div>
	<div class="write">
		<form name="frmWrite" method="post" action="<c:url value='/review/write.do'/>">
			<input type="hidden" name="userNo" value="${userNo}">
			<input type="hidden" name="historyNo" id="historyNo" value="${historyNo}">
			<input type="hidden" name="ntoy" value="${param.review}">
			<input type="hidden" name="name" value="${param.name}">
			<fieldset>
			
				<legend id="packName">[ 
					<select id="packs">
						<option value="0">패키지를 선택하세요</option>
						<c:forEach var="vo" items="${list}">
							<option value="${vo.historyNo}"
								<c:if test="${param.name==vo.name}">
									selected="selected"
								</c:if>
							>${vo.name}</option>
						</c:forEach>
					</select>
				 ]</legend>
				
				<br>
				
				<div>
					<label for="title">제목 : </label>
					<input type="text" id="title" name="title"/>
				</div>
				
				<br>
				
				<div>
					<label for="score">평점 : </label>
					<select id="score" name="score">
						<option value="0">선택하세요</option>
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
					<input type="submit" value="작성하기"/>
					<input type="button" value="목록으로" onClick="location.href='<c:url value='/review/list.do'/>'"/>
				</div>
			</fieldset>
		</form>
	</div>
	
	<br>

</div>

<%@ include file="../inc/bottom.jsp" %>