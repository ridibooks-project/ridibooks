<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반도서 - 리디북스</title>
<link href="../css/normal_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/swiper-bundle.min.css">
</head>
<body>
	<h2>메인 테스트 페이지</h2>
	<br>
	
	<!-- 이벤트 슬라이드 탭 -->
	<section class="event_slide_tab">
       	<div class="ev_sw_wrapper">
           	<div class="event_box swiper-container">
               	<div class="event_wrapper swiper-wrapper">
               	
               	<script>
               		/* $(document).ready(function(){
               			alert("hi");
               		}); */
               			
             
		    		/* $.ajax({
		    			url: "http://localhost/ridibooks.com/event/controller",
		    			type: "GET",
		    			success: function(){
		    				ArrayList<EventDTO> event = (ArrayList<EventDTO>) request.getAttribute("eventList");
		    				
		    				for(int i=0; i<event.size(); i++) {
		    				}
		    			},
		    			error: function(){
		    			}
		    		}); */
			    </script>
               	
               	
               		<!-- 이벤트 슬라이드 컨텐츠 -->
                   	<div class="event_slide event1 swiper-slide">
                       	<img src="https://active.ridibooks.com/ridibooks_top_banner/20211229101547_1640740547185.jpg" alt="">
                   	</div>
                   	<div class="event_slide event2 swiper-slide">
                       	<img src="https://active.ridibooks.com/ridibooks_top_banner/20211226145408_1640498048095.jpg" alt="">
                   	</div>
                    <div class="event_slide event3 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211124173939_1637743179827.jpg" alt="">
                    </div>
                    <div class="event_slide event4 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211215020525_1639501525772.jpg" alt="">
                    </div>
                    <div class="event_slide event5 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211201113233_1638325953584.jpg" alt="">
                    </div>
                    <div class="event_slide event6 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211217093606_1639701366901.jpg" alt="">
                    </div>
                    <div class="event_slide event7 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211227101820_1640567900464.jpg" alt="">
                    </div>
                    <div class="event_slide event8 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211224141014_1640322614798.jpg" alt="">
                    </div>
                    <div class="event_slide event9 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211216172659_1639643219461.jpg" alt="">
                    </div>
                    <div class="event_slide event10 swiper-slide">
                        <img src="https://active.ridibooks.com/ridibooks_top_banner/20211214105436_1639446876116.jpg" alt="">
                    </div>
                    
               	</div>
                <div class="ev_pn_wrapper">
                    <div class="ev_pn swiper-pagination"></div>
                </div>
                <div class="navi_btn_wrapper ev_b_wrapper prev_btn">
                    <span class="spbt sbp swiper-button-prev"></span>
                </div>
                <div class="navi_btn_wrapper ev_b_wrapper next_btn">
                    <span class="spbt sbn swiper-button-next"></span>
                </div>
           	</div>
       	</div>
   	</section>
	
	
	
	

    
    <script src="../js/swiper-bundle.min.js"></script>
    <script src="../js/swiper-bundle.js"></script>
    <script src="../js/fontawesome.js" crossorigin="anonymous"></script>
    <script src="../js/slide_tab.js"></script>
    <script src="../js/starPoint.js"></script>
    <script src="../js/rem_recent_search.js"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>

</body>
</html>