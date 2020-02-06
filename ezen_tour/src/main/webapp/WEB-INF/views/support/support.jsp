<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
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
	
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
		${pagingInfo.totalRecord }건 검색되었습니다.</p>	
</c:if>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/support/support.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="hidden" name="currentPage" >
</form>

<div class="divList">
<table>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>
		<c:if test="${empty list }">
			<tr class="align_center">
				<td colspan="5">검색된 건의사항이 존재하지 않습니다.</td>
			</tr>
		</c:if>  
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">				
				<tr  style="text-align:center">
					<td>${vo.no}</td>
					<td style="text-align:left">
							<c:if test="${vo.step>0 }">
								<c:forEach var="k" begin="1" end="${vo.step }">
									&nbsp;
								</c:forEach>
								<img src="<c:url value='/resources/images/re.gif'/>" 
									alt="re이미지">
							</c:if>
							<a href
							="<c:url value='/supprot/supportDetail.do?no=${vo.no}'/>">
								<c:if test="${fn:length(vo.title)>30}">
									${fn:substring(vo.title, 0,30)}...
								</c:if>
								<c:if test="${fn:length(vo.title)<=30}">
									${vo.title}
								</c:if>													
							</a>
						</td>
					<td>${vo.name}</td>
					<td><fmt:formatDate value="${vo.regdate }" 
						pattern="yyyy-MM-dd"/>
					</td>
					<td>${vo.readcount}</td>		
				</tr>
			  <!--반복처리 끝  -->
	  		</c:forEach>
	  	</c:if>
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
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
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/reBoard/list.do"/>'>
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
    </form>
</div>

<div class="divBtn">
    <a href='<c:url value=""/>' >글쓰기</a>
    <a href='<c:url value=""/>' >내 건의사항</a>
</div>

</body>
</html>