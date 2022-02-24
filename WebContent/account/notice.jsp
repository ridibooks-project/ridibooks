<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="noti.NoticeDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	String id = (String) session.getAttribute("id");

	ArrayList<NoticeDTO> mynoti = (ArrayList<NoticeDTO>) session.getAttribute("mynoti");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 - 리디북스</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	
	<%@ include file="../main/header.jsp" %>
	<h2>알림</h2>
	
	<%
		if(mynoti.size() == 0) {
	%>
		<div>
			<p>
				알림이 없습니다.
			</p>
		</div>
	<%
		} else {
			for(int i=0; i<mynoti.size(); i++) {
	%>
		<div>
			<a href="#" class="noti ${mynoti.get(i).getNoti_title() }" id="noti">
				<p>
					<span>
						[<%= mynoti.get(i).getNoti_title() %>]
					</span>
					<span>
						<%= mynoti.get(i).getNoti_text() %>
					</span>
				</p>
				<p>
					<%= mynoti.get(i).getDuration() %>시간 전
					<%= mynoti.get(i).getNoti_no() %>
				</p>
				<%
					if(mynoti.get(i).getNoti_status() == 0) {
				%>
					<span>읽지 않은 알람</span>
				<%
					} else {
				%>
					<span>읽은 알람</span>
				<%
					}
				%>
			</a>
			<hr>
		</div>
	<%	
			}
		}
	%>
	
	<!-- 신규알람, 읽은알람 db처리를 위해 -->
	<script>
    	let noti = document.querySelectorAll(".noti");
    	for (let i = 0; i < noti.length; i++){
    		noti[i].onclick = (e) => {
//     			e.preventDefault(); a 태그와 이거는 맞지 않음
    			
    			$.ajax({
    		        url: "http://localhost/ridibooks.com/notice/status/controller",
    		        type: "GET",
    		        dataType: "text",
    		        data: "page="+${mynoti.get(i).getNoti_no() }+"&status="+${mynoti.get(i).getNoti_status() },
    		        success: function(){
    		            location.href = "http://localhost/ridibooks.com/event/page"+${mynoti.get(i).getNoti_no() }+".jsp";
    		        },
    		        error: function(){
    		        	alert("다시 시도해 주세요.");
   		                location.href = "http://localhost/ridibooks.com/account/notice.jsp";
    		        }
    		    });
    			
    			return false;	// a태그에는 리턴을 e.prevent가 아니라 리턴을 해야 기본 동작을 막을 수 있음
    		}
        }
    </script>
  
    
    <!-- <script>
    	$("#noti").on("click",function(e) {
    		$.ajax({
    			url: "http://localhost/ridibooks.com/notice/status/controller",
    			type: "GET",
    			dataType: "text",
    			data: "page="+${mynoti.get(i).getNoti_no() }+"&status="+${mynoti.get(i).getNoti_status() },
    			success: function(){
    				location.href = "http://localhost/ridibooks.com/event/page"+${mynoti.get(i).getNoti_no() }+".jsp";
    			},
    			error: function(){
    				alert("다시 시도해 주세요.");
	                location.href = "http://localhost/ridibooks.com/account/notice.jsp";
    			}
    		});
    		return false;	// a태그에는 리턴을 e.prevent가 아니라 리턴을 해야 기본 동작을 막을 수 있음
    	});
    </script> -->


	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>