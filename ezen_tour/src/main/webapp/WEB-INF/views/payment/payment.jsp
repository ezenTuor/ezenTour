<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<style type="text/css">
	body {
		background-image: url("<c:url value='/resources/images/7.jpg'/>");
	}
</style>
<script type="text/javascript">
$(function(){
	$("#check_module").click(function() {
		var IMP = window.IMP;
		IMP.init('imp27153221');
		var title="";
		var totalPrice=0;
		var details="";

 		title='${title}';
		totalPrice=${totalPrice};
		details="${details}";
		
		IMP.request_pay({
			pg : 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : 'title',
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



<div>
    <table class="paymentBefore" 
	summary="결제전에 정보를 다시한번 확인하는 페이지">
	<caption>패키지 목록</caption>
	<colgroup>
		<col width="49%" />
		<col width="17%" />
		<col width="17%" />
		<col width="*" />		
	</colgroup>
	<thead>
		<tr>
			<th scope="col">패키지명</th>
			<th scope="col"></th>
			<th scope="col"></th>
			<th scope="col"></th>			
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list }">
			<tr class="align_center">
				<td colspan="4">장바구니가 비었습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:set var="buyPrice" value="0" />
			<c:set var="delivery" value="0" />
			<c:set var="sumPrice" value="0" />
			
			<!--반복 시작 -->	
			<c:forEach var="map" items="${list }">	
				<c:set var="sum" value="${map['SELLPRICE']* map['QUANTITY']}" />
				<tr class="align_right">
					<td class="align_left">
						<img src=
						"<c:url value='/resources/pd_images/${map["IMAGEURL"]}'/>" 
							alt="${map['PRODUCTNAME']}" width="50"
							align="absmiddle">
						${map['PRODUCTNAME']}</td>
					<td><fmt:formatNumber value="${map['SELLPRICE']}" 
						pattern="#,###"/>원 </td>
					<td>${map['QUANTITY']}</td>
					<td><fmt:formatNumber value="${sum}" 
						pattern="#,###"/>원 </td>							
				</tr>
				
				<c:set var="buyPrice" value="${buyPrice+sum }" />				
			</c:forEach>
			<!-- 반복 끝 -->			
			<c:if test="${buyPrice<30000 }">
				<c:set var="delivery" value="3000" />
			</c:if>
			
			<c:set var="sumPrice" value="${buyPrice+delivery }" />
			
			<tr>
				<td colspan="3" align="right" style="border-right:none">
					총 구매금액 : <br>
					   + 배송비 : <br>
					총 주문합계 :    
				</td>
				<td align="right" style="border-left:none">
					<fmt:formatNumber value="${buyPrice}" 
						pattern="#,###"/>원<br>
					<fmt:formatNumber value="${delivery}" 
						pattern="#,###"/>원<br>
					<fmt:formatNumber value="${sumPrice}" 
						pattern="#,###"/>원<br>
						
				</td>
			</tr>
		</c:if>
	</tbody>
</table>
</div>       
<br />
<div class="divForm">    
	<form name="frm1" method="post" 
		action="<c:url value='/shop/order/orderSheet.do'/>" >
	<fieldset>
		<legend>상품 받으시는 분</legend>

		<p class="titleP">
	    	<img src="${pageContext.request.contextPath}/resources/images/dot7.JPG" align="absmiddle" />
	    	<span class="title">주문하시는 분</span>
	    </p>
    
       <p><span class="sp1">이름</span>
         <span id="oName" >${memberVo.name }</span>
	   </p>
       <p>
           <span class="sp1">주소</span>
           <span id="oZipcode">${memberVo.zipcode }</span>
           <span id="oAddress1">${memberVo.address }</span>
           <span id="oAddress2">${memberVo.addressDetail }</span>
       </p>
       <p>
           <span class="sp1">연락처</span>
           <c:if test="${!empty memberVo.hp1}">
	           <span id="oHp1">${memberVo.hp1 }</span>
	           - <span id="oHp2">${memberVo.hp2 }</span>
	           - <span id="oHp3">${memberVo.hp3 }</span>
           </c:if>
		</p>
       <p>
           <span class="sp1">이메일</span>
           <c:if test="${!empty memberVo.email1 }">
	           <span>${memberVo.email1 }@${memberVo.email2 }</span>           
           </c:if>           
       </p>
    
    	<br /> 
	    <p class="titleP">
	    	<img src="${pageContext.request.contextPath}/resources/images/dot7.JPG" align="absmiddle" />
	    	<span class="title">상품 받으시는 분</span>
	    </p>	
	    <p>        
	        <span class="sp1">배송지 선택</span>    	       
	        <input type="radio" name="delivery" id="delivery1" checked> 
	        <label for="delivery1" class="lbl">주문고객과 동일 주소</label>                 
	        <input type="radio" name="delivery"	id="delivery2" > 
	        <label for="delivery2" class="lbl">새로운 주소 입력</label>
	    </p>
        <p>
            <label for="customerName">성명</label> 
            <input type="Text" name="customerName" id="customerName" class="infobox">
        </p>
        <p>
            <label for="zipcode">주소</label>                           
            <input type="Text" name="zipcode" id="zipcode" size="15" title="우편번호" >
&nbsp;		<input type="Button" value="우편번호찾기" id="btnZipcode"/>
            <br />
            <span class="sp1"></span>
            <input type="Text" name="address"  size="60" title="주소"  class="infobox">
            <br />
            <span class="sp1"></span>
            <input type="Text" name="addressDetail"  size="60" title="상세주소"  class="infobox">           
        </p>
        <p>
            <label for="hp">연락처</label>
            <input type="Text" name="hp" id="hp" size="17"  class="infobox">
        </p>
        <p>
            <label for="message">배송시 요청사항</label>
                <textarea name="message" id="message" cols="82" rows="3" ></textarea>
        </p>    
	
    <br />
    <p class="titleP">
    	<img src="${pageContext.request.contextPath}/resources/images/dot7.JPG" align="absmiddle" />
    	<span class="title">결제 정보</span>
    </p>	
    <p>
        <span class="sp1">결제금액</span>
        <span><fmt:formatNumber value="${sumPrice}" 
						pattern="#,###"/>원</span>
    </p>
    </fieldset>
    </form>
    </div>
    



	<form name="frmPayment" method="post" 
		action="#">
		<p>결제하기</p>
		<button id="check_module" type="button">결제하기</button>
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
<%@ include file="../inc/bottom.jsp" %>