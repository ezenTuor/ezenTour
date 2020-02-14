<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerList.css">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">	
$(function(){
	$("#check_module").click(function() {
		var IMP = window.IMP;
		IMP.init('imp27153221');
		var title="";
		var totalPrice=0;
		var details="";

 		title='${title}';
		//totalPrice=${totalPrice};
		totalPrice=1000;
		details="${details}"+"요청사항 : "+$("#message").val();
		
		IMP.request_pay({
			pg : 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : title,
			amount : totalPrice,
			buyer_email : '${memberVo.email1}@${memberVo.email2}',
			buyer_name : "${memberVo.name}",
			buyer_tel :'${memberVo.hp1}-${memberVo.hp2}-${memberVo.hp3}',
			buyer_addr : '${memberVo.address}',
			buyer_postcode : '${memberVo.zipcode}',
			
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				/* $.ajax({
			    	url: "<c:url value='/PaymentCheck.do'/>",
			        method: "POST",
			        headers: { "Content-Type": "application/json" },
			        data: {
			            imp_uid: rsp.imp_uid,
			            merchant_uid: rsp.merchant_uid,
						
			  		}
				}); */
				
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid+"<br>";
				msg += '상점 거래ID : ' + rsp.merchant_uid+"<br>";
				msg += '결제 금액 : ' + rsp.paid_amount+"<br>";
				msg += '카드 승인번호 : ' + rsp.apply_num+"<br>";
				
				//input 설정 및 submmit
				
				$("#test1").val(${memberVo.userNo});
				$("#test2").val();
				$("#test3").val(rsp.paid_amount);
				$("#test4").val();
				$("#test5").val('card');
				$("#test6").val(details);
				$("#test7").val(rsp.merchant_uid);
				$("#test8").val(rsp.imp_uid);
				$("form[name=frmSuccess]").submit();
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
});
</script>
<style>
	.managerTable{
		background: white;
		width: 70%;
		margin: 0 auto;
		text-align: center;
	}
</style>
<article class="managerTable">
<div>
<div style="width: 100%">
    <table class="paymentBefore" 
	summary="결제전에 정보를 다시한번 확인하는 페이지" style="width: 100%">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<thead style="border-bottom:0;">
		<tr>
			<th scope="col">NO</th>
			<th scope="col">상품명</th>
			<th scope="col">인원</th>
			<th scope="col">여행기간</th>		
		</tr>
	</thead>
	<tbody>
			<!--반복 시작 -->	
			<c:forEach var="vo" items="${list }">	
				<tr class="align_right" style="border-top: 1px solid #5a90f3">
					<td class="align_left">
						${vo.wishNo}</td>
					<td>${vo.name}</td>
					<td>성인 : ${vo.man } 명<br>
						아동 : ${vo.child} 명<br>
						유아 : ${vo.baby} 명<br></td>	
					<td>${fn:substring(vo.koreaDep,0,16)}<br>
					${fn:substring(vo.koreaEnt,0,16)}</td>				
				</tr>
				
			</c:forEach>
	</tbody>
</table>
</div>       
<br />
<div class="divForm" style="width: 100%">    
	<fieldset>
		
		<p class="titleP">
	    	<span class="title">예약하시는 분</span>
	    </p>
    <br>
       <p><span class="sp1">이름 :</span>
         <span id="oName" >${memberVo.name }</span>
	   </p>
       <p>
           <span class="sp1">주소 :</span>
           <span id="oZipcode">${memberVo.zipcode }</span>
           <span id="oAddress1">${memberVo.address }</span>
           <span id="oAddress2">${memberVo.addressDetail }</span>
       </p>
       <p>
           <span class="sp1">연락처 :</span>
           <c:if test="${!empty memberVo.hp1}">
	           <span id="oHp1">${memberVo.hp1 }</span>
	           - <span id="oHp2">${memberVo.hp2 }</span>
	           - <span id="oHp3">${memberVo.hp3 }</span>
           </c:if>
		</p>
       <p>
           <span class="sp1">이메일 :</span>
           <c:if test="${!empty memberVo.email1 }">
	           <span>${memberVo.email1 }@${memberVo.email2 }</span>           
           </c:if>           
       </p>
    
    	<br /> 
	    
        <p>
            <label for="message">요청사항</label><br>
                <textarea name="message" id="message" cols="82" rows="3" ></textarea>
        </p>    
	
    <br />	
    <p>
        <span class="sp1">총 결제금액 : </span>
        <span><fmt:formatNumber value="${totalPrice}" 
						pattern="#,###"/>원</span>
    </p>
    </fieldset>
</div>
    



	<form name="frmPayment" method="post" 
		action="#">
		<p><button id="check_module" type="button">결제하기</button></p>
	</form>
	<form name="frmSuccess" method="post"
		action="<c:url value='/payment/paymentInsert.do'/>">
		<input type="hidden" name="paymentNo" value="0">
		<input type="hidden" name="userNo" value="" id="test1">
		<input type="hidden" name="discount" value="0" id="test2">
		<input type="hidden" name="price" value="" id="test3">
		<input type="hidden" name="state" value="" id="test4">
		<input type="hidden" name="type" value="" id="test5">
		<input type="hidden" name="detail" value="" id="test6">
		<input type="hidden" name="merchUid" value="" id="test7">
		<input type="hidden" name="impUid" value="" id="test8">
		<input type="hidden" name="nums" value="${nums}">
	</form>
</article>
<%@ include file="../inc/bottom.jsp" %>