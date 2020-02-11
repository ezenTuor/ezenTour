<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

#tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
#tab li {
	float: left;
}
/* Style the links inside the list items */
#tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: rgb(0, 154, 200);
	padding: 6px 12px;
	color: #fff;
}

ul.tab li.current {
	background-color: rgb(0, 154, 200);
	color: #222;
}

.tabcontent.current {
	display: block;
}
</style>
<ul class="tab" id="tab">
	<li class="current" data-tab="tab1"><a href="#">고유식별정보 수집 및<br>이용동의 (필수)</a></li>
	<li data-tab="tab2"><a href="#">개인정보 제3자<br>제공 및 공유 (필수)</a></li>
	<li data-tab="tab3"><a href="#">개인정보 수집 및<br>이용동의 (선택)</a></li>
</ul>
<div id="tab1" class="tabcontent">
<h5 class="tit">고유식별정보 수집 및 이용 동의(필수)</h5>
	 <table class="tbl_basic">
		<caption>
			고유식별정보 수집 및 이용동의 필수선택 리스트
		</caption>
		<colgroup>
			<col style="width:33.3%">
			<col style="width:33.3%">
			<col>
		</colgroup>
		<thead>
		<tr>
			<th>항목</th>
			<th>수집목적</th>
			<th>보유기간</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>여권정보(여권번호,여권만료일)</td>
			<td>항공권 예약/발권</td>
			<td>개인정보 처리 목적 달성시 즉시 파기</td>
		</tr>
		</tbody>
	</table>
	<p>위의 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다.<br>그러나 동의를 거부할 경우 예약 서비스 이용이 불가함을 알려드립니다.</p>
						</div>
					</div>
					<div class="box_check">
						<input type="checkbox" id="privacy_check3" name="privacy_check" value="4" class="chk_step"><label for="privacy_check3"><span></span>고유식별정보 수집 및 이용에 동의합니다.</label>
						<p id="msg_privacy_check3" class="must_check"></p>
					</div>
				</div>
	
</div>
<div id="tab2" class="tabcontent">
<h5 class="tit">개인정보 제3자 제공 및 공유에 대한 동의(필수)</h5>
	<table class="tbl_vertical">
	<caption>개인정보 수집항목 - 선택항목</caption>
	<colgroup>
		<col style="width:24%">
		<col>
		<col style="width:28%">
		<col style="width:20%">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">제공받는 자</th>
		<th scope="col">제공 목적</th>
		<th scope="col">제공하는 항목</th>
		<th scope="col">보유 및 이용기간</th>
	</tr>	
	</thead>
	<tbody>
	<tr>
		<td><span class="txt_align type_btn">항공사<button type="button" class="btn_wit">상세보기</button></span></td>
		<td rowspan="3">항공권 예약/발권/결제 및 서비스 제공</td>
		<td rowspan="3">성명, 생년월일, 여권정보(여권번호, 여권만료일), 휴대전화번호, 마일리지 정보, 카드정보(카드번호, 카드만료일), 환불 시(은행명, 계좌번호, 예금주)</td>
		<td rowspan="10">개인정보 처리 목적 달성 시<br>즉시 파기</td>
	</tr>
	<tr>
		<td>토파스여행정보</td>
	</tr>
	<tr>
		<td>아시아나세이버</td>
	</tr>
	<tr>
		<td><span class="txt_align type_btn">크루즈<button type="button" class="btn_wit">상세보기</button></span></td>
		<td>크루즈 예약 진행 및 관리</td>
		<td>성명, 생년월일, 여권정보(여권번호, 여권만료일), 휴대전화번호</td>
	</tr>
	<tr>
		<td><span class="txt_align type_btn">호텔 및 숙박시설<button type="button" class="btn_wit">상세보기</button></span></td>
		<td>호텔, 숙박 예약 진행 및 관리</td>
		<td rowspan="3">성명, 생년월일, 여권정보(여권번호, 여권만료일)</td>
	</tr>
	<tr>
		<td><span class="txt_align type_btn">랜드사<button type="button" class="btn_wit">상세보기</button></span></td>
		<td>현지 행사 진행 및 고객 관리</td>
	</tr>
	<tr>
		<td><span class="txt_align type_btn">비자발급대행사<button type="button" class="btn_wit">상세보기</button></span></td>
		<td>비자 발급 및 확인</td>
	</tr>
	<tr>
		<td>KB손해보험</td>
		<td>여행자 보험 가입 및 보험금 청구 시 본인확인</td>
		<td>성명, 생년월일, 성별, 휴대전화번호</td>
	</tr>
	<tr>
		<td><span class="txt_align type_btn">호텔 예약 대행사<button type="button" class="btn_wit">상세보기</button></span></td>
		<td>호텔 예약 서비스 제공</td>
		<td>성명, 이메일주소, 아동나이</td>
	</tr>
	<tr>
		<td>네이버</td>
		<td>항공권 예약정보 확인 및 이벤트성 포인트 적립</td>
		<td>네이버 이용자 고유 식별자, 휴대전화번호 뒤 4자리, 항공권 예약정보</td>
	</tr>
	<tr>
		<td>에이스손해보험, 여행보험 대리점 인스밸리 </td>
		<td>여행보험 가입, 결제 및 환불, 보험금 지급 서비스 제공 </td>
		<td>영문명,생년월일,성별,연락처(이메일)</td>
		<td>서비스 제공 및 관계법령에 따른 보존기간</td>
	</tr>
	</tbody>
	</table>
	<p>위의 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다.<br>그러나 동의를 거부할 경우 예약 서비스 이용이 불가함을 알려드립니다.</p>
</div>

						</div>
					</div>
					<div class="box_check">
						<input type="checkbox" id="privacy_check4" name="privacy_check" value="5" class="chk_step"><label for="privacy_check4"><span></span>개인정보 제3자 제공 및 공유에 동의합니다.</label>
						<p id="msg_privacy_check4" class="must_check"></p>
					</div>
				</div>	
</div>
<div id="tab3" class="tabcontent">
<div class="step_box box_agree" id="term_con5" title="개인정보 수집 및 이용동의(선택)" style="display: none">
					<div class="txt_agree" id="box_agree_marketing">
						<div class="wrap_agree" id="privacyUtilAgree_0_1001002">
							<h5 class="tit">개인정보 수집 및 이용 동의(선택)</h5>
	<h6 class="tit_sub">여행 상품 상담, 예약, 물품 배송</h6>
	<table class="tbl_basic">
		<caption>
			개인정보 제3자 제공 및 공유에 대한 동의 리스트
		</caption>
		<colgroup>
			<col style="width:33.3%">
			<col style="width:33.3%">
			<col>
		</colgroup>
		<thead>
		<tr>
			<th>수집항목</th>
			<th>수집목적</th>
			<th>보유기간</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>예약자(자택전화번호),여행자(휴대폰번호)</td>
			<td>여행 상품 상담/예약, 물품 배송</td>
			<td>개인정보 처리 목적 달성시 즉시파기</td>
		</tr>
		</tbody>
	</table>
	<p>동의를 거부하시는 경우에도 예약 서비스를 이용하실 수 있습니다.</p>
						</div>
					</div>
					<div class="box_check">
						<input type="checkbox" id="privacy_check5" class="chk_step"><label for="privacy_check5"><span></span>개인정보 수집 및 이용에 동의합니다.</label>
						<p id="msg_privacy_check5" class="must_check"></p>
					</div>
				</div>	
</div>
<script>
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
</script>
<%@ include file="../inc/bottom.jsp"%>