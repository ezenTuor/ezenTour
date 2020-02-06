<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/packageDetail.css"/>



<div id="pack-detail">
	<div>${packVo.name }</div>
	
	<div id="fir-line"></div>
	
	<div id="pack-semi-detail">
		<div>상품번호   |  00000ABC</div> 
		<div><span>고객리뷰   |  00/00</span><a href=#>여행후기</a></div>
	
	</div>
	
	<!-- 캐러셀 start -->
	<div class="carousel">
		<div class="carousel-inner">
			<input class="carousel-open" type="radio" id="carousel-1"
				name="carousel" aria-hidden="true" hidden="" checked="checked">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/0079D8/fff/?text=Without">
			</div>
			<input class="carousel-open" type="radio" id="carousel-2"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/DA5930/fff/?text=JavaScript">
			</div>
			<input class="carousel-open" type="radio" id="carousel-3"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item">
				<img src="http://fakeimg.pl/2000x800/F90/fff/?text=Carousel">
			</div>
			<label for="carousel-3" class="carousel-control prev control-1">‹</label>
			<label for="carousel-2" class="carousel-control next control-1">›</label>
			<label for="carousel-1" class="carousel-control prev control-2">‹</label>
			<label for="carousel-3" class="carousel-control next control-2">›</label>
			<label for="carousel-2" class="carousel-control prev control-3">‹</label>
			<label for="carousel-1" class="carousel-control next control-3">›</label>
			<ol class="carousel-indicators">
				<li><label for="carousel-1" class="carousel-bullet">•</label></li>
				<li><label for="carousel-2" class="carousel-bullet">•</label></li>
				<li><label for="carousel-3" class="carousel-bullet">•</label></li>
			</ol>
		</div>
	</div>
	<!-- 캐러셀 end -->
	
	<div id="travel-detail">
		<div id="travel-sche">
			<div class="content-1">
				<span>가나다라마바사</span>
			</div>
			<ul class="menu">
				<li><a href="#">여행일정</a></li>
				<li><a href="#">여행자 보험</a></li>
				<li><a href="#">참고사항</a></li>
			</ul>
			<div class="container">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Praesent luctus urna sit amet sollicitudin venenatis. Aenean odio
					tortor, varius vitae molestie eu, ultricies vel lacus. Nam viverra
					fermentum dapibus. Nulla at semper diam. Phasellus sit amet
					hendrerit sapien, non semper felis. Morbi augue leo, mattis nec leo
					sed, malesuada porta dui. Maecenas pretium eros quis lorem luctus
					gravida.</p>

				<p>Sed gravida quam odio, euismod accumsan mauris ornare quis.
					Duis sed condimentum justo. Phasellus ac dui eget velit bibendum
					viverra. Aenean porttitor commodo diam, quis interdum mi sagittis
					lobortis. Donec id ipsum dignissim, pharetra nunc sit amet,
					porttitor elit. Donec iaculis elit et enim interdum, ac laoreet
					lorem consequat. Sed eu elit ut quam pellentesque cursus. Integer
					sed condimentum est. Integer tempor placerat bibendum. Sed ut
					semper arcu, at porttitor nibh. Fusce vulputate pharetra tellus a
					laoreet. Cras imperdiet enim sed turpis adipiscing placerat.
					Vestibulum ut rhoncus mauris. In egestas ullamcorper dolor vitae
					suscipit. Curabitur non orci rutrum, iaculis ligula quis,
					sollicitudin neque. Aliquam dapibus dignissim tincidunt.</p>

				<p>Suspendisse at urna mauris. Vivamus eu lectus et quam viverra
					accumsan quis nec ligula. Aliquam sed mi sit amet arcu convallis
					bibendum id eu lorem. Sed pretium eget nibh egestas consectetur.
					Sed adipiscing, libero sed molestie laoreet, arcu tortor elementum
					ligula, nec commodo ipsum augue ut tellus. Morbi nibh mauris,
					facilisis vel bibendum vehicula, dignissim in tortor. Suspendisse
					augue urna, vestibulum at orci nec, scelerisque cursus mi. Proin
					congue eget justo et mattis.</p>

				<p>Suspendisse suscipit in lectus at aliquet. Integer non sem
					enim. Vestibulum aliquam imperdiet laoreet. In malesuada sodales
					augue, ut aliquam elit tempus id. Suspendisse sed hendrerit nibh.
					Curabitur molestie in libero nec vulputate. Cras ut scelerisque
					lacus, vitae cursus dui. Fusce ultricies lectus tincidunt, congue
					elit interdum, pellentesque nunc.</p>
				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>
				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>

				<p>Donec quis diam dapibus, accumsan ipsum vitae, porta turpis.
					Pellentesque vel ligula suscipit, scelerisque justo sit amet,
					vestibulum enim. Morbi eget sapien blandit, mattis enim sed,
					tincidunt eros. Nullam urna lectus, pretium id ultrices non,
					convallis vitae arcu. Fusce vel justo in nulla pulvinar interdum id
					sed sem. Ut quis ullamcorper dolor, a bibendum quam. Vivamus
					pellentesque, enim feugiat tempus venenatis, arcu quam molestie
					eros, quis bibendum nulla metus vitae nisi. Integer at lectus at
					metus eleifend molestie. Nulla sit amet pharetra est. Sed commodo
					ac leo ac volutpat. Vivamus enim sapien, sodales vel cursus sit
					amet, ornare at risus. Proin a lacus id felis aliquet fringilla.</p>
			</div>

		</div>
		
		

		<div id="travel-credit">
			<div><span>출발</span><span><fmt:formatDate pattern="yyyy-MM-dd" value="${packDetailVo.koreaDep }" /></span></div>
			<div><span>도착</span><span><fmt:formatDate pattern="yyyy-MM-dd" value="${packDetailVo.koreaEnt }" /></span></div>
			<div><span>항공</span><span>${packDetailVo.airline }</span></div>
			<a href="${pageContext.request.contextPath}/package/packSelectSchedule.do?packNo=${packDetailVo.packNo }">출발일 변경</a>
			<br>
			
			<hr>
			<div>가격</div>
			<div><span>성인</span><span>${packDetailVo.man }</span></div>
			<div><span>아동</span><span>${packDetailVo.child }</span></div>
			<div><span>유아</span><span>${packDetailVo.baby }</span></div>
			
			<div><span>남은좌석</span><span class="left">${packDetailVo.capecityCur }</span>석</div>
			
			
			<script type="text/javascript">
				$(document).ready(function () {
					$(".ck-btn").on("click", function() {
						var sit = $(".left").text();
						var adt = $(".adult option:selected").val();
						var chd = $(".child option:selected").val();
						var bab = $(".baby option:selected").val();
						var total = adt+chd+bab;
						
						if(total>sit){
							event.preventDefault();
							alert("예약 가능한 인원 수를 넘어섰습니다.");
						}
					})
				})
			
			</script>
			
			
			<form>
			성인
				<select class="adult">
					<c:forEach var="i" begin="0" end="${packDetailVo.capecityCur }" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				
				
			아동
				<select class="child">
					<c:forEach var="i" begin="0" end="${packDetailVo.capecityCur }" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				
			유아
				<select class="baby">
					<c:forEach var="i" begin="0" end="${packDetailVo.capecityCur }" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				
				<input type="button" value="결제" class="ck-btn">
			</form>
		</div>
	
	</div>
	
	

</div>
<%@include file="../inc/bottom.jsp"%>