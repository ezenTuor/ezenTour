<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/adminTop.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/managerList.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("#ckAll").click(function(){
		var all=$("#ckAll").prop("checked");
		$("input[name=delCheck]").each(function(){
			$(this).prop("checked",all);
		});
	});
	
	$("#del").click(function(){
		var cnt=0;
		var str="";
		$("input[name=delCheck]:checked").each(function(){
			if(str!=""){
				str+="|";
			}
			str+=$(this).val();
			cnt+=1;
		});
		
		//alert(cnt+"개의 쿠폰이 삭제됩니다.");
		//alert(str);
		
		if(confirm(cnt+"개의 쿠폰을 삭제하시겠습니까?")){
			$("#delNums").val(str);
			$("from[name=del]").submit();
		}
	});
});
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}
</script>
<article class="managerTable">
	<h2>쿠폰 - 관리자</h2>
	
	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/manager/cupon/cuponList.do'/>" name="frmPage" method="post">
		<input type="text" name="currentPage">현재 페이지
	</form>
	
	<table>
		<thead>
			<tr>
				<th scope="col">
					<input type="checkbox" id="ckAll">
				</th>
				<th scope="col">쿠폰 번호</th>
				<th scope="col">할인 타입</th>
				<th scope="col">할인</th>
				<th scope="col">만료 타입</th>
				<th scope="col">만료일</th>
				<th scope="col">등록일</th>
				<th scope="col">삭제여부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr class="align_center">
					<td colspan="8">등록된 쿠폰이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="detail" items="${list}">
					<tr>
						<td>
							<input type="checkbox" name="delCheck" value="${detail.cuponSerial}">
						</td>
						<td>${detail.cuponSerial}</td>
						<td>
							<c:if test="${detail.cuponKind=='P'}">
								% 할인
							</c:if>
							<c:if test="${detail.cuponKind=='D'}">
								금액 할인
							</c:if>
							(${detail.cuponKind})
						</td>
						<td>
							<c:if test="${detail.cuponKind=='P'}">
								${detail.discount} %
							</c:if>
							<c:if test="${detail.cuponKind=='D'}">
								${detail.discount} 원
							</c:if>
						</td>
						<td>
							<c:if test="${detail.delType=='A'}">
								절대적
							</c:if>
							<c:if test="${detail.delType=='R'}">
								상대적
							</c:if>
							(${detail.delType})
						</td>
						<td>
							<c:if test="${detail.delType=='A'}">
								${fn:substring(detail.deldate,0,10)}
							</c:if>
							<c:if test="${detail.delType=='R'}">
								<fmt:parseDate value='${detail.deldate}' var='tempdate' pattern='yyyy-mm-dd'/>
								<fmt:parseNumber var='temptime' value='${tempdate.time}' integerOnly="true"/>
								<fmt:parseDate value='2020-01-01' var='standard' pattern='yyyy-mm-dd'/>
								<fmt:parseNumber var='systime' value='${standard.time}' integerOnly="true"/>
								<c:set var="mil" value="${temptime-systime}"/>
								<c:set var="day" value="${mil/(1000*60*60*24) }"/>
								${day}일
							</c:if>
						</td>
						<td>${detail.regdate}</td>
						<td>${detail.delFlag}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

	<div class="divPage">
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
				src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
			</a>
		</c:if>

		<c:forEach var="i" begin="${pagingInfo.firstPage }"
			end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color: blue; font-weight: bold">${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageFunc(${i})"> [${i}]</a>
			</c:if>
		</c:forEach>

		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
				src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
			</a>
		</c:if>
	</div>
	
	<div>
		<form name="del" action="<c:url value='/manager/cupon/cuponDelete.do'/>" method="post">
			<input type="hidden" name="delNums" id="delNums">
			<button id="del">삭제하기</button>
		</form>
	</div>
</article>
<%@include file="../../inc/adminBottom.jsp"%>