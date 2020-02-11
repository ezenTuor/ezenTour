<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order.jsp</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="content_block" id="content">

		<h3 class="tit_con_title line">예약하기</h3>

		<ol class="list_step rsv_pdt">
			<li class="step_1 on">정보입력 및 약관동의</li>
			<li class="step_last">예약완료</li>
		</ol>

		<div class="box_guide wline">



			<h4 class="tit_brd_info">선택하신 상품정보를 확인하신 후 정보를 입력하여 예약을 진행해 주세요.</h4>
			<ul class="con_info_list">
				<li>해당 예약은 담당자가 확인 후 확정되며, 최종 예약 확정이 완료되면 예약금 결제 부탁 드립니다.</li>
				<li>예약금은 일정표를 참고해주시거나, 담당자에게 안내 받으실 수 있습니다.<br>최종 예약 확정 후
					담당자와 약속한 시간 내에 예약금을 입금하지 않을 경우 임의 취소 될 수 있습니다.
				</li>
			</ul>



			<!-- 비회원 예약&&마일리지 존재시 노출 -->

			<!-- // 비회원 예약시&&마일리지 존재시 노출 -->

			<!-- 비회원 예약&&마일리지 미존재시 노출 -->

			<!-- // 비회원 예약시&&마일리지 미존재시 노출 -->

		</div>

		<form name="frm" id="frm" method="post">
			<input type="hidden" name="evCd" value="AVP8030-200207VJ00">
			<input type="hidden" name="goodsCd" value="AVP8030"> <input
				type="hidden" name="mgmUserId" value="4356"> <input
				type="hidden" name="mgmUserNm" value="오진아"> <input
				type="hidden" name="mgmDeptCd" value="BF335"> <input
				type="hidden" name="mgmDeptNm" value="동남아4팀"> <input
				type="hidden" name="menu" value="PKG"> <input type="hidden"
				name="loc" value=""> <input type="hidden" name="pid"
				value=""> <input type="hidden" name="dspSid" value="AABM002">
			<input type="hidden" name="promotionTypeCd" value=""> <input
				type="hidden" name="promotionNo" value=""> <input
				type="hidden" name="webDisplayCls" value="A"> <input
				type="hidden" name="nonCustYn" value="N"> <input
				type="hidden" name="webCustNo" value="12017113224"> <input
				type="hidden" name="repreNo" value="T15685568"> <input
				type="hidden" name="partnerCd" id="partnerCd" value=""> <input
				type="hidden" name="partnerDivi" id="partnerDivi" value="">
			<input type="hidden" name="partnerDiscRat" id="partnerDiscRat"
				value=""> <input type="hidden" name="partnerDiscCnt"
				id="partnerDiscCnt" value=""> <input type="hidden"
				name="partnerCompCd" id="partnerCompCd" value=""> <input
				type="hidden" name="agreePrv" id="agreePrv" value=""> <input
				type="hidden" name="agreeShr" id="agreeShr" value=""> <input
				type="hidden" name="mkAgreeYn" id="mkAgreeYn" value=""> <input
				type="hidden" name="emailYn" id="emailYn" value=""> <input
				type="hidden" name="mobileYn" id="mobileYn" value=""> <input
				type="hidden" name="gender" id="gender" value="M"> <input
				type="hidden" name="agreeUniInfo" id="agreeUniInfo" value="N">
			<input type="hidden" name="agreeSavChoice" id="agreeSavChoice"
				value="N"> <input type="hidden" id="privacy_agree_title"
				value="특별약관">

			<h4 class="stit_con_title">필수 약관 동의</h4>
			<div class="tab_wrap step_box_wrap">
				<ul class="tab_list_cont term_list_tab">
					<li class="on"><a href="#term_con1">특별약관(필수)</a></li>
					<li><a href="#term_con2">개인정보 수집 및<br>이용동의 (필수)
					</a></li>

					<li><a href="#term_con3">고유식별정보 수집 및<br>이용동의 (필수)
					</a></li>

					<li><a href="#term_con4">개인정보 제3자<br>제공 및 공유 (필수)
					</a></li>
					<li><a href="#term_con5">개인정보 수집 및<br>이용동의 (선택)
					</a></li>
				</ul>
				<div class="step_box box_agree" id="term_con1" title="특별약관">


					<div class="txt_agree" id="box_agree_internet">
						<div class="wrap_agree">
							<p>
								<span style="color: rgb(0, 0, 0)">■ 특별약관<br> &nbsp;본
									상품의 예약과 취소는
								</span><span style="color: rgb(255, 0, 0)"><strong>[국외여행
										특별약관]</strong></span><span style="color: rgb(0, 0, 0)">이 적용됩니다.<br>
									상기 상품은 국외여행표준약관(소비자분쟁해결기준)과 달리 특별약관이 적용되어 별도로 아래와 같은 취소수수료 특약이
									적용되며, 별도의 동의 절차를 거치게 됩니다.
								</span>
							</p>

							<p>
								<br> <span style="color: rgb(0, 0, 0)">■ 기간에 따른 취소
									환불 규정<br> <strong>- 여행개시 30일 전까지 취소 통보 시 : 위약금 없음<br>
										- 여행개시 29일 - 21일 전까지 취소 통보 시 : 여행요금 중 80% 배상<br> - 여행개시
										20일 - 17일 전까지 취소 통보 시 : 여행요금 중 90% 배상
								</strong><br> <strong>- 여행개시 16일 -&nbsp; 여행출발 당일 까지 : 여행요금
										중 100% 배상</strong><br> <span style="color: rgb(0, 0, 0)">&nbsp;단,
										출발일과 상관없이 사전 선발권 개별공지 후 발권된 예약건 및 호텔 확정된 예약건에 한하여 </span><span
									style="color: rgb(255, 0, 0)"><strong>"여행요금 중
											100% 배상"</strong> </span><span style="color: rgb(0, 0, 0)">과 동일한 특별약관
										환불규정이 적용됩니다.</span>
								</span>
							</p>

							<p>&nbsp;</p>

							<p>
								<span style="color: rgb(0, 0, 0)">■&nbsp;취소 접수는 업무시간 내에
									유선접수만 가능합니다.<br> &nbsp; - 업무시간 : 월-금 9:00~18:00, 토/일요일 및
									국가 공휴일 제외<br> &nbsp; - 위약금 발생 시점이 주말/공휴일인 경우, 그 전 업무시간까지
									취소 처리가 완료되어야 위약금이 발생하지 않습니다.
								</span>
							</p>

							<p>&nbsp;</p>

							<p>
								<span style="color: rgb(0, 0, 0)">■&nbsp;여행 참자가 수의 미달로
									여행개시 7일전까지 여행계약 해제 통지시 : 전액환급<br> ■&nbsp;여행참가자 수의 미달로 인한
									여행 개시 7일전까지 통지기일 미준수<br> &nbsp;1) 여행개시 1일전까지 통지시 : 여행요금의
									30% 배상<br> &nbsp;2) 여행출발 당일 통지시 : 여행요금의 50% 배상
								</span>
							</p>

							<p>
								<span style="color: rgb(0, 0, 0)">■&nbsp;여행 출발 이후 소비자와
									사업자의 귀책사유 없이 당초 계획과 달리 이행되지 않은 일정이 있는 경우 : 이행되지 않은 일정 해당금액 환급
									(단, 사업자가 이미 비용을 지급하고 환급받지 못하였음을 소비자에게 입증하는 경우와 별도의 비용 지출이 없음을
									입증하는 경우는 제외함.)<br> ■&nbsp;여행 출발 이후 당초 계획과 다른 일정으로 대체 시 당초
									일정의 소요 비용보다 대체 일정의 소요 비용이 적게 든 경우만 차액 환급
								</span>
							</p>

						</div>
					</div>




					<div class="box_check">
						<input type="checkbox" id="privacy_check1" name="privacy_check"
							value="2" class="chk_step"><label for="privacy_check1"><span></span>특별약관에
							동의합니다.</label>
						<p id="msg_privacy_check1" class="must_check"></p>
					</div>
				</div>
				<div class="step_box box_agree" id="term_con2"
					title="개인정보 수집 및 이용 (필수)" style="display: none">
					<div class="txt_agree" id="box_agree_individual">
						<div class="wrap_agree" id="privacyUtilAgree_0_1001003">
							<h5 class="tit">개인정보 수집 및 이용(필수)</h5>
							<table class="tbl_basic">
								<caption>개인정보 수집 및 이용 필수선택 리스트</caption>
								<colgroup>
									<col style="width: 33.3%">
									<col style="width: 33.3%">
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
										<td>성명,주소,휴대전화번호,이메일주소</td>
										<td>여행·상품·상담/예약,물품·배송</td>
										<td rowspan="6">개인정보 처리 목적 달성시 즉시 파기</td>
									</tr>
									<tr>
										<td>성명,생년월일,카드정보(카드번호,카드만료일), 환불시 (은행명,계좌번호,예금주)</td>
										<td class="right_line">대금·결제/환불/정산</td>
									</tr>
									<tr>
										<td>성명,휴대전화번호,이메일주소,생년월일,여권정보(여권번호,여권만료일)</td>
										<td class="right_line">항공권 예약/발권</td>
									</tr>
									<tr>
										<td>성명,휴대전화번호,이메일주소,성별</td>
										<td class="right_line">호텔 예약/관리</td>
									</tr>
									<tr>
										<td>휴대전화번호(소득공제용,지출증빙용),사업자 등록번호(지출증빙용)</td>
										<td class="right_line">현금 영수증 발급</td>
									</tr>
									<tr>
										<td>성명,생년월일,성별,휴대전화번호</td>
										<td class="right_line">여행자보험 가입 및 보험금청구 시 본인확인</td>
									</tr>
								</tbody>
							</table>
							<p>
								위의 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다.<br>그러나 동의를 거부할 경우 예약
								서비스 이용이 불가함을 알려드립니다.
							</p>
						</div>
					</div>
					<div class="box_check">
						<input type="checkbox" id="privacy_check2" name="privacy_check"
							value="3" class="chk_step"><label for="privacy_check2"><span></span>개인정보
							수집 및 이용에 동의합니다.</label>
						<p id="msg_privacy_check2" class="must_check"></p>
					</div>
				</div>

				<div class="step_box box_agree" id="term_con3"
					title="고유식별정보 수집 및 이용동의 (필수)" style="display: none">
					<div class="txt_agree" id="box_sharing_individual">
						<div class="wrap_agree" id="privacyUtilAgree_0_1001004">
							<h5 class="tit">고유식별정보 수집 및 이용 동의(필수)</h5>
							<table class="tbl_basic">
								<caption>고유식별정보 수집 및 이용동의 필수선택 리스트</caption>
								<colgroup>
									<col style="width: 33.3%">
									<col style="width: 33.3%">
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
							<p>
								위의 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다.<br>그러나 동의를 거부할 경우 예약
								서비스 이용이 불가함을 알려드립니다.
							</p>
						</div>
					</div>
					<div class="box_check">
						<input type="checkbox" id="privacy_check3" name="privacy_check"
							value="4" class="chk_step"><label for="privacy_check3"><span></span>고유식별정보
							수집 및 이용에 동의합니다.</label>
						<p id="msg_privacy_check3" class="must_check"></p>
					</div>
				</div>

				<div class="step_box box_agree" id="term_con4"
					title="개인정보 제3자 제공 및 공유 (필수)" style="display: none">
					<div class="txt_agree" id="box_commitment_individual">
						<div class="wrap_agree" id="privacyUtilAgree_0_1001001">
							<div class="wrap_agree" id="privacyUtilAgree_0_1001001">
								<h5 class="tit">개인정보 제3자 제공 및 공유에 대한 동의(필수)</h5>
								<table class="tbl_vertical">
									<caption>개인정보 수집항목 - 선택항목</caption>
									<colgroup>
										<col style="width: 24%">
										<col>
										<col style="width: 28%">
										<col style="width: 20%">
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
											<td><span class="txt_align type_btn">항공사
													<button type="button" class="btn_wit">상세보기</button>
											</span></td>
											<td rowspan="3">항공권 예약/발권/결제 및 서비스 제공</td>
											<td rowspan="3">성명, 생년월일, 여권정보(여권번호, 여권만료일), 휴대전화번호,
												마일리지 정보, 카드정보(카드번호, 카드만료일), 환불 시(은행명, 계좌번호, 예금주)</td>
											<td rowspan="10">개인정보 처리 목적 달성 시<br>즉시 파기
											</td>
										</tr>
										<tr>
											<td>토파스여행정보</td>
										</tr>
										<tr>
											<td>아시아나세이버</td>
										</tr>
										<tr>
											<td><span class="txt_align type_btn">크루즈
													<button type="button" class="btn_wit">상세보기</button>
											</span></td>
											<td>크루즈 예약 진행 및 관리</td>
											<td>성명, 생년월일, 여권정보(여권번호, 여권만료일), 휴대전화번호</td>
										</tr>
										<tr>
											<td><span class="txt_align type_btn">호텔 및 숙박시설
													<button type="button" class="btn_wit">상세보기</button>
											</span></td>
											<td>호텔, 숙박 예약 진행 및 관리</td>
											<td rowspan="3">성명, 생년월일, 여권정보(여권번호, 여권만료일)</td>
										</tr>
										<tr>
											<td><span class="txt_align type_btn">랜드사
													<button type="button" class="btn_wit">상세보기</button>
											</span></td>
											<td>현지 행사 진행 및 고객 관리</td>
										</tr>
										<tr>
											<td><span class="txt_align type_btn">비자발급대행사
													<button type="button" class="btn_wit">상세보기</button>
											</span></td>
											<td>비자 발급 및 확인</td>
										</tr>
										<tr>
											<td>KB손해보험</td>
											<td>여행자 보험 가입 및 보험금 청구 시 본인확인</td>
											<td>성명, 생년월일, 성별, 휴대전화번호</td>
										</tr>
										<tr>
											<td><span class="txt_align type_btn">호텔 예약 대행사
													<button type="button" class="btn_wit">상세보기</button>
											</span></td>
											<td>호텔 예약 서비스 제공</td>
											<td>성명, 이메일주소, 아동나이</td>
										</tr>
										<tr>
											<td>네이버</td>
											<td>항공권 예약정보 확인 및 이벤트성 포인트 적립</td>
											<td>네이버 이용자 고유 식별자, 휴대전화번호 뒤 4자리, 항공권 예약정보</td>
										</tr>
										<tr>
											<td>에이스손해보험, 여행보험 대리점 인스밸리</td>
											<td>여행보험 가입, 결제 및 환불, 보험금 지급 서비스 제공</td>
											<td>영문명,생년월일,성별,연락처(이메일)</td>
											<td>서비스 제공 및 관계법령에 따른 보존기간</td>
										</tr>
									</tbody>
								</table>
								<p>
									위의 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다.<br>그러나 동의를 거부할 경우 예약
									서비스 이용이 불가함을 알려드립니다.
								</p>
							</div>

						</div>
					</div>
					<div class="box_check">
						<input type="checkbox" id="privacy_check4" name="privacy_check"
							value="5" class="chk_step"><label for="privacy_check4"><span></span>개인정보
							제3자 제공 및 공유에 동의합니다.</label>
						<p id="msg_privacy_check4" class="must_check"></p>
					</div>
				</div>

				<!-- 선택추가 -->
				<div class="step_box box_agree" id="term_con5"
					title="개인정보 수집 및 이용동의(선택)" style="display: none">
					<div class="txt_agree" id="box_agree_marketing">
						<div class="wrap_agree" id="privacyUtilAgree_0_1001002">
							<h5 class="tit">개인정보 수집 및 이용 동의(선택)</h5>
							<h6 class="tit_sub">여행 상품 상담, 예약, 물품 배송</h6>
							<table class="tbl_basic">
								<caption>개인정보 제3자 제공 및 공유에 대한 동의 리스트</caption>
								<colgroup>
									<col style="width: 33.3%">
									<col style="width: 33.3%">
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
						<input type="checkbox" id="privacy_check5" class="chk_step"><label
							for="privacy_check5"><span></span>개인정보 수집 및 이용에 동의합니다.</label>
						<p id="msg_privacy_check5" class="must_check"></p>
					</div>
				</div>
				<!-- //선택추가 -->

			</div>

			<div class="block_tit_area title">
				<h4 class="stit_con_title">상품 정보</h4>
			</div>
			<!-- 상품 정보 요약 -->
			<h3 class="stit_con_basic">상품 정보 요약</h3>
			<table class="tbl_basic pdt_info_summary">
				<caption>상품 정보</caption>
				<colgroup>
					<col style="width: 160px">
					<col style="width: 396px">
					<col style="width: 160px">
					<col>
					<col style="width: 160px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label>상품명</label></th>
						<td colspan="5">[푸꾸옥][VJ]빈펄리조트 X 실버 [전일정호텔조식_빈펄테마파크무제한]4일</td>
					</tr>
					<tr>
						<th scope="row"><label>예약 유형</label></th>



						<td><span>대기자 예약 </span>[<span>0명</span><span> 대기자
								예약중]</span></td>



						<th scope="row"><label>여행기간</label></th>
						<td>3박4일</td>
						<th scope="row"><label>이용교통</label></th>
						<td><span class="air_ico"><img
								src="https://static.ybtour.com/images/air/VJ.png" alt="비엣젯항공"></span>


							<span class="air_txt">비엣젯항공</span></td>
					</tr>

					<tr>
						<th scope="row"><label>출발일</label></th>
						<td colspan="5">(한국 출발) 2020년 02월 07일(금) 01:45 (현지 도착) 2020년
							02월 07일(금) 05:10<span class="flight_num_txt">VJ975</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><label>도착일</label></th>
						<td colspan="5">(현지 출발) 2020년 02월 10일(월) 15:20 (한국 도착) 2020년
							02월 10일(월) 22:45<span class="flight_num_txt">VJ974</span>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- //상품 정보 요약 -->

			<!-- 여행 경비 -->






			<h3 class="stit_con_basic">여행경비</h3>
			<table class="tbl_vertical trv_cost">
				<caption>여행경비</caption>
				<colgroup>
					<col style="width: 210px">
					<col style="width: 230px">
					<col style="width: 230px">
					<col style="width: 230px">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">구분</th>
						<th scope="col">기본 여행경비</th>
						<th scope="col">유류 할증료</th>
						<th scope="col">제세공과금</th>
						<th scope="col">총 운임</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>성인</td>
						<td><span class="price_align">899,000원</span></td>
						<td><span class="price_align">0원</span></td>
						<td><span class="price_align"> 0원 </span></td>
						<td><span class="price_align"> <em class="emp_red">
									899,000원 </em></span></td>
					</tr>
					<tr>
						<td>아동</td>
						<td><span class="price_align">749,000원</span></td>
						<td><span class="price_align">0원</span></td>
						<td><span class="price_align"> 0원 </span></td>
						<td><span class="price_align"> <em class="emp_red">
									749,000원 </em>
						</span></td>
					</tr>
					<tr>
						<td>유아</td>
						<td><span class="price_align">150,000원</span></td>
						<td><span class="price_align">0원</span></td>
						<td><span class="price_align"> 0원 </span></td>
						<td><span class="price_align"> <em class="emp_red">
									150,000원 </em>
						</span></td>
					</tr>
				</tbody>
			</table>
			<ul class="tbl_info_list">
				<li>항공권 포함, 유류할증료 등은 변동 가능</li>
			</ul>
			<!-- //여행 경비 -->

			<!-- 노랑풍선 마일리지 -->
			<h3 class="stit_con_basic">노랑풍선 마일리지</h3>



			<table class="tbl_basic">
				<caption>노랑풍선 마일리지</caption>
				<colgroup>
					<col style="width: 160px">
					<col>
					<col style="width: 160px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label>적립 예상 마일리지</label></th>
						<td>8,990 풍선 (성인 1인 기준)</td>
						<th scope="row"><label>예상 적립 일자</label></th>
						<td>2020년 02월 17일</td>
					</tr>
				</tbody>
			</table>
			<ul class="tbl_info_list">
				<li>적립 예상 노랑풍선 마일리지이며, 프로모션 적용 및 결제 방법에 따라 변동될 수 있습니다.</li>
				<li>여행 도착일 7일 이후 자동 적립되며, 비회원의 경우 적립 기준일 이전에 회원 가입하여 별도 적립해야
					합니다. (적립 기준일 이후에는 적립되지 않습니다.)</li>
				<li>진행되는 프로모션에 따라 적립 기준일이 상이할 수 있습니다.</li>
				<li>예약 일행 별로 적용되는 프로모션에 따라 마일리지 적립대상에서 제외될 수 있습니다.</li>
			</ul>



			<!-- //노랑풍선 마일리지 -->

			<!-- 예약자 정보 -->
			<div class="block_tit_area title">
				<h3 class="stit_con_basic">예약자 정보</h3>
				<div class="p_align_right">
					<p class="txt_tbl_info">
						<span class="ico_tbl_must" title="필수입력 아이콘"></span> 는 필수입력 항목입니다.
					</p>
				</div>
			</div>
			<table class="tbl_basic">
				<caption>예약자 정보</caption>
				<colgroup>
					<col style="width: 160px">
					<col style="width: 396px">
					<col style="width: 160px">
					<col>
					<col style="width: 160px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label>이름</label></th>
						<td>김준하 <input type="hidden" name="custNmKor" id="custNmKor"
							value="김준하">
						</td>
						<th scope="row"><label>생년월일</label></th>
						<td id="birth_td">1993.06.26 <input type="hidden"
							name="birthDt" id="birthDt" value="19930626">
						</td>
						<th scope="row" id="gender_th"><label>성별<span
								title="필수입력" class="ico_tbl_must"></span></label></th>
						<td id="gender_td">남성</td>
					</tr>
					<tr>
						<th scope="row"><label>이메일<span class="ico_tbl_must"
								title="필수입력"></span></label></th>
						<td colspan="5">
							<div class="tbl_line">
								<input type="text" placeholder="이메일 아이디" title="이메일 아이디 입력"
									name="email1" id="email1" maxlength="20" value="nm30205">
								<span class="txt_at">@</span> <input type="text"
									placeholder="이메일 도메인" title="이메일 도메인 입력" name="email2"
									id="email2" maxlength="20" value="naver.com">
								<div class="select normal yb_select" style="width: 150px">
									<select title="이메일 도메인 선택" name="selectemail" id="selectemail"
										style="">
										<option value="">직접입력</option>

										<option value="naver.com">네이버</option>

										<option value="hanmail.net">한메일</option>

										<option value="nate.com">네이트</option>

										<option value="daum.net">다음</option>

										<option value="gmail.com">구글</option>

										<option value="hotmail.com">핫메일</option>

										<option value="yahoo.com">야후</option>

									</select>
									<div class="selectIn" style="width: 56px;">
										<button type="button" class="currSel">직접입력</button>
										<ul class="list">
											<li><button type="button" value="">직접입력</button></li>
											<li><button type="button" value="naver.com">네이버</button></li>
											<li><button type="button" value="hanmail.net">한메일</button></li>
											<li><button type="button" value="nate.com">네이트</button></li>
											<li><button type="button" value="daum.net">다음</button></li>
											<li><button type="button" value="gmail.com">구글</button></li>
											<li><button type="button" value="hotmail.com">핫메일</button></li>
											<li><button type="button" value="yahoo.com">야후</button></li>
										</ul>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="mobileNo">휴대폰 번호<span
								class="ico_tbl_must" title="필수입력"></span></label></th>
						<td>
							<div class="tbl_line">
								<input type="text" id="mobileNo" name="mobileNo"
									value="01045554341" placeholder="'-' 제외 숫자만 입력">
							</div>
						</td>
						<th scope="row"><label for="telNo">전화번호</label></th>
						<td colspan="3">
							<div class="tbl_line">
								<input type="text" id="telNo" name="telNo" value=""
									placeholder="'-' 제외 숫자만 입력" readonly="">
								<p class="must_check" id="msgTelNo">개인정보수집 및 이용(선택) 에 동의하셔야
									입력하실 수 있습니다.</p>
							</div>
						</td>
					</tr>
					<!-- 협력제휴업체 인증 -->

					<tr>
						<td colspan="6" class="company_certify">
							<p class="txt_normal emp_blue">
								기업업체 회원인 경우 눌러서 인증을 진행하신 후 예약해 주세요. <a href="#"
									class="underline_link arrow">기업업체 회원</a>
							</p>
						</td>
					</tr>


					<tr class="box_company">
						<th scope="row"><label for="rsv_num3">협력제휴업체번호</label></th>
						<td colspan="5">
							<div class="tbl_line">
								<input type="text" id="partnerCheck"
									placeholder="기업체 회원인 경우만 인증을 진행해 주세요." style="width: 377px">
								<button type="button" class="btn_nor" id="btnPartnerCheck">인증</button>
								<p class="must_check" style="display: none" id="checkAfterForm">
									기업 업체 인증이 완료되었습니다. 해외패키지에 한해 <strong id="saleInfo">기본상품가의
										% 할인(최대 명)</strong>이 적용됩니다. (타상품 제외), 최종 혜택은 담당자 확인 후 적용됩니다.
								</p>
							</div>
						</td>
					</tr>

					<tr class="box_company" id="partnerMemberDisplay"
						style="display: none;">
						<th scope="row"><label for="rsv_num3">본인인증번호</label></th>
						<td colspan="5">
							<div class="tbl_line">
								<input type="text" name="partnerMemberKey" id="partnerMemberKey"
									placeholder="본인인증번호 입력" style="width: 377px">
								<button type="button" class="btn_nor" id="btnPartnerMember">확인</button>
							</div>
						</td>
					</tr>
					<!-- 협력제휴업체 인증 -->

				</tbody>
			</table>
			<ul class="tbl_info_list">
				<li>상품 예약 관련된 모든 이메일/SMS는 수신 동의 여부와 관계없이 자동 발송 됩니다.</li>
				<li>휴대폰 번호와 이메일 주소가 정확하지 않으면 서비스 제공이 불가하오니 입력 내용을 다시 한 번 확인해
					주세요.</li>
			</ul>
			<!-- //예약자 정보 -->

			<!-- 여행자 정보 -->
			<div class="block_tit_area title">
				<h4 class="stit_con_title">여행자 정보</h4>
			</div>
			<h3 class="stit_con_basic">총 인원</h3>
			<table class="tbl_basic psg_age_info">
				<caption>총 인원</caption>
				<colgroup>
					<col style="width: 210px">
					<col>
					<col style="width: 250px">
					<col>
					<col style="width: 250px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="selAdult">성인 (만 12세 이상)</label></th>
						<td>
							<div class="select num" style="width: 130px" id="adtCntBind">
								<select name="adtCnt" id="selAdult" data-flag="adt/A" style="">

									<option value="1">1명</option>

									<option value="2">2명</option>

									<option value="3">3명</option>

									<option value="4">4명</option>

									<option value="5">5명</option>

									<option value="6">6명</option>

									<option value="7">7명</option>

									<option value="8">8명</option>

									<option value="9">9명</option>

									<option value="10">10명</option>

									<option value="11">11명</option>

									<option value="12">12명</option>

									<option value="13">13명</option>

									<option value="14">14명</option>

									<option value="15">15명</option>

									<option value="16">16명</option>

									<option value="17">17명</option>

									<option value="18">18명</option>

									<option value="19">19명</option>

									<option value="20">20명</option>

									<option value="21">21명</option>

									<option value="22">22명</option>

									<option value="23">23명</option>

									<option value="24">24명</option>

									<option value="25">25명</option>

									<option value="26">26명</option>

									<option value="27">27명</option>

									<option value="28">28명</option>

									<option value="29">29명</option>

									<option value="30">30명</option>

								</select>
								<div class="selectIn" style="width: 31px;">
									<button type="button" class="currSel">1명</button>
									<ul class="list">
										<li><button type="button" value="1">1명</button></li>
										<li><button type="button" value="2">2명</button></li>
										<li><button type="button" value="3">3명</button></li>
										<li><button type="button" value="4">4명</button></li>
										<li><button type="button" value="5">5명</button></li>
										<li><button type="button" value="6">6명</button></li>
										<li><button type="button" value="7">7명</button></li>
										<li><button type="button" value="8">8명</button></li>
										<li><button type="button" value="9">9명</button></li>
										<li><button type="button" value="10">10명</button></li>
										<li><button type="button" value="11">11명</button></li>
										<li><button type="button" value="12">12명</button></li>
										<li><button type="button" value="13">13명</button></li>
										<li><button type="button" value="14">14명</button></li>
										<li><button type="button" value="15">15명</button></li>
										<li><button type="button" value="16">16명</button></li>
										<li><button type="button" value="17">17명</button></li>
										<li><button type="button" value="18">18명</button></li>
										<li><button type="button" value="19">19명</button></li>
										<li><button type="button" value="20">20명</button></li>
										<li><button type="button" value="21">21명</button></li>
										<li><button type="button" value="22">22명</button></li>
										<li><button type="button" value="23">23명</button></li>
										<li><button type="button" value="24">24명</button></li>
										<li><button type="button" value="25">25명</button></li>
										<li><button type="button" value="26">26명</button></li>
										<li><button type="button" value="27">27명</button></li>
										<li><button type="button" value="28">28명</button></li>
										<li><button type="button" value="29">29명</button></li>
										<li><button type="button" value="30">30명</button></li>
									</ul>
								</div>
							</div>
						</td>
						<th scope="row"><label for="selKids">아동 (만 2세~만 12세
								미만)</label>
							<div class="tooltip_area age_type">
								<a href="#none" class="btn_tip_open">툴팁정보 보기</a>
								<div class="tooltip">
									<div class="cont">
										<p class="txt">만 2세~만 12세(2008.02.08~2018.02.07 출생)</p>
									</div>
								</div>
							</div></th>
						<td>
							<div class="select num" style="width: 130px" id="chdCntBind">
								<select name="chdCnt" id="selKids" data-flag="chd/C" style="">
									<option value="0">0명</option>

									<option value="1">1명</option>

									<option value="2">2명</option>

									<option value="3">3명</option>

									<option value="4">4명</option>

									<option value="5">5명</option>

									<option value="6">6명</option>

									<option value="7">7명</option>

									<option value="8">8명</option>

									<option value="9">9명</option>

									<option value="10">10명</option>

									<option value="11">11명</option>

									<option value="12">12명</option>

									<option value="13">13명</option>

									<option value="14">14명</option>

									<option value="15">15명</option>

									<option value="16">16명</option>

									<option value="17">17명</option>

									<option value="18">18명</option>

									<option value="19">19명</option>

									<option value="20">20명</option>

									<option value="21">21명</option>

									<option value="22">22명</option>

									<option value="23">23명</option>

									<option value="24">24명</option>

									<option value="25">25명</option>

									<option value="26">26명</option>

									<option value="27">27명</option>

									<option value="28">28명</option>

									<option value="29">29명</option>

									<option value="30">30명</option>

								</select>
								<div class="selectIn" style="width: 31px;">
									<button type="button" class="currSel">0명</button>
									<ul class="list">
										<li><button type="button" value="0">0명</button></li>
										<li><button type="button" value="1">1명</button></li>
										<li><button type="button" value="2">2명</button></li>
										<li><button type="button" value="3">3명</button></li>
										<li><button type="button" value="4">4명</button></li>
										<li><button type="button" value="5">5명</button></li>
										<li><button type="button" value="6">6명</button></li>
										<li><button type="button" value="7">7명</button></li>
										<li><button type="button" value="8">8명</button></li>
										<li><button type="button" value="9">9명</button></li>
										<li><button type="button" value="10">10명</button></li>
										<li><button type="button" value="11">11명</button></li>
										<li><button type="button" value="12">12명</button></li>
										<li><button type="button" value="13">13명</button></li>
										<li><button type="button" value="14">14명</button></li>
										<li><button type="button" value="15">15명</button></li>
										<li><button type="button" value="16">16명</button></li>
										<li><button type="button" value="17">17명</button></li>
										<li><button type="button" value="18">18명</button></li>
										<li><button type="button" value="19">19명</button></li>
										<li><button type="button" value="20">20명</button></li>
										<li><button type="button" value="21">21명</button></li>
										<li><button type="button" value="22">22명</button></li>
										<li><button type="button" value="23">23명</button></li>
										<li><button type="button" value="24">24명</button></li>
										<li><button type="button" value="25">25명</button></li>
										<li><button type="button" value="26">26명</button></li>
										<li><button type="button" value="27">27명</button></li>
										<li><button type="button" value="28">28명</button></li>
										<li><button type="button" value="29">29명</button></li>
										<li><button type="button" value="30">30명</button></li>
									</ul>
								</div>
							</div>
						</td>
						<th scope="row"><label for="selBaby">유아 (만 2세 미만)</label>
							<div class="tooltip_area age_type">
								<a href="#none" class="btn_tip_open">툴팁정보 보기</a>
								<div class="tooltip">
									<div class="cont">
										<p class="txt">만 2세 미만(2018.02.08~2020.02.07 출생)</p>
									</div>
								</div>
							</div></th>
						<td>
							<div class="select num" style="width: 130px" id="infCntBind">
								<select name="infCnt" id="selBaby" data-flag="inf/I" style="">
									<option value="0">0명</option>

									<option value="1">1명</option>

									<option value="2">2명</option>

									<option value="3">3명</option>

									<option value="4">4명</option>

									<option value="5">5명</option>

									<option value="6">6명</option>

									<option value="7">7명</option>

									<option value="8">8명</option>

									<option value="9">9명</option>

									<option value="10">10명</option>

									<option value="11">11명</option>

									<option value="12">12명</option>

									<option value="13">13명</option>

									<option value="14">14명</option>

									<option value="15">15명</option>

									<option value="16">16명</option>

									<option value="17">17명</option>

									<option value="18">18명</option>

									<option value="19">19명</option>

									<option value="20">20명</option>

									<option value="21">21명</option>

									<option value="22">22명</option>

									<option value="23">23명</option>

									<option value="24">24명</option>

									<option value="25">25명</option>

									<option value="26">26명</option>

									<option value="27">27명</option>

									<option value="28">28명</option>

									<option value="29">29명</option>

									<option value="30">30명</option>

								</select>
								<div class="selectIn" style="width: 31px;">
									<button type="button" class="currSel">0명</button>
									<ul class="list">
										<li><button type="button" value="0">0명</button></li>
										<li><button type="button" value="1">1명</button></li>
										<li><button type="button" value="2">2명</button></li>
										<li><button type="button" value="3">3명</button></li>
										<li><button type="button" value="4">4명</button></li>
										<li><button type="button" value="5">5명</button></li>
										<li><button type="button" value="6">6명</button></li>
										<li><button type="button" value="7">7명</button></li>
										<li><button type="button" value="8">8명</button></li>
										<li><button type="button" value="9">9명</button></li>
										<li><button type="button" value="10">10명</button></li>
										<li><button type="button" value="11">11명</button></li>
										<li><button type="button" value="12">12명</button></li>
										<li><button type="button" value="13">13명</button></li>
										<li><button type="button" value="14">14명</button></li>
										<li><button type="button" value="15">15명</button></li>
										<li><button type="button" value="16">16명</button></li>
										<li><button type="button" value="17">17명</button></li>
										<li><button type="button" value="18">18명</button></li>
										<li><button type="button" value="19">19명</button></li>
										<li><button type="button" value="20">20명</button></li>
										<li><button type="button" value="21">21명</button></li>
										<li><button type="button" value="22">22명</button></li>
										<li><button type="button" value="23">23명</button></li>
										<li><button type="button" value="24">24명</button></li>
										<li><button type="button" value="25">25명</button></li>
										<li><button type="button" value="26">26명</button></li>
										<li><button type="button" value="27">27명</button></li>
										<li><button type="button" value="28">28명</button></li>
										<li><button type="button" value="29">29명</button></li>
										<li><button type="button" value="30">30명</button></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- //총 인원 -->

			<!-- 인원 상세 정보 -->
			<div class="block_tit_area title">
				<h3 class="stit_con_basic">인원 상세 정보</h3>
				<div class="p_align_right">
					<p class="txt_tbl_info">
						<span class="ico_tbl_must" title="필수입력 아이콘"></span> 는 필수입력 항목입니다.
					</p>
					<p class="must_check" id="msgMember">개인정보수집 및 이용(선택) 에 동의하셔야
						휴대폰번호를 입력하실 수 있습니다.</p>
				</div>
			</div>

			<table class="tbl_basic traveler_detail" id="tourList">
				<caption>탑승객 상세 정보</caption>
				<colgroup>
					<col style="width: 160px">
					<col style="width: 640px">
					<col style="width: 160px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td colspan="5" class="self_check"><span class="emp_black">김준하
								고객님도 여행에 참여하십니까?</span>
							<ul class="list_one_category">
								<li><span class="form_block"><input type="radio"
										name="chkJoinYN" id="chkJoinY" value="Y"><label
										for="chkJoinY"><span></span>예</label></span></li>
								<li><span class="form_block"><input type="radio"
										name="chkJoinYN" id="chkJoinN" value="N" checked=""><label
										for="chkJoinN"><span></span>아니오</label></span></li>
							</ul></td>
					</tr>
					<tr id="adtTourList">
						<input type="hidden" name="ageDivi" value="A">
						<input type="hidden" name="goodsPrice" value="899000">
						<input type="hidden" name="bafAmt" value="0">
						<input type="hidden" name="taxAmt" value="0">
						<input type="hidden" name="tourNo" value="1">
						<th scope="row"><label>성인 1</label></th>
						<td class="name_check">
							<div class="tbl_line">
								<div class="name_type">
									<span class="ico_tbl_must" title="필수입력"></span> 이름(한글) <input
										type="text" name="resNmKor" id="resNmKor1" title="한글이름 입력"
										placeholder="홍길동">
								</div>
								<div class="name_type">
									(영문) <input type="text" title="영문 성 입력" name="resNmLastEng"
										id="resNmLastEng1" placeholder="Hong"
										onkeyup="fnPressEng(event,this);"> <input type="text"
										title="영문 이름 입력" name="resNmFirstEng" id="resNmFirstEng1"
										placeholder="Gil-dong" onkeyup="fnPressEng(event,this);">
								</div>
							</div>
						</td>
						<th scope="row"><label>휴대폰 번호</label></th>
						<td>
							<div class="tbl_line">
								<input type="number" name="tourlistHphone"
									placeholder="'-' 제외 숫자만 입력" readonly="" id="tourlistHphone1">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- //인원 상세 정보 -->

			<h3 class="stit_con_basic">요청 사항</h3>
			<div class="request_con">
				<textarea placeholder="요청 사항을 적어주세요." name="rervNote" id="rervNote"
					title="내용입력" style="width: 100%"></textarea>
			</div>

			<!-- 상담 지사 선택 -->



			<h3 class="stit_con_basic">상담 지사 선택</h3>
			<table class="tbl_basic prefecture_con">
				<caption>상담 지사 선택</caption>
				<colgroup>
					<col style="width: 160px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label>지사</label></th>
						<td>
							<ul class="list_one_category">
								<li><span class="form_block"><input type="radio"
										name="rervWorkId" id="chkBranch01" value="1" checked="checked"><label
										for="chkBranch01"><span></span>본사</label></span></li>
								<li><span class="form_block"><input type="radio"
										name="rervWorkId" id="chkBranch02" value="2"><label
										for="chkBranch02"><span></span>부산 지사 (부산/경남 지역 고객)</label></span></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>



			<!-- //상담 지사 선택 -->

			<!-- 괌, 사이판 상품인 경우 추가 질의 노출 -->

			<!-- //괌, 사이판 상품인 경우 추가 질의 노출 -->

			<!-- 호주 상품인 경우 추가 질의 노출 -->

			<!-- //호주 상품인 경우 추가 질의 노출 -->

			<div class="box_line">
				<dl class="total_ticket_con">
					<dt>총액</dt>
					<dd class="total_info">
						<ul class="psg_list">
							<li>
								<p class="psg_type">성인</p> <!-- <p class="psg_price"><span class="price_txt">2,489,000 원</span><span>X 1명</span></p> -->
								<p class="psg_price" id="adt_tot">
									<span class="price_txt">899,000</span><span>X&nbsp;&nbsp;1명</span>
								</p>
							</li>
							<li>
								<p class="psg_type">아동</p>
								<p class="psg_price" id="chd_tot">
									<span class="price_txt">749,000</span><span>X&nbsp;&nbsp;0명</span>
								</p>
							</li>
							<li>
								<p class="psg_type">유아</p>
								<p class="psg_price" id="inf_tot">
									<span class="price_txt">150,000</span><span>X&nbsp;&nbsp;0명</span>
								</p>
							</li>
						</ul>
					</dd>
					<dd class="total_price emp_red" id="total_summary">
						<strong>899,000</strong> 원
					</dd>
				</dl>
				<div class="noti_info">
					<h4 class="tit_brd_info">확인하세요!</h4>
					<ul class="tbl_info_list">
						<li>본 상품 가격에는 “항공운임 등 총액(항공권)”이 포함되어 있는 가격이며 유류할증료와 제세공과금은
							유가와 환율에 따라 변동될 수 있습니다.</li>
						<li>아동/유아 기준은 항공사마다 상이하여, 예약 후 최종 확정됩니다.</li>
					</ul>
				</div>
			</div>

			<!-- 2019.02.07 국내 할인 항공권 코드 확인을 위해 주석 처리

			<h4 class="stit_con_title">항공권 예약 유의사항 동의</h4>
			<div class="tab_wrap step_box_wrap">
				<ul class="tab_list_cont rule_list_tab">
					<li class="on"><a href="#rule_con1">일반 규정</a></li>
					<li><a href="#rule_con2">취소/환불 규정</a></li>
					<li><a href="#rule_con3">결제 규정</a></li>
				</ul>
				<div class="step_box box_agree" id="rule_con1">
					<div class="agree_box">
						<div class="agree_txt">
							<ol class="agree_info_list">
								<li>결제 가능 상태에서 구매시한까지 결제요청이 이루어지지 않으면 사전 통보 없이 좌석취소 및 요금변경이 될 수 있으며 이에 여행사는 아무런 책임이 없음을 알려 드립니다.</li>
								<li>타인에게 양도할 수 없으며 항공권은 여정의 순서대로 사용해야 합니다.</li>
								<li>특가항공은 미 확약 상품으로 예약확인 후 항공사에 좌석요청이 진행되며 좌석 지원 불가 또는 요금이 변동될 수 있습니다. 좌석확약 여부에 대해서는 예약 후 영업일 기준<br>약 2~3일 내 안내해 드립니다.</li>
								<li>탑승객 정보는 비행기에 탑승하시는 분의 신분증 상과 같은 성함으로 기재 바랍니다.<br>(탑승자 명이 잘못 입력된 경우 탑승이 거절되지 정확하게 입력 바라며 아동/유아는 생년월일까지 정확하게 기재 바랍니다)</li>
								<li>외국인은 여권상의 영문명과 같게 영문으로 기재 바랍니다.</li>
								<li>결제 후 이름 및 생년월일 변경은 불가하며 재구매하셔야 합니다.<br>(재구매 시 좌석이 소진되어 구매가 어려울 수 있습니다)</li>
							</ol>
						</div>
						<div class="box_check">
							<input type="checkbox" id="agre2_1" name="agre_rules" value="1" class="chk_step"><label for="agre2_1"><span></span>일반 규정에 동의합니다.</label>
							<p id="msg_agre2_1" class="must_check"></p>
						</div>
					</div>
				</div>
				<div class="step_box box_agree" id="rule_con2" style="display:none">
					<div class="agree_box">
						<div class="agree_txt">
							<ul class="agree_info_list">
								<li>결제 후~ 출발 1일 전: 1인 20,000원 취소수수료 부과 (편도 기준)</li>
								<li>출발 당일 및 미탑승: 환급 불가</li>
								<li>특가항공권은 동일구간에만 사용할 수 있으며 편도만 취소/환급되지 않습니다.</li>
								<li>천재지변이나 항공사 사정으로 결항 시 전액 환급됩니다.</li>
								<li>취소 요청은 업무 시간에만 가능합니다. (평일 09:00~18:00, 토/일요일 및 공휴일 제외)</li>
							</ul>
						</div>
						<div class="box_check">
							<input type="checkbox" id="agre2_2" name="agre_rules" value="2" class="chk_step"><label for="agre2_2"><span></span>취소/환불 규정에 동의합니다.</label>
							<p id="msg_agre2_2" class="must_check"></p>
						</div>
					</div>
				</div>
				<div class="step_box box_agree" id="rule_con3" style="display:none">
					<div class="agree_box">
						<div class="agree_txt">
							<ul class="agree_info_list">
								<li>특가 항공권은 무통장입금으로만 결제할 수 있습니다.</li>
								<li>좌석 확약 후 결제 안내는 담당자가 안내해 드립니다.</li>
							</ul>
						</div>
						<div class="box_check">
							<input type="checkbox" id="agre2_3" name="agre_rules" value="3" class="chk_step"><label for="agre2_3"><span></span>결제 규정에 동의합니다.</label>
							<p id="msg_agre2_3" class="must_check"></p>
						</div>
					</div>
				</div>
			</div>
			 -->
			<div class="btn_area">


				<button type="button" id="btnok" class="btn_cof cfrm">예약하기</button>

				<button type="button" id="btnproc" class="btn_cof"
					style="display: none;">처리중</button>
			</div>
		</form>
		<!--[[ 입력폼 End ]]-->
	</div>
</body>
</html>