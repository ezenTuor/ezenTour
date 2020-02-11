<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerDetail.css">
<article class="managerDetail">
	<h2>패키지 소분류 상세 보기</h2>
	<div>
		<label>패키지 소분류 번호</label>
		<div>${detailViewVo.packDno}</div>
	</div>
	<div>
		<label>패키지 대분류</label>
		<div>번호 : ${detailViewVo.packNo}</div>
		<div>이름 : ${detailViewVo.name}</div>
	</div>
	<div>
		<label>이용 항공사</label>
		<div>${detailViewVo.airline }</div>
	</div>
	<div>
		<label>한국 출발 항공</label>
		<div>코드 : ${detailViewVo.depCode}</div>
		<div>출발 : ${detailViewVo.koreaDep }</div>
		<div>도착 : ${detailViewVo.localEnt }</div>
	</div>
	<div>
		<label>한국 도착 항공</label>
		<div>코드 : ${detailViewVo.entCode }</div>
		<div>출발 : ${detailViewVo.localDep }</div>
		<div>도착: ${detailViewVo.koreaEnt }</div>
	</div>
	<div>
		<label>가격</label>
		<div>성인 : ${detailViewVo.man }</div>
		<div>아동 : ${detailViewVo.child }</div>
		<div>유아 : ${detailViewVo.baby }</div>
	</div>
	<div>
		<label>여행 계획일</label>
		<div>${detailViewVo.daysDetail }</div>
	</div>
	<div>
		<label>쇼핑 여부</label>
		<div>${detailViewVo.shopping }</div>
	</div>
	
	<div>
		<label>상세내용</label>
		<div>${detailViewVo.details }</div>
	</div>
	<div>
		<label>인원 [예약가능/최대인원 (최소인원)]</label>
		<div>${detailViewVo.capecityCur}/${detailViewVo.capecity } (${detailViewVo.capecityMin })</div>
	</div>
	<p>
		<a href="<c:url value='/manager/detail/detailEdit.do?packDno=${detailViewVo.packDno}'/>">
			<button>편집</button>
		</a>
		<a href="<c:url value='/manager/schedule/scheduleList.do?packDno=${detailViewVo.packDno}'/>">
			<button>일정보기</button>
		</a>
		<a href="<c:url value='/manager/detail/detailList.do?packNo=${detailViewVo.packNo }'/>">
			<button>목록으로</button>
		</a>
	</p>
</article>
<%@include file="../../inc/adminBottom.jsp"%>