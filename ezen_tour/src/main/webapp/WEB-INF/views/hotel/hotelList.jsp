<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<style type="text/css">
	.hf{
		border: 3px solid gray;
		width: 1500px;
		height: 300px;
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
		width: 1500px;
		margin: 0 auto;
	}
	
</style>

<div class="mn">
	<div class="hf">
		<span style="font-size:15px">호텔 검색 창입니다.</span>
		<br>
		<ul>
			<li id="title"><span>목적지</span></li>
			<li id="fil"><input type="text"></li>
		</ul>
		<br>
		<ul>
			<li id="title"><span>체크인/아웃</span></li>
			<li id="fil"><input type="text" value="ex)2020-01-09" size="10"><span style="font-size:10">부터&nbsp;</span></li>
			<li id="fil"><input type="text" value="ex)2020-01-10" size="10"></li>
			<li id="fil">&nbsp;<select>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
			</select>박</li>
		</ul>
		<br>
		<ul>
			<li id="title"><span>객실/인원</span></li>
			<li id="fil"><select>
				<option>성인 1명</option>
				<option>성인 2명</option>
				<option>성인 3명</option>
				<option>성인 4명</option>
			</select></li>
			<li id="fil"><select>
				<option>아동 1명</option>
				<option>아동 2명</option>
				<option>아동 3명</option>
				<option>아동 4명</option>
			</select></li>
		</ul>
		<br><br>
		<span style="font-size:15px">==상세필터==</span>
		<ul>
			<li id="title"><span>가격대</span></li>
			<li id="fil"><input type="text" size="10"> ~ <input type="text" size="10"></li>
		</ul>
		<ul>
			<li id="title"><span>호텔등급</span></li>
			<li id="fil"><input type="text" size="10"></li>
		</ul>
		<ul>
			<li id="title"><span>호텔명</span></li>
			<li id="fil"><input type="text" size="10"></li>
		</ul>
	</div>
	<br>
	<div class="hl">
		가격/등급/평점 정렬
		<br><br>
		호텔 리스트 & 상세보기 들어갈 자리(=> 상세페이지로 이동)
	</div>
</div>
<br>

<%@include file="../inc/bottom.jsp" %>