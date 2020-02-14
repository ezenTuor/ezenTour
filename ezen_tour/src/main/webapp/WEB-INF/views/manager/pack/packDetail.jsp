<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerDetail.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerFile.css">
<article class="managerDetail">
	<h2>패키지 상세 보기</h2>
	<div>
		<label>패키지 번호</label>
		<div>${packVo.packNo}</div>
	</div>
	<div>
		<label>패키지명</label>
		<div>${packVo.name}</div>
	</div>
	<div>
		<div>
			<c:if test="${!empty packVo.imgNames}">
				<c:forEach var="imgName" items="${fn:split(packVo.imgNames, '|') }">
					<div class="thumb">
						<img src="<c:url value='/resources/pd_images/${imgName}'/>">
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div>
		<label>해당 대륙 </label>	
		<div>번호 : ${packVo.areaNo}</div>	
		<div>이름 : ${areaName}</div>	
	</div>
	<div>
		<label>해당국가</label>
		<div>${packVo.country}</div>
	</div>
	<div>
		<label>해당도시</label>
		<div>${packVo.city}</div>
	</div>
	
	<div>
		<label>키워드</label>
		<div>${packVo.keyword}</div>
	</div>
	
	<div>
		<label>이용 항공사</label>
		<div>${packVo.airport }</div>
	</div>
	
	<div>
		<label>여행계획일</label>
		<div>${packVo.days }</div>
	</div>
	
	<div>
		<label>출발요일</label>
		<div>${packVo.daysWeek}</div>
	</div>
	
	<div>
		<label for="detail">상세설명</label>
		<div>${packVo.detail}</div>
	</div>
	<p>
		<a href="<c:url value='/manager/pack/packEdit.do?packNo=${packVo.packNo}'/>">
			<button>편집</button>
		</a>
		<a href="<c:url value='/manager/detail/detailList.do?packNo=${packVo.packNo}'/>">
			<button>소분류보기</button>
		</a>
		<a href="<c:url value='/manager/pack/packList.do'/>">
			<button>목록으로</button>
		</a>
	</p>
</article>
<%@include file="../../inc/adminBottom.jsp"%>