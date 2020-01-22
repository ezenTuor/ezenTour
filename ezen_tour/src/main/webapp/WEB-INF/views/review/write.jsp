<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style type="text/css">
	/*나중에 수정+이미지 첨부 태그 추가*/
	a{
		color: black;
		text-decoration: none;
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("form[name=frmWrite]").submit(function(){
			if($("#title").val().length<1){
				alert("제목 입력");
				event.preventDefault();
				$("#title").focus();
			}else if($("#content").val().length<1){
				alert("내용 입력");
				event.preventDefault();
				$("#content").focus();
			}else if($('select option:selected').val()==0){
				alert("만족도 선택");
				event.preventDefault();
				$("#rating").focus();
			}/* else{
				alert($("#rating option:selected").val());
			} */
		});
	});
</script>

<div>
	<form name="frmWrite" method="post" action="<c:url value='/review/list.do'/>">
		<fieldset>
			<legend>리뷰 작성 화면</legend>
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
				<label for="score">만족도</label>
				<select id="score" name="score">
					<option></option>
					<option value="1">☆</option>
					<option value="2">☆☆</option>
					<option value="3">☆☆☆</option>
					<option value="4">☆☆☆☆</option>
					<option value="5">☆☆☆☆☆</option>
				</select>
			</div>
			<div>
				이미지 첨부 들어갈 곳(위치 수정 예정)
			</div>
			<div>
				<input type="submit" value="리뷰 작성" onclick="message()"/>
				<input type="reset" value="취소"/>
				<a href="<c:url value='/review/list.do'/>">☞리뷰 목록으로</a>
<%-- <input type="button" value="리뷰 목록으로..." onclick="location.href='<c:url value='/review/list.do'/>'"/> --%>
			</div>
		</fieldset>
	</form>
</div>

<%@ include file="../inc/bottom.jsp" %>