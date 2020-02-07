<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment.jsp</title>
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
</head>
<body>
	<form name="frmPayment" method="post" 
		action="#">
		<p>결제하기</p>
		<button id="check_module" type="button">결제 모듈 테스트</button>
	</form>
	<form name="frmSuccess" method="post"
		action="<c:url value='/payment/paymentInsert.do'/>">
		<input type="text" name="paymentNo" value="0">
		<input type="text" name="userNo" value="" id="test1">
		<input type="text" name="discount" value="0" id="test2">
		<input type="text" name="price" value="" id="test3">
		<input type="text" name="state" value="" id="test4">
		<input type="text" name="type" value="" id="test5">
		<input type="text" name="detail" value="" id="test6">
		<input type="text" name="merchUid" value="" id="test7">
		<input type="text" name="impUid" value="" id="test8">
		
	</form>
</body>
</html>