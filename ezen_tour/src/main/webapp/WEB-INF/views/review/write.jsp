<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style type="text/css">
	/*나중에 수정+이미지 첨부 태그 추가*/
</style>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("form[name=frmWrite]").submit(function(){
			alert("등록되었습니다.");
		});
	});
</script>

<div>
	<form name="frmWrite" method="post" action="<c:url value='/review/list.do'/>">
		<fieldset>
			<legend>리뷰 작성</legend>
			<br>
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title"/>
			</div>
			<div>
				<label for="userid">작성자</label>
				<input type="text" name="userid" value="회원아이디" disabled="disabled"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea id="content" name="content" rows="12" cols="40"></textarea>
			</div>
			<div>
				<label for="rating">만족도</label>
				<select id="rating" name="rating">
					<option></option>
					<option>☆</option>
					<option>☆☆</option>
					<option>☆☆☆</option>
					<option>☆☆☆☆</option>
					<option>☆☆☆☆☆</option>
				</select>
			</div>
			<div>
				<input type="submit" value="리뷰 작성" onclick="message()"/>
				<input type="reset" value="취소"/>
				<input type="button" value="리뷰목록으로" onclick ="location.href='<c:url value='/review/list.do'/>'"/>
			</div>
		</fieldset>
	</form>
</div>

<%@ include file="../inc/bottom.jsp" %>