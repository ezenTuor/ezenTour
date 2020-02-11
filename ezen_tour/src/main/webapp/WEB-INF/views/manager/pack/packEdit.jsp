<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor부분
$(function(){
    CKEDITOR.replace('detail', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserUploadUrl : "<c:url value='/managerFile/imageUpload.do'/>",
    	extraPlugins : 'uploadimage'
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
	$("form[name=pdWrite]").submit(function(){
		var str="";
		$(".item").each(function(){
			if($(this).is(":checked")){
				if(str==""){
					str+=$(this).val();
				}else{
					str+=", "+$(this).val();
				}
			}
		});
		$("#daysWeek").val(str);
	});
	$("#test").click(function(){
		alert("버튼눌림");
		var str="";
		$(".item").each(function(){
			if($(this).is(":checked")){
				if(str==""){
					str+=$(this).val();
				}else{
					str+=", "+$(this).val();
				}
			}
		});
		//alert(str);
		$("#daysWeek").val(str);
	});
});
</script>
<script type="text/javascript">
$(function(){
	area();
	$("#areaNo").change(function(){
		area();
	});
});

function area(){
	//alert($("#areaNo").val());
	var val=$("#areaNo").find("option:selected").val();
	var name=$("#areaNo").find("option:selected").text();
	//alert("값 변화 확인, 값="+val+", 이름="+name);
	
	$.ajax({
		url:"<c:url value='/manager/area.do'/>",
		data:{"no":val},
		dataType:"json",
		type:"post",
		success:function(res){
			//[{"tagNo":1,"areaNo":1,"name":"서유럽","keyword":"서유럽|영국|프랑스|이태리"},{"tagNo":2,"areaNo":1,"name":"동유럽/발칸","keyword":"동유럽|발칸|프라하|비엔나|크로아티아|체코|헝가리"}
			if(res.length>0){
				$("#extends").html("");
				$("#extends").html("예시 키워드<br>");
				var str="";
				$.each(res, function(idx, item){
					str+=item.tagNo+". "+item.name+"  ";
				})
				$("#extends").append(str);
			}else{
				$("#extends").html("해당 값이 아직 없습니다.");
			}
		},error:function(xhr, status, error){
			alert("error : "+status+", "+error);
		}
	})
}


</script>
<script type="text/javascript">
$(function(){
	var days="${packVo.daysWeek}";
	var dayArr=days.split(",");
	for(var i=0; i<dayArr.length; i++){
		var temp=$.trim(dayArr[i]);
		
		//alert(temp);
		$(".item").each(function(){
			if($(this).val()==temp){
				$(this).prop("checked", true);
			}
		});
	}
});
</script>
<style>
	.managerForm input[type=text]{
		width: 70%;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/managerFile.js"></script>
	<article class="managerForm">
		<h2>패키지 수정 화면</h2>
		<form name="pdEdit" method="post" enctype="multipart/form-data"
			action="<c:url value="/manager/pack/packEdit.do"/>">
			패키지번호<input type="text" name="packNo" value="${packVo.packNo}">나중에 히든처리
			<div>
				<label for="name">패키지명</label>
				<div>
					<input type="text" id="name" name="name" value="${packVo.name}">
				</div>
			</div>
			<div class="drop">
				<label for="packImages">패키지 이미지</label>
				<div>
					<input type="file" id="packImages" name="packImages" multiple>
					<div class='notice'>
						*이미지 첨부시 기존 파일은 사라집니다.<br>
						*첫 이미지가 대표 이미지가 됩니다.
					</div>
					<div id="thumbnails">
						<div>
							<c:if test="${!empty packVo.imgNames}">
								<c:forEach items="${fn:split(packVo.imgNames,'|')}" var="img">
									<div class="thumb">
										<img src="${pageContext.request.contextPath}/resources/pd_images/${img}" title="${img}">
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div>
				<label for="areaNo">해당 대륙</label>	
				<div>
					<select name="areaNo" id="areaNo">
						<option value="none">선택해주세요</option>
						<c:forEach var="area" items="${areaList}">
							<option value="${area.areaNo}" 
							<c:if test="${packVo.areaNo==area.areaNo}">selected="selected"</c:if>
							>${area.name}</option>
						</c:forEach>
					</select>
					<div id="extends"></div>
				</div>	
			</div>
			<div>
				<label for="country">해당국가</label>	
				<div>
					<input type="text" id="country" name="country" value="${packVo.country }">
				</div>
			</div>
			<div>
				<label for="city">해당도시</label>
				<div>
					<input type="text" id="city" name="city" value="${packVo.city}">
				</div>
			</div>
			
			<div>
				<label for="keyword">키워드</label>
				<div>
					<span class='notice'>*각 키워드들은 ", "로 구분해 주세요.</span><br>
					<input type="text" id="keyword" name="keyword" placeholder="예) 프랑스, 파리, 서유럽" value="${packVo.keyword}">
				</div>
			</div>
			
			<div>
				<label for="airport">이용 항공사</label>
				<div>
					<input type="text" id="airport" name="airport" value="${packVo.airport} ">
				</div>
			</div>
			
			<div>
				<label for="days">여행계획일</label>
				<div>
					<input type="text" id="days" name="days" value="${packVo.days }">
				</div>
			</div>
			
			<div>
				<label for="daysWeek">출발요일</label>
				<div>
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
			</div>
			
			<div>
				<label for="detail">상세설명</label>
				<div>
					<textarea name="detail" id="detail" rows="10" cols="80">
					${packVo.detail}
				    </textarea>
			    </div>
			</div>
			<p class="managerSubmit">
				<input type="button" value="테스트버튼" id="test">
				<input type="submit" value="전송">
				<a href="<c:url value='/manager/pack/packDetail.do?packNo=${packVo.packNo}'/>">
					<input type="button" value="취소">
				</a>
			</p>
		</form>
	</article>
<%@include file="../../inc/adminBottom.jsp"%>