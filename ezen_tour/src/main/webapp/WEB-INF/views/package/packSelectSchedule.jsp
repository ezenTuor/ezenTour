<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/inc/top.do"></c:import>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packSelect.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>


  function getFormatDate(date){
	  	var yoil = ['일','월','화','수','목','금','토'];
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    var yo = date.getDay()
	    var time = date.getHours();
	    time = time>=10 ? time : '0' +time;
	    var min=date.getMinutes();
	    min = min>=10 ? min : '0' +min;
	    return  year + '.' + month + '.' + day+'('+yoil[yo]+") "+time+":"+min;
	}

  $(function() { 
		
  });
	    
	$(function() {
		$(document).on("change", ".dateVal", function() { 
			$("#pack-ex").empty();
		     var selDate = $(this).val();
		     var packNo = $('h4').html();
		     console.log(packNo);
		     $.ajax({
		    	type:"get",
		    	url:"<c:url value='/dateSelect.do?koreaDep="+ selDate +"&packNo="+packNo+"'/>",
		    	dataType: "json",
		    	success: function(res) {
		    		if(res.length>0){
		    			//alert("!!");
		    			var str = '';
			    		console.log(res);
						$.each(res, function(idx, item) {
							var curdate = new Date(null);
							curdate.setTime(item.koreaDep);
							var korDep1 = getFormatDate(curdate);
							
							var curdate2 = new Date(null);
							curdate2.setTime(item.koreaEnt);
							var korEnt2 = getFormatDate(curdate2);
							
							var capecity = item.capecity;
							var capecityCur = item.capecityCur;
											
							if(capecityCur > 0){
								str='<li id="title-tag">'+
			    				'<div class="dep"><div>'+korDep1+'</div><div>'+korEnt2+'</div></div>'+
			    				'<div class="air">'+item.airline+'</div>'+
			    				'<div class="during">'+item.daysDetail+'</div>'+
			    				'<div class="packname"><a href="${pageContext.request.contextPath}/package/packageDetail.do?packDno='+item.packDno+'" class="nameCss">'+item.name+'</a></div>'+
			    				'<div class="price">'+item.man+'</div>'+
			    				'<div class="res"><button value="예약가능" class="res-btn-able">예약가능</button></div>'+
			    				'</li>'	
							} else {
								str='<li id="title-tag">'+
			    				'<div class="dep"><div>'+korDep1+'</div><div>'+korEnt2+'</div></div>'+
			    				'<div class="air">'+item.airline+'</div>'+
			    				'<div class="during">'+item.daysDetail+'</div>'+
			    				'<div class="packname"><a href="${pageContext.request.contextPath}/package/packageDetail.do?packDno='+item.packDno+'" class="nameCss">'+item.name+'</a></div>'+
			    				'<div class="price">'+item.man+'</div>'+
			    				'<div class="res"><button value="예약마감" class="res-btn-cant" disabled>예약마감</button></div>'+
			    				'</li>'	
							}
							
		    				$("#pack-ex").append(str);
						})		    			
		    		}
				},
				error: function(xhr, status, error){
					alert("Error:"+ status+", "+error);
				}
		     })
		     

		}) //내부 change function
	})
	
	
	
  $( function() {
	  
	  	var availableDates = $(".availDate").text().replace("[", "").replace("]", "").replace(/ /gi, "");
		console.log(availableDates);
		
		var strArray = availableDates.split(",");
		console.log(strArray);
		

		function available(date) {
			var thismonth = date.getMonth()+1;
			var thisday = date.getDate();
			
			if(thismonth<10){
				thismonth = "0"+thismonth;
			}

			if(thisday<10){
				thisday = "0"+thisday;
			}

		    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;


		    if ($.inArray(ymd, strArray) >= 0) {
		        return [true,"",""];
		    } else {
		        return [false,"",""];
		    }
		    

		}
		
	  
    $( "#datepicker" ).datepicker({ 
    	dateFormat: 'yy-mm-dd',
    	prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        minDate: 0,
        beforeShowDay: available
        });  
  } );
  
</script>

<div id="packSel-body">


<!-- 예시:https://www.ybtour.co.kr/product/localList.yb?menu=PKG&dspSid=AADC000&goodsCd=CIP1106 -->

	<div id="left-menu">
		<div style="margin-bottom:15px; font-weight: 600; text-align: center">여행지를 검색해보세요!</div>
		<c:import url="/package/packCategory.do"></c:import>
	</div>
	
	<div id="mid-line">  </div>
	
	<div id="right-menu">

		<div class="cal-container">		 
			<div id="datepicker" class="dateVal"></div>
			<div style="background: #8A8AE2; height: 300px; width: 2px;"></div>
			<div id="dateDetail">
				<div style="font-size: 30px; font-weight: 600;">${packVo.name}</div>
				<h4 style="display: none">${packVo.packNo}</h4>
				<div><span style="font-weight: 600">${maxMin.minPrice}원</span> ~ <span style="font-weight: 600">${maxMin.maxPrice}원</span></div>
				<div><span style="font-weight: 600">주요 방문 도시 |</span>   <span>${packVo.city }</span></div>	
				<div><span>${packVo.detail }</span></div>			
			</div>
	
		</div>

		<!-- 이하 본문 -->
		<ul>
			<li id="title-tag">
				<div class="dep">출발/도착 일시</div>
				<div class="air">항공</div>
				<div class="during">기간</div>
				<div class="packname">상품명</div>
				<div class="price">가격</div>
				<div class="res">예약상태</div>
			</li>
		</ul>
		
		<ul id="pack-ex">
		</ul>
		<!-- 
		
			<li class="contents-tag">
				<div class="dep">출발/도착 일시</div>
				<div class="air">항공</div>
				<div class="during">기간</div>
				<div class="packname">상품명</div>
				<div class="price">기타</div>
				<div class="res"><button type="button" value="예약가능">예약가능</button></div>
			</li>
		
		 -->	
			

	<div class="availDate" style="display:none">${cutDate}</div>
	
	</div>
	

</div>



<%@include file="../inc/bottom.jsp"%>