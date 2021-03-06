<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>

<style type="text/css">
	.edit {
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		user-select: none;
		width: 65%;
		margin: auto;
	}
	
	legend {
		font-weight: bold;
		color: #330099;
	}
	
	#title {
		border: 0px solid;
		border-bottom: 1px solid gray;
		font-size: 25px;
	}
	
	.title, .score, .center, #title {
		text-align: center;
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
		
		$("form[name=frmEdit]").submit(function(){
			var str=CKEDITOR.instances.content.getData();
			
			var newText=str.replace(/(<([^>]+)>)/ig, "");
			var newText2=newText.replace(/&nbsp;/gi, "");
			var newText3=newText2.replace(/\n/g,"");
			var newText4=newText3.replace(/\s/g,"");
		
			if($("#title").val().length<1){
				alert("제목 입력");
				event.preventDefault();
				$("#title").focus();
			}else if(newText4.length<1){
				alert("내용 입력");
				event.preventDefault();
				$("#content").focus();
			}else if($('select option:selected').val()==0){
				alert("만족도 선택");
				event.preventDefault();
				$("#rating").focus();
			}
		});
	
		CKEDITOR.replace('content', {
			filebrowserUploadUrl:"<c:url value='/managerFile/imageUpload.do'/>"
		});
	});
</script>

<div class="edit">
	<form name="frmEdit" method="post" action="<c:url value='/review/edit.do'/>">
		<input type="hidden" name="reviewNo" value="${reviewVo.reviewNo}">
		<input type="hidden" name="userNo" value="${reviewVo.userNo}">
		<input type="hidden" name="historyNo" value="${reviewVo.historyNo}">
   
		<fieldset>
			<legend>[ ${reviewVo.packName} ]</legend>
			<hr>
			
			<br><br>
			
			<div class="title">
				<label for="title">제목 : </label>
				<input type="text" id="title" name="title" value="${reviewVo.title}"/>
			</div>
			
			<br>
			
			<div class="score">
				<label for="score">만족도</label>
				<select id="score" name="score">
					<option value="1"
						<c:if test="${reviewVo.score==1}">
							selected="selected"
						</c:if>
					>☆</option>
					<option value="2"
						<c:if test="${reviewVo.score==2}">
							selected="selected"
						</c:if>
					>☆☆</option>
					<option value="3"
						<c:if test="${reviewVo.score==3}">
							selected="selected"
						</c:if>
					>☆☆☆</option>
					<option value="4"
						<c:if test="${reviewVo.score==4}">
							selected="selected"
						</c:if>
					>☆☆☆☆</option>
					<option value="5"
						<c:if test="${reviewVo.score==5}">
							selected="selected"
						</c:if>
					>☆☆☆☆☆</option>
				</select>
			</div>
			
			<br>
			
			<div>
				<textarea id="content" name="content" rows="12" cols="40">${reviewVo.content}</textarea>
			</div>
			
			<br>
			
			<div class="center">
				<input type="submit" value="수정하기"/>
				<input type="button" value="목록으로" onClick="location.href='<c:url value='/review/list.do'/>'"/>         
			</div>
		</fieldset>
	</form>
	
	<br>
	
</div>

<%@ include file="../inc/bottom.jsp" %>