<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#s").click(function(){
			/*
			$.ajax({
				url:"<c:url value='/airTest.do'/>",
				type:"get",
				dataType:"text",
				success:function(res){
					alert(res);
				},
				error:function(xhr, status, error){
					alert("Error - "+status+", "+error);
				}
			});
			*/
			
			$.ajax({
				url:"<c:url value='/airLine.do'/>",
				type:"get",
				dataType:"xml",
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				success:function(res){
					alert(res);
					if ($(res).find('item').length>0) {
						$(res).find('item').each(function() {
						$("#al").append($(this).find('airlineKorean').text());
						});
					}
				},
				error:function(xhr, status, error){
					alert("Error - "+status+", "+error);
				}
			});
			
		});
	});
</script>

<style type="text/css">
	.hf{
		border: 3px solid gray;
		width: auto;
		height: auto;
		margin: 0 auto;
		
	}
	#title{
		float: left;
		font-size: 20px;
		font-weight: bold;
	}
	#fil{
		float: left;
	}
	ul{
		clear: both;
	}
	.hl{
		border: 4px solid red;
		width: auto;
		margin: 0 auto;
	}
	a{
		color: black;
		text-decoration: none;
	}
	
</style>

<div class="mn">
	<div class="hf">
		<span style="font-size:15px">항공편 검색 창입니다.</span>
		<br>
		<ul>
			<li id="title"><span>출국</span></li>
			<br>
			<li id="fil">출발공항 : <input type="text">
			</li>
			<li id="fil">도착공항 : <input type="text"></li>
			<li id="fil"><input type="text" value="캘린더"><input type="checkbox">편도</li>
			
		</ul>
		<ul>
			<li id="title"><span>귀국</span></li>
			<br>
			<li id="fil">출발공항 : <input type="text"></li>
			<li id="fil">도착공항 : <input type="text"></li>
			<li id="fil"><input type="text" value="캘린더"></li>
		</ul>
		<ul>
			<li id="title"><span>인원</span></li>
			<li id="fil"><select>
				<option>성인1명</option>
				<option>성인2명</option>
				<option>성인3명</option>
				<option>성인4명</option>
				<option>성인5명</option>
				<option>성인6명</option>
				<option>성인7명</option>
				<option>성인8명</option>
				<option>성인9명</option>
			</select></li>
			<li id="fil"><select>
				<option>아동0명</option>
				<option>아동1명</option>
				<option>아동2명</option>
				<option>아동3명</option>
				<option>아동4명</option>
				<option>아동5명</option>
				<option>아동6명</option>
				<option>아동7명</option>
				<option>아동8명</option>
				<option>아동9명</option>
			</select></li>
			<li id="fil"><select>
				<option>유아0명</option>
				<option>유아1명</option>
				<option>유아2명</option>
				<option>유아3명</option>
				<option>유아4명</option>
				<option>유아5명</option>
				<option>유아6명</option>
				<option>유아7명</option>
				<option>유아8명</option>
				<option>유아9명</option>
			</select></li>
		</ul>
		
		<br><br>
		<span style="font-size:15px">==상세필터==</span>
		<ul>
			<li id="title"><span>항공가</span></li>
			<li id="fil"><input type="text" size="10"> ~ <input type="text" size="10"> 원</li>
		</ul>
		<ul>
			<li id="title"><span>항공사명</span></li>
			<li id="fil"><input type="text" size="10"></li>
			<li id="sel" style="text-align: right"><button id="s">검색하기</button></li>
		</ul>
	</div>
	<br>
	<div class="hl">
		<div class="op" align="right">
			<a href="#">가격순</a> | 
			<a href="#">가나다순</a>
		</div>
		<br>
		<div id="al">
			
		</div>
	</div>
</div>
<br>

<%@include file="../inc/bottom.jsp" %>