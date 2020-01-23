<%@page import="com.ezen.tour.country.model.CountryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('detail', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl: "<c:url value='/managerFile/imageUpload.do'/>",
    });
});

</script>
<script>
//국가 선택 부분
$( function() {
	var availableTags = [
			"선택없음"
			<c:forEach var="vo" items="${countryList}">
			,"${vo.name}"
			</c:forEach>
		];
	function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}
	$( "#country" ).on( "keydown", function( event ) {
    	if ( event.keyCode === $.ui.keyCode.TAB && $( this ).autocomplete( "instance" ).menu.active ) {
    		event.preventDefault();
    	}
    }).autocomplete({
    	minLength: 0,
    	source: function( request, response ) {
    		response( $.ui.autocomplete.filter(
    				availableTags, extractLast( request.term ) 
    		) 
    	);
      },focus: function() {
    	  return false;
      },select: function( event, ui ) {
    	  var terms = split( this.value );
    	  terms.pop();
    	  terms.push( ui.item.value );
    	  terms.push( "" );
    	  this.value = terms.join( ", " );
    	  return false;
   		}
   });
});
</script>
<script type="text/javascript">
//자동 submit 막기
$(function(){
	$('input[type=text]').keydown(function() {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	});
});
</script>
<script type="text/javascript">
$(function(){
	$("#area_no").change(function(){
		var val=$(this).find("option:selected").val();
		var name=$(this).find("option:selected").text();
		alert("값 변화 확인, 값="+val+", 이름="+name);
		$("#extends").html(val+", "+name);
		
		$.ajax({
			url:"<c:url value='/manager/area.do'/>",
			data:{"no":val},
			dataType:"json",
			type:"post",
			success:function(res){
				//{"no":7,"name":"홍길동","content":"테스트용 내용입니다."}
				var str="[번호 - "+res.no+"], [이름 - "+res.name+"], [내용 - "+res.content+"]<br>"
				$("#result").append(str);
			},error:function(xhr, status, error){
				alert("error : "+status+", "+error);
			}
		})
	});
});
</script>
<script type="text/javascript" src="<c:url value='/resources/js/managerFile.js'/>"></script>
	<article class="managerForm">
		<h2>패키지 등록 화면</h2>
		<div class='progress'>
			<img src="<c:url value='/resources/images/on.png'/>">
			<img src="<c:url value='/resources/images/off.png'/>">
			<img src="<c:url value='/resources/images/off.png'/>">
			<img src="<c:url value='/resources/images/off.png'/>">
		</div>
		<h4>1.패키지 대분류 작성</h4>
		<form name="pdWrite" method="post" enctype="multipart/form-data"
			action="<c:url value="/manager/pack/packWrite.do"/>">
			<div>
				<label for="name">패키지명</label>
				<input type="text" id="name" name="name">
			</div>
			<div class="drop">
				<label for="packImages">패키지 이미지</label>
				<input type="file" id="packImages" name="packImages" multiple>
				<span class='notice'>*첫 이미지가 대표 이미지가 됩니다.</span>
				<div id="thumbnails">
					<div>
					</div>
				</div>
			</div>
			<div>
				<label for="area_no">해당 대륙</label>		
				<select name="area_no" id="area_no">
				<c:forEach var="area" items="${areaList}">
					<option value="${area.areaNo}">${area.name}</option>
				</c:forEach>
				</select>
				<div id="extends"></div>
			</div>
			<div>
				<label for="country">해당국가</label>		
				<input type="text" id="country" name="country">
			</div>
			<div>
				<label for="city">해당도시</label>
				<input type="text" id="city" name="city">
			</div>
			
			<div>
				<label for="keyword">키워드</label>
				<input type="text" id="keyword" name="keyword">
			</div>
			
			<div>
				<label for="airport">이용 항공사</label>
				<input type="text" id="airport" name="airport">
			</div>
			
			<div>
				<label for="days">여행계획일</label>
				<input type="text" id="days" name="days">
			</div>
			
			<div>
				<label for="daysWeek">출발요일</label>
				<input type="checkbox" value="월" class="item">월
				<input type="checkbox" value="화" class="item">화
				<input type="checkbox" value="수" class="item">수
				<input type="checkbox" value="목" class="item">목
				<input type="checkbox" value="금" class="item">금
				<input type="checkbox" value="토" class="item">토
				<input type="checkbox" value="일" class="item">일
				<br>
				<input type="text" id="daysWeek" name="daysWeek">나중에 히든처리
			</div>
			
			<div>
				<label for="detail">상세설명</label>
				<textarea name="detail" id="detail" rows="10" cols="80">
			    </textarea>
			</div>
			<p class="managerSubmit">
				<input type="button" value="테스트버튼" id="test">
				<input type="submit" value="전송">
			</p>
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>