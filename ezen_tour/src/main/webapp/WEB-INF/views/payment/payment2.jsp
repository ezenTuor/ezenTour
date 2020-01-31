<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment2.jsp</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#check_module").click(function() {
    // IMP.request_pay(param, callback) 호출
    	var IMP = window.IMP; // 생략가능
			IMP.init('imp27153221');
   	 	IMP.request_pay({ // param
   	    	pg: "inicis",
        	pay_method: "card",
        	merchant_uid: 'merchant_' + new Date().getTime(),
        	name: "노르웨이 회전 의자",
        	amount: 100,
       	 	buyer_email: "gildong@gmail.com",
        	buyer_name: "홍길동",
        	buyer_tel: "010-4242-4242",
        	buyer_addr: "서울특별시 강남구 신사동",
        	buyer_postcode: "01181"
    	}, function (rsp) { // callback
       	 	if (rsp.success) {
        		jQuery.ajax({
                	url: "https://www.myservice.com/payments/complete", // 가맹점 서버
                	method: "POST",
                	headers: { "Content-Type": "application/json" },
                	data: {
                    	imp_uid: rsp.imp_uid,
                    	merchant_uid: rsp.merchant_uid
              		}
        	 	}).done(function (data) {
        			alert("data");
        	 	})
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  });
});
</script>
<script type="text/javascript">
$(function(){
	
	app.use(bodyParser.json());

	app.post("/payments/complete", async (req, res) => {
		try {
			const { imp_uid, merchant_uid } = req.body; 

			const getToken = await axios({
				url: "https://api.iamport.kr/users/getToken",
				method: "post", 
				headers: { "Content-Type": "application/json" }, 
				data: {
					imp_key: "5150307587150842", 
					imp_secret: "BrhiFJZfTxhhx4QlR0RXTje82nGlFXsgpJz4tyjm5BEDFuYxuQvn9Jwc6dxLb02AKBFd9ZAfAfTgJSNe" 
				}
			});
			const { access_token } = getToken.data.response; 

			const getPaymentData = await axios({
				url: "https://api.iamport.kr/payments/${imp_uid}", 
				method: "get", 
				headers: { "Authorization": access_token } 
			});

			const paymentData = getPaymentData.data.response; 


			const order = await Orders.findById(paymentData.merchant_uid);
			const amountToBePaid = order.amount; 

			const { amount, status } = paymentData;
			if (amount === amountToBePaid) { 
				await Orders.findByIdAndUpdate(merchant_uid, { $set: paymentData }); 

				switch (status) {
				case "ready": 
					const { vbank_num, vbank_date, vbank_name } = paymentData;
					await Users.findByIdAndUpdate("/* 고객 id */", { $set: { vbank_num, vbank_date, vbank_name }});
					SMS.send({ text: "가상계좌 발급이 성공되었습니다. 계좌 정보 ${vbank_num} ${vbank_date} ${vbank_name}"});
					res.send({ status: "vbankIssued", message: "가상계좌 발급 성공" });
					break;
				case "paid": 
					res.send({ status: "success", message: "일반 결제 성공" });
					break;
				}
			} else { 
				throw { status: "forgery", message: "위조된 결제시도" };
			}
		} catch (e) {
			res.status(400).send(e);
		}
	});

});
</script>
</head>
<body>
<form name="frmPayment" method="post" 
		action="#">
		<p>아임 서포트 결제 모듈 테스트 해보기</p>
		<button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
</form>
</body>
</html>