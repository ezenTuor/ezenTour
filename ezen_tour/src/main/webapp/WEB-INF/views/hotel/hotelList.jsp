<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	var map;
	function initMap() {
	  map = new google.maps.Map(document.getElementById('map'), {
	    center: {lat: -34.397, lng: 150.644},
	    zoom: 8
	  });
	}
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
	
	#map {
        height: 100%;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
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
			</select> 박</li>
		</ul>
		<br>
		<ul>
			<li id="title"><span>객실/인원</span></li>
			<li id="fil">성인 <select>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
			</select> 명 &nbsp; <input type="button" value="추가인원"></li>
		</ul>
		<br><br>
		<span style="font-size:15px">==상세필터==</span>
		<ul>
			<li id="title"><span>가격대</span></li>
			<li id="fil"><input type="text" size="10"> ~ <input type="text" size="10"> 원</li>
		</ul>
		<ul>
			<li id="title"><span>호텔등급</span></li>
			<li id="fil">
				<select>
					<option></option>
					<option>☆☆☆☆☆</option>
					<option>☆☆☆☆</option>
					<option>☆☆☆</option>
					<option>☆☆</option>
					<option>☆</option>
				</select></li>
		</ul>
		<ul>
			<li id="title"><span>호텔명</span></li>
			<li id="fil"><input type="text" size="10"></li>
			<li id="sel" style="text-align: right"><input type="button" value="검색하기"></li>
		</ul>
	</div>
	<br>
	<div class="hl">
		<div class="op" align="right">
			<a href="#">가격순</a> | 
			<a href="#">등급별</a> | 
			<a href="#">평점순</a>
		</div>
		<br>
		<div id="map"></div>
		
    	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvWcAdXzxsKLjjdso74DEjMXsHAyqP3tk&callback=initMap" async defer></script>
	</div>
</div>
<br>

<%@include file="../inc/bottom.jsp" %>