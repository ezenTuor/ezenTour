;(function($,exports,undefined){
	"use strict";
	// console.log(!$.fn.FadeWideBgImg)
	if (!$.fn.FadeWideBgImg){
		// 기본 설정값 정의
 		var defaultSettings = {			
			minwidth : 1020, //이미지 쇼 최소 넓이
			height : 320, // 이미지 쇼 높이
			speed : 1000, // 전환 속도
			interval : 3000, // 전환 간격
			cover : true // 커버 노출 여부
		};
		// end - defaultSettings

		$.fn.FadeWideBgImg = function (options){
			var _this = this,
				setValue = $.type(options) == 'object' ? $.extend({},defaultSettings, options) : defaultSettings;
				// console.log(_this)

			//반복시킬 대상
			var $ShowTarget = $('li',_this),
				$ShowTargetImg = $('img',$ShowTarget),
				$ShowTotal = $ShowTarget.length, //총 갯수, 현재 3
				ShowCurrent = $ShowTotal -1,				
				$ShowParent = _this.parent("div");

				$ShowParent.css({
					'position' : 'relative'
				});
				$(_this).css({
					'position' : 'relative',
					'height' : setValue.height,
					'overflow' : 'hidden',
					'margin' : '0',
					'padding' : '0'
				});
				//이미지 쇼 (li) 영역 설정
				$($ShowTarget).css({
					'width' : '100%',
					'min-width'  : setValue.minwidth,			
					'position' : 'absolute',
					'left' : '0'
				});
				//각 li 안의 이미지에 대한 설정
				$ShowTargetImg.css({												
					'width' : '100%',
					'opacity' : '0'
				});

				if(setValue.cover == true){
					//박복 패턴 배경 div 생성
					$('<div class="fwb-patt"></div>').appendTo(_this.parent("div"));
					//패턴 배경 스타일 적용
					$('.fwb-patt').css({
						'position': 'absolute',
						'left': '0',
						'top': '0',
						'width': '100%',
						'height': setValue.height,
						'background': 'url(\'patt.png\') repeat'
					});		
				}
				//END if

				//로딩 div 생성				
				$('<div class="fwb-loading">Loading Images ... </div>').appendTo(_this.parent("div"));
				$('.fwb-loading').css({
					'position': 'absolute',
					'left': '0',
					'top': '0',
					'width': '100%',
					'height': setValue.height,
					'font-size' : '13px',
					'font-weight' : 'bold',
					'color' : '#d9d9d9',
					'text-align' : 'center',
					'line-height' : setValue.height+'px',
					'text-shadow' : '1px 1px #484848'
					// 'background': 'url(\'loadingimage.gif\') no-repeat center'
				});		
			
			
			function verticalCenter(){
				// console.log("로드완료 후 이미지 세로 중앙 정렬")
				$.each($ShowTargetImg, function() {
					$(this).parent("li").css({
						'margin-top' : (setValue.height-$(this).height())/2
					});			  				
					
				});
			};			
			//resize 창 조절에 따른 이미지 세로 중앙 정렬
			$(window).on('resize',function(){
				verticalCenter();
			});			

			//슬라이드쇼 기능
			function slideshowstart(){
					var SlideIntval;
					SlideIntval = setInterval(function(){
						// console.log("로드완료 후 인터벌")						
						if(ShowCurrent > 0){
							if(ShowCurrent == $ShowTotal - 1){
								$ShowTargetImg.stop().animate({'opacity' : '1'},0,'swing');
							}
							$ShowTargetImg.eq(ShowCurrent).stop().animate({'opacity' : '0'},setValue.speed,'swing');
							ShowCurrent = ShowCurrent - 1; 
						}else if(ShowCurrent == 0){
							$ShowTargetImg.eq($ShowTotal - 1).stop().animate({'opacity' : '1'},setValue.speed,'swing');
							ShowCurrent = $ShowTotal - 1; //순차적으로 하나씩 페이드 시킴
						};
						// console.log('결과 ShowCurrent : '+ShowCurrent)
						//END if									
					}, setValue.interval);
					// end - setinterval				
			}
			// end fn.slideshowstart	
			var loadedcount = 0;
			// $ShowTargetImg.load({noncache: new Date().getTime()}, onloadedimage);

			function onloadedimage(e){				
			    loadedcount++;
			    if (loadedcount == $ShowTarget.children().length)
			    {			
			    	$('.fwb-loading').fadeOut(200);
			    	verticalCenter();
					$ShowTargetImg.eq($ShowTotal - 1).stop().animate({'opacity' : '1'},setValue.speed,'swing',function(){				
						slideshowstart();
					});    
			    }
			}
			//end onloadedimage

			$(document).ready(function() {
			    var imageLoaded = function() {
			        onloadedimage();
			    }
			    $ShowTargetImg.each(function() {
			        var targetImg = new Image() ;
			        targetImg.onload = imageLoaded ;
			        targetImg.src = $(this).attr('src') ;
			    }) ;
			}) ;

			//
		}
		// end - fn
	}
	// end - if 
})(window.jQuery, window);