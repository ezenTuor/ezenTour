<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/inc/top.do"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">	
	$(function(){
		$(".box2 tbody tr").hover(function(){
			$(this).css("background","lightblue");
		}, function(){
			$(this).css("background","");
		});	
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.submit();
	}
	function shift1() {
		location.href="<c:url value='/support/writeSupport.do'/>";
	}
	function shift2() {
		location.href="<c:url value='/support/support.do'/>";
	}
</script>
<style type="text/css">
	.divList{
		width: 1064px;
		margin: auto;
	}
	
	table{
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		margin: auto;
		width: 1064px;
	}
	table th{
		background-color: #ddd;
		border-right: 1px solid #ccc;
   		border-bottom: 1px solid #ccc;
    	border-top: 1px solid #fff;
    	border-left: 1px solid #fff;
	}
	table td{
		vertical-align: top;
    	border-right: 1px solid #ccc;
    	border-bottom: 1px solid #ccc;
    	font-size: 13px;
    	color: #424242;
    	line-height: 18px;
	}
	.divList ul li{
		float: left;
		width: 530px;
		border-top: 1px solid gray;
		border-left: 1px solid gray;
		border-right: 1px solid gray;
		text-align: center;
		height: 55px;
		background-color: #ddd;
	}
	
	.divList ul li{
		border-top: 1px solid black;
		border-left: 1px solid black;
		border-right: 1px solid black;
		background-color: white;
	}
	tr th{
    	text-align: center;
    	background-color: #f2f2f2;
    	font-size: 13px;
    	font-weight: 600;
    	border-right: 1px solid #e4e4e4;
    	border-bottom: 1px solid #e4e4e4;
	}
	.divSearch,#frmSearch{
		width: 1064px;
		margin: auto;
		align-content: center;
		margin-bottom: 40px;
	}
	.shift{
		text-decoration: none;
		font-size: 13px;
		color: black;
		float: right;
		margin-top: 8px;
	}
</style>	
</head>	
<body>
<div class="divList">
<h2 style="color: black; float: left; font-weight: bold;">건의사항</h2>
<br>
<br>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
		${pagingInfo.totalRecord }건 검색되었습니다.</p>	
</c:if>
<br>
<br>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/support/mySupport.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="hidden" name="currentPage" >
</form>


<table>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:20%;" />
		<col style="width:20%;" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성일</th>
	    <th scope="col">답변상태</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty list }">
			<tr class="align_center">
				<td colspan="4" style="text-align: center;">검색된 건의사항이 없습니다.</td>
			</tr>
		</c:if>  
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">				
				<tr  style="text-align:center">
					<td>${vo.supportNo}</td>
					<td style="text-align:left">
							<a href
							="<c:url value='/support/supportDetail.do?supportNo=${vo.supportNo}&groupNo=${vo.groupNo }'/>">
								<c:if test="${fn:length(vo.title)>30}">
									${fn:substring(vo.title, 0,30)}...
								</c:if>
								<c:if test="${fn:length(vo.title)<=30}">
									${vo.title}
								</c:if>													
							</a>
						</td>
					<td><fmt:formatDate value="${vo.regdate }" 
						pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<c:if test="${vo.asFlag=='N'}">
							답변중
						</c:if>
						<c:if test="${vo.asFlag=='Y'}">
							답변 완료
						</c:if>
					</td>	
				</tr>
	  		</c:forEach>
	  	</c:if>
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">		
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight: bold">${i}</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				[${i}]</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
		</a>
	</c:if>	
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" id="frmSearch"
   		action='<c:url value="/support/support.do"/>'>
        <select name="searchCondition">
            <option value="title" 
            	<c:if test="${param.searchCondition=='title' }">
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content' }">
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="name" 
            	<c:if test="${param.searchCondition=='name' }">
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
		
		<input type="button" class="shift" style="height: 24px; margin-left: 5px;" value="글쓰기" onclick="shift1()">
		<input type="button" class="shift" style="height: 24px; margin-left: 5px;" value="전체 목록" onclick="shift2()">
    </form>
</div>

</body>
</html>
<%@ include file="../inc/bottom.jsp" %>