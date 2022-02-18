<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String currentURI = request.getRequestURI();
	System.out.println(currentURI);
	
// 	String[] array = currentURI.split("/");
// 	System.out.println(array[array.length-1]);
	
	// 로그인 상태 확인
	String confirm = "true";
	if(session.getAttribute("isLogin")==null || session.getAttribute("isLogin").equals(false)) {
		confirm = "false";
	}

	Map<String, String> activeMap = new HashMap<>();
	activeMap.put("main", "main");
	activeMap.put("romance", "romance");
	activeMap.put("fantasy", "fantasy");
	activeMap.put("cartoon", "cartoon");
	activeMap.put("bl", "bl");
	activeMap.put("romance_novel", "romance_novel");
	activeMap.put("fantasy_novel", "fantasy_novel");
	activeMap.put("cartoon_webtoon", "cartoon_webtoon");
	activeMap.put("bl_novel", "bl_novel");
	activeMap.put("bl_webtoon", "bl_webtoon");
	activeMap.put("bl_cartoon", "bl_cartoon");
	
	boolean isMain = activeMap.get("main").equals(currentURI);
	boolean isRomance = activeMap.get("romance").equals(currentURI);
	boolean isFantasy = activeMap.get("fantasy").equals(currentURI);
	boolean isCartoon = activeMap.get("cartoon").equals(currentURI);
	boolean isBl = activeMap.get("bl").equals(currentURI);
	
	String[] subMenuList = {
			"<li {here}> <div class=\"cg_menu cg_menu_text normal_cg\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=main\">일반</a> </div> </li>",
			"<li {here}> <div class=\"cg_menu cg_menu_text rom_cg\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=romance\">로맨스</a> </div> </li>",
			"<li {here}> <div class=\"cg_menu cg_menu_text fan_cg\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=fantasy\">판타지</a> </div> </li>",
			"<li {here}> <div class=\"cg_menu cg_menu_text car_cg\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=cartoon\">만화</a> </div> </li>",
			"<li {here}> <div class=\"cg_menu cg_menu_text bl_cg\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl\">BL</a> </div> </li>"
	};
	
	if(isMain) {
		subMenuList[0] = subMenuList[0].replace("{here}", "class=\"active\"");
		subMenuList[1] = subMenuList[1].replace("{here}", "");
		subMenuList[2] = subMenuList[2].replace("{here}", "");
		subMenuList[3] = subMenuList[3].replace("{here}", "");
		subMenuList[4] = subMenuList[4].replace("{here}", "");
	} else if(isRomance) {
		subMenuList[0] = subMenuList[0].replace("{here}", "");
		subMenuList[1] = subMenuList[1].replace("{here}", "class=\"active\"");
		subMenuList[2] = subMenuList[2].replace("{here}", "");
		subMenuList[3] = subMenuList[3].replace("{here}", "");
		subMenuList[4] = subMenuList[4].replace("{here}", "");
	} else if(isFantasy) {
		subMenuList[0] = subMenuList[0].replace("{here}", "");
		subMenuList[1] = subMenuList[1].replace("{here}", "");
		subMenuList[2] = subMenuList[2].replace("{here}", "class=\"active\"");
		subMenuList[3] = subMenuList[3].replace("{here}", "");
		subMenuList[4] = subMenuList[4].replace("{here}", "");
	} else if(isCartoon) {
		subMenuList[0] = subMenuList[0].replace("{here}", "");
		subMenuList[1] = subMenuList[1].replace("{here}", "");
		subMenuList[2] = subMenuList[2].replace("{here}", "");
		subMenuList[3] = subMenuList[3].replace("{here}", "class=\"active\"");
		subMenuList[4] = subMenuList[4].replace("{here}", "");
	} else if(isBl) {
		subMenuList[0] = subMenuList[0].replace("{here}", "");
		subMenuList[1] = subMenuList[1].replace("{here}", "");
		subMenuList[2] = subMenuList[2].replace("{here}", "");
		subMenuList[3] = subMenuList[3].replace("{here}", "");
		subMenuList[4] = subMenuList[4].replace("{here}", "class=\"active\"");
	}
%>

<body>
		<div class="hd_wrap">
            <header>
                <nav>
                    <div class="hd_nav_box">
                        <ul class="logo_box">
                            <li class="rb_logo">
                                <a aria-label="리디북스 홈으로 이동" href="http://localhost/ridibooks.com">
                                    <svg viewBox="0 0 316 49" class="rb_logo_text">
                                        <title>리디북스</title>
                                        <path
                                            d="M22.7 17.5c0 2.2-.4 3.8-1.3 4.8s-2.4 1.5-4.6 1.5h-4.1V11.2h4.1c2.2 0 3.7.5 4.6 1.5.8.9 1.3 2.5 1.3 4.8zm12.1 0c0-6.1-1.4-10.4-4.2-12.8C27.9 2.3 23.2 1 16.9 1H2.2C1.1 1 .7 1.4.7 2.5V46c0 1.1.4 1.5 1.5 1.5h9c1.1 0 1.5-.4 1.5-1.5V33.3H16l.1.3 6 12.4c.5 1 1.3 1.4 2.5 1.4h9.1c.8 0 .9-.3.9-.4.1-.3.1-.8-.2-1.3l-7.3-13.8-.3-.5.5-.2.3-.1c4.8-2.2 7.2-6.8 7.2-13.6zM53.9 46V2.5c0-1.1-.4-1.5-1.5-1.5h-9c-1.1 0-1.5.4-1.5 1.5V46c0 1.1.4 1.5 1.5 1.5h9c1.1 0 1.5-.4 1.5-1.5zm30.2-21.7c0 5-.6 8.2-1.7 10-1.2 1.9-3.3 2.8-6.2 2.8h-2.5V11.4H76c2.9 0 5 .9 6.2 2.8 1.3 1.8 1.9 5.1 1.9 10.1zm7.5 18c3.1-3.5 4.7-9.5 4.7-18s-1.6-14.6-4.7-18C88.5 2.8 83.4 1 76.5 1H63.2c-1.1 0-1.5.4-1.5 1.5V46c0 1.1.4 1.5 1.5 1.5h13.4c6.9 0 11.9-1.7 15-5.2zm23.9 3.7V2.5c0-1.1-.5-1.5-1.5-1.5h-9c-1.1 0-1.5.4-1.5 1.5V46c0 1.1.4 1.5 1.5 1.5h9c1 0 1.5-.4 1.5-1.5zm30.1-12.9c0 1.8-.4 3.1-1.2 3.9-.8.8-2.1 1.2-4.1 1.2h-5.4V28h5.3c1.8 0 3.2.4 4.1 1.2.8.8 1.3 2.1 1.3 3.9zm-1-18.3c0 1.6-.4 2.8-1.2 3.5-.8.8-2 1.1-3.7 1.1H135v-9.1h4.8c1.7 0 2.9.3 3.7 1.1.7.7 1.1 1.8 1.1 3.4zm5.8 8.2l-1.3-.4 1.2-.5.6-.3c3.5-1.6 5.3-4.7 5.3-9.2 0-4.4-1.3-7.4-3.7-9-2.6-1.7-6.8-2.6-12.4-2.6h-15.5c-1.1 0-1.5.4-1.5 1.5V46c0 1.1.4 1.5 1.5 1.5h16.6c11 0 16.3-4.4 16.3-13.6 0-2.9-.6-5.2-1.8-7-1.2-1.8-2.8-3-4.7-3.7l-.6-.2zm36.3 1.3c0 5.2-.4 8.7-1.3 10.6-.9 2-2.6 3.1-4.8 3.1-2.2 0-3.8-1.1-4.7-3.1-.8-1.9-1.2-5.4-1.2-10.6 0-5.2.4-8.7 1.2-10.6.9-2 2.5-3.1 4.7-3.1s3.9 1.1 4.8 3.1c.9 1.9 1.3 5.4 1.3 10.6zm11 11.6c.8-3.2 1.2-7.1 1.2-11.6 0-4.6-.4-8.5-1.2-11.6-.8-3.1-2-5.6-3.6-7.3-1.6-1.8-3.5-3.1-5.6-3.8-2.2-.8-4.8-1.2-7.8-1.2s-5.6.4-7.8 1.2c-2.1.8-4 2-5.6 3.8-1.6 1.8-2.8 4.2-3.6 7.3-.8 3.2-1.2 7.1-1.2 11.6 0 4.6.4 8.5 1.2 11.6.8 3.1 2 5.6 3.6 7.3 1.6 1.8 3.5 3.1 5.6 3.8 2.2.8 4.8 1.2 7.8 1.2s5.6-.4 7.8-1.2c2.1-.8 4-2.1 5.6-3.8 1.6-1.7 2.8-4.2 3.6-7.3zm30-11.6c0 5.2-.4 8.7-1.3 10.6-.9 2-2.6 3.1-4.8 3.1-2.2 0-3.9-1.1-4.7-3.1-.8-1.9-1.2-5.4-1.2-10.6 0-5.2.4-8.7 1.2-10.6.9-2 2.5-3.1 4.7-3.1s3.9 1.1 4.8 3.1c.8 1.9 1.3 5.4 1.3 10.6zm10.9 11.6c.8-3.2 1.2-7.1 1.2-11.6 0-4.6-.4-8.5-1.2-11.6-.8-3.1-2-5.6-3.6-7.3-1.6-1.8-3.5-3.1-5.6-3.8-2.2-.8-4.8-1.2-7.8-1.2s-5.6.4-7.8 1.2c-2.1.8-4 2-5.6 3.8-1.6 1.8-2.8 4.2-3.6 7.3-.8 3.2-1.2 7.1-1.2 11.6 0 4.6.4 8.5 1.2 11.6.8 3.1 2 5.6 3.6 7.3 1.6 1.8 3.5 3.1 5.6 3.8 2.2.8 4.8 1.2 7.8 1.2s5.6-.4 7.8-1.2c2.1-.8 4-2.1 5.6-3.8 1.6-1.7 2.8-4.2 3.6-7.3zm42.7 11.2c.1-.2.2-.6-.2-1.3l-11.7-23.6-.1-.3.1-.2 11-19c.4-.7.3-1 .2-1.3-.1-.1-.2-.4-.9-.4h-9.5c-1.1 0-1.9.5-2.5 1.7l-8.3 14.8-1 1.8V2.5c0-1.1-.4-1.5-1.5-1.5h-9c-1.1 0-1.5.4-1.5 1.5V46c0 1.1.4 1.5 1.5 1.5h9c1.1 0 1.5-.4 1.5-1.5V25l1 2.1 8.9 18.7c.5 1.1 1.3 1.6 2.4 1.6h9.6c.7.1.9-.1 1-.3zm34.4-12.4c0-2-.2-3.7-.7-5.2-.5-1.4-1.3-2.7-2.4-3.8-1.2-1.2-2.3-2.1-3.4-2.8-1.1-.7-2.7-1.7-4.8-2.8-4.3-2.2-6.3-4.2-6.3-6.3 0-1.6.8-2.4 1.5-2.8.8-.4 2.1-.6 3.8-.6 2.7 0 5.1.4 7.3 1.1.3.1.6.1.8.1.5 0 .9-.2 1.1-1.1l1.2-6.4c.1-.6.1-1.4-1.3-2C309.6.9 306 .3 301.7.3c-5.4 0-9.5 1-12.1 3.1-2.5 2-3.8 5.3-3.8 9.9 0 2.2.3 4.1.9 5.8.6 1.6 1.4 3 2.6 4.2 1.2 1.2 2.3 2.1 3.5 2.9 1.1.7 2.6 1.5 4.3 2.3 2.5 1.3 4.1 2.3 5 3 1 .8 1.5 1.8 1.5 2.9 0 2.5-2.3 3.7-6.9 3.7-2.8 0-5.5-.5-7.9-1.4-.4-.1-.7-.2-1-.2-.3 0-.7 0-1 1.1l-1.2 6.5c-.2.8 0 1.1 0 1.2.1.1.4.5 1.3.8 3.5 1.4 7.8 2.1 12.7 2.1 4.7 0 8.6-1.1 11.6-3.3 3-2.2 4.5-5.6 4.5-10.2z">
                                        </path>
                                    </svg>
                                </a>
                            </li>
                            <li class="rs_logo">
                                <a href="http://localhost/ridibooks.com" aria-label="리디셀렉트 홈으로 이동">
                                    <svg viewBox="0 0 299 48" class="rs_logo_text">
                                        <title>리디셀렉트</title>
                                        <path
                                            d="M27.85 31.178c4.947-2.365 7.456-7.115 7.456-14.123 0-6.312-1.45-10.774-4.309-13.263C28.103 1.276 23.318 0 16.775 0H1.555C.422 0 0 .421 0 1.556v44.889C0 47.579.422 48 1.555 48h9.257c1.135 0 1.557-.421 1.557-1.555V33.341h3.455l.15.313 6.176 12.848C22.66 47.521 23.472 48 24.702 48h9.399c.791 0 .913-.276.959-.38.148-.338.074-.792-.22-1.348l-7.5-14.212-.267-.508.517-.249zm-6.451-9.195c-.907 1.051-2.51 1.584-4.765 1.584H12.37V10.475h4.265c2.278 0 3.832.491 4.75 1.499.901.984 1.34 2.647 1.34 5.082 0 2.285-.434 3.897-1.326 4.927zM53.481 0h-9.329c-1.135 0-1.557.422-1.557 1.556v44.888c0 1.134.422 1.556 1.557 1.556h9.329c1.133 0 1.554-.422 1.554-1.556V1.556C55.035.422 54.614 0 53.481 0zm24.834 0H64.639c-1.133 0-1.555.422-1.555 1.556v44.888c0 1.134.422 1.556 1.555 1.556h13.818c7.109 0 12.327-1.807 15.513-5.37 3.213-3.59 4.841-9.858 4.841-18.629 0-8.772-1.64-15.04-4.873-18.628C90.727 1.807 85.472 0 78.315 0zm6.171 34.335c-1.233 1.93-3.38 2.908-6.379 2.908h-2.583V10.755h2.444c2.993 0 5.158.975 6.44 2.896C85.635 15.49 86.23 18.875 86.23 24c0 5.119-.572 8.5-1.744 10.335zM117.061 0h-9.33c-1.135 0-1.556.422-1.556 1.556v44.888c0 1.134.421 1.556 1.556 1.556h9.33c1.133 0 1.553-.422 1.553-1.556V1.556c0-1.134-.42-1.556-1.553-1.556zm27.708 47.805c-4.743 0-9.608-.855-12.108-2.127-.487-.238-1.313-.642-1.007-1.738l.965-2.922c.21-.97.784-1.116 1.109-1.116.22 0 .453.063.712.191 2.637 1.149 6.437 1.84 10.146 1.84 6.564 0 10.329-2.496 10.329-6.848 0-4.733-4.377-6.61-9.445-8.784l-.571-.245c-6.322-2.719-12.294-5.287-12.294-13.725 0-5.595 2.603-12.265 15.005-12.265 4.12 0 7.898.683 10.638 1.924.315.135 1.296.557.964 1.746l-.974 2.883c-.091.294-.312 1.008-1.112 1.008-.21 0-.447-.051-.723-.157-2.332-1.003-5.006-1.466-8.43-1.466-6.432 0-9.301 1.951-9.301 6.328 0 4.249 3.37 5.754 7.638 7.659.524.234 1.059.473 1.602.723l.471.215c6.479 2.962 12.599 5.76 12.599 14.286.001 8.001-5.909 12.59-16.213 12.59zm37.667.195c-10.27 0-16.65-6.967-16.65-18.182 0-11.466 5.637-18.311 15.079-18.311 8.853 0 14.354 6.244 14.354 16.296v3.251c0 1.092-.573 1.67-1.656 1.67H171.94c.662 5.8 4.857 9.534 10.74 9.534 3.395 0 5.43-.764 7.61-1.998.27-.158.543-.239.811-.239.352 0 1.003.147 1.409 1.131l.927 2.456c.177.851-.153 1.473-.966 1.913-1.684.925-5.226 2.479-10.035 2.479zm6.806-20.891c-.094-6.27-3.14-9.859-8.378-9.859-5.443 0-8.452 3.316-8.945 9.859zm14.236 20.111c-.7 0-1.535-.29-1.535-1.669V1.929c0-1.049.531-1.604 1.535-1.604h3.023c1.004 0 1.536.555 1.536 1.604v43.622c0 1.379-.836 1.669-1.536 1.669zm27.933.78c-10.27 0-16.65-6.967-16.65-18.182 0-11.466 5.637-18.311 15.079-18.311 8.853 0 14.354 6.244 14.354 16.296v3.251c0 1.092-.573 1.67-1.657 1.67h-21.622c.661 5.8 4.855 9.534 10.739 9.534 3.395 0 5.43-.764 7.61-1.998.27-.158.544-.239.812-.239.352 0 1.003.147 1.408 1.131l.927 2.456c.178.852-.152 1.475-.967 1.914-1.683.924-5.223 2.478-10.033 2.478zm6.806-20.891c-.094-6.27-3.14-9.859-8.378-9.859-5.442 0-8.452 3.316-8.946 9.859zm26.691 20.761c-9.859 0-15.985-6.992-15.985-18.248 0-11.175 5.963-18.116 15.562-18.116 5.18 0 8.176 1.561 8.97 2.04.516.308 1.176.841.957 1.901l-1.06 2.704c-.351.882-.987 1.013-1.335 1.013-.269 0-.557-.076-.859-.226-1.911-.989-3.781-1.429-6.069-1.429-6.472 0-9.892 4.188-9.892 12.113 0 7.822 3.495 12.309 9.589 12.309 2.491 0 4.806-.606 6.881-1.8.334-.154.586-.215.824-.215.293 0 .999.108 1.244 1.107l.963 2.652c.23 1.102-.416 1.517-.986 1.883-1.364.893-4.963 2.312-8.804 2.312zm27.347-.26c-6.892 0-9.577-3.111-9.577-11.095v-18.29h-3.663c-1.044 0-1.596-.555-1.596-1.603v-2.666c0-1.061.582-1.669 1.596-1.669h3.784V4.724c0-1.049.532-1.604 1.536-1.604h2.781c1.044 0 1.596.555 1.596 1.604v7.563h7.352c1.014 0 1.596.608 1.596 1.669v2.666c0 1.048-.552 1.603-1.596 1.603h-7.352v17.77c0 4.616.832 5.677 4.45 5.677.883 0 1.371-.131 1.842-.257a7.49 7.49 0 01.842-.19c.087-.02.205-.032.313-.032 1.023 0 1.228.996 1.307 1.371l.6 2.516c.237 1.145-.628 1.543-.954 1.692-1.08.543-3.31.838-4.857.838z">
                                        </path>
                                    </svg>
                                </a>
                            </li>
                        </ul>
                        
                        <ul class="h_btn_box">
                        
                   		<%
                   			if(confirm.equals("false") || confirm.isEmpty()) {
                   		%>
                   				<li>
	                                <a class="join_btn" href="http://localhost/ridibooks.com/account/signup.jsp">회원가입</a>
	                            </li>
	                            <li>
	                                <a class="login_btn" href="http://localhost/ridibooks.com/account/login.jsp">로그인</a>
	                            </li>
                        <%		
                        		} else {
                        %>
	       
                        		<li>
	                                <a class="join_btn" href="#">캐시충전</a>
	                            </li>
	                            <li>
	                                <a class="join_btn" href="#">내서재</a>
	        			<%		
                        		}
                        %>
                        
                        </ul>
                        
                        <!-- 검색 -->
                        <form class="h_ip_box" action="http://localhost/ridibooks.com/search/controller" method="get">
                            <div tabindex="-1" class="h_ip_wrap">
                                <div class="h_ip_box">
                                    <label class="h_ip_l">
                                        <input class="h_ip_search" name="q" type="search" maxlength="60"
                                            placeholder="제목, 저자, 출판사 검색" value="${param.q }" >
                                        <i class="fas fa-search"></i>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                </nav>
                
                <!-- 이것도 시간되면 sub_menu처럼 수정 / 반복문 밑줄css -->
                <ul class="hd_mm_wrap">
                    <li>
                        <div class="menu_navi homeTab">
                            <i class="fas fa-home"></i>
                            	<span class="ic_text">홈</span>
                        </div>
                    </li>
                    <li>
                        <div class="menu_navi noticeTab">
                            <i class="far fa-bell"></i>
                            	<span class="ic_text">알림</span>
                        </div>
                    </li>
                    <li>
                        <div class="menu_navi cartTab">
                            <i class="fas fa-shopping-cart"></i>
                            	<span class="ic_text">카트</span>
                        </div>
                    </li>
                    <li>
                        <div class="menu_navi mpTab">
                            <i class="far fa-user"></i>
                            	<span class="ic_text">마이리디</span>
                        </div>
                    </li>
                </ul>
            </header>
        </div>

        	<div class="sub_menu">
        <div class="hd_sub_menu">
            <ul class="hd_sm_wrap">
                <li>
                    <ul class="hd_sm_top">
                        <li>
                            <div class="cg_menu">
                                <a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="filter_icon">
                                        <path d="M2 7.001h20V5H2v2.001zm3 6h14v-2H5v2zm3.999 6h6v-2h-6v2z"></path>
                                    </svg>
                                </a>
                            </div>
                        </li>
                        <%
                        	for(String subMenuBtn: subMenuList) {
                        		out.print(subMenuBtn);
                        	}
                        
                        %>
                    </ul>
                </li>
                <li>
                    <hr class="hd_line_style">
                </li>
                <c:choose>
 				<c:when test="${param.active eq 'romance' }">
 					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
                               	boolean isRomance_novel = activeMap.get("romance_novel").equals(currentURI);
                               	
                               	String[] romance_type = {
                               			"<li class=\"sub_web {here2}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=romance_novel\">웹소설</a> </div> </li>",
                               			"<li class=\"sub_e {here2}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=romance\">e북</a> </div> </li>"
                               	};
                               	if(isRomance_novel) {
                               		romance_type[0] = romance_type[0].replace("{here2}", "");
                               		romance_type[1] = romance_type[1].replace("{here2}", "active");
                       			}else{
                       				romance_type[0] = romance_type[0].replace("{here2}", "active");
                       				romance_type[1] = romance_type[1].replace("{here2}", "");
                       			}
                               	
                               	for(String typeBtn: romance_type) {
                               		out.print(typeBtn);
                               	}
                            %>
                            </ul>
                        </div>
                    </li>
 				</c:when>
 				<c:when test="${param.active eq 'romance_novel' }">
 					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
                               	boolean isRomance_novel = activeMap.get("romance_novel").equals(currentURI);
                               	
                               	String[] romance_type = {
                               			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=romance_novel\">웹소설</a> </div> </li>",
                               			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=romance\">e북</a> </div> </li>"
                               	};
                               	if(isRomance_novel) {
                               		romance_type[0] = romance_type[0].replace("{here}", "");
                               		romance_type[1] = romance_type[1].replace("{here}", "active");
                       			}else{
                       				romance_type[0] = romance_type[0].replace("{here}", "active");
                       				romance_type[1] = romance_type[1].replace("{here}", "");
                       			}
                               	
                               	for(String typeBtn: romance_type) {
                               		out.print(typeBtn);
                               	}
                            %>
                            </ul>
                        </div>
                    </li>
 				</c:when>
				<c:when test="${param.active eq 'fantasy' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
   	                        	boolean isFantasy_novel = activeMap.get("fantasy_novel").equals(currentURI);
   	                        	
   	                        	String[] fantasy_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=fantasy_novel\">웹소설</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=fantasy\">e북</a> </div> </li>"
   	                        	};
   	                        	if(isFantasy_novel) {
   	                        		fantasy_type[0] = fantasy_type[0].replace("{here}", "");
   	                        		fantasy_type[1] = fantasy_type[1].replace("{here}", "active");
   	                			}else{
   	                				fantasy_type[0] = fantasy_type[0].replace("{here}", "active");
   	                				fantasy_type[1] = fantasy_type[1].replace("{here}", "");
   	                			}
   	                        	
   	                        	for(String typeBtn: fantasy_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'fantasy_novel' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
   	                        	boolean isFantasy_novel = activeMap.get("fantasy_novel").equals(currentURI);
   	                        	
   	                        	String[] fantasy_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=fantasy_novel\">웹소설</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=fantasy\">e북</a> </div> </li>"
   	                        	};
   	                        	if(isFantasy_novel) {
   	                        		fantasy_type[0] = fantasy_type[0].replace("{here}", "");
   	                        		fantasy_type[1] = fantasy_type[1].replace("{here}", "active");
   	                			}else{
   	                				fantasy_type[0] = fantasy_type[0].replace("{here}", "active");
   	                				fantasy_type[1] = fantasy_type[1].replace("{here}", "");
   	                			}
   	                        	
   	                        	for(String typeBtn: fantasy_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'cartoon' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                           	<%
   	                        	boolean isCartoon_webtoon = activeMap.get("cartoon_webtoon").equals(currentURI);
   	                        	
   	                        	String[] cartoon_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=cartoon_webtoon\">웹툰</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=cartoon\">e북</a> </div> </li>"
   	                        	};
   	                        	if(isCartoon_webtoon) {
   	                        		cartoon_type[0] = cartoon_type[0].replace("{here}", "");
   	                        		cartoon_type[1] = cartoon_type[1].replace("{here}", "active");
   	                			}else{
   	                				cartoon_type[0] = cartoon_type[0].replace("{here}", "active");
   	                				cartoon_type[1] = cartoon_type[1].replace("{here}", "");
   	                			}
   	                        	
   	                        	for(String typeBtn: cartoon_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'cartoon_webtoon' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                           	<%
   	                        	boolean isCartoon_webtoon = activeMap.get("cartoon_webtoon").equals(currentURI);
   	                        	
   	                        	String[] cartoon_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=cartoon_webtoon\">웹툰</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=cartoon\">e북</a> </div> </li>"
   	                        	};
   	                        	if(isCartoon_webtoon) {
   	                        		cartoon_type[0] = cartoon_type[0].replace("{here}", "");
   	                        		cartoon_type[1] = cartoon_type[1].replace("{here}", "active");
   	                			}else{
   	                				cartoon_type[0] = cartoon_type[0].replace("{here}", "active");
   	                				cartoon_type[1] = cartoon_type[1].replace("{here}", "");
   	                			}
   	                        	
   	                        	for(String typeBtn: cartoon_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'bl' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
	                            boolean isBl_novel = activeMap.get("bl_novel").equals(currentURI);
   	                        	boolean isBl_webtoon = activeMap.get("bl_webtoon").equals(currentURI);
                            	boolean isBl_cartoon = activeMap.get("bl_cartoon").equals(currentURI);
   	                        	
   	                        	String[] bl_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl\">웹소설</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_novel\">소설 e북</a> </div> </li>",
   	                        			"<li class=\"sub_webtoon {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_webtoon\">웹툰</a> </div> </li>",
   	                        			"<li class=\"sub_cartoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_cartoon\">만화 e북</a> </div> </li>"
   	                        	};
   	                        	if(isBl_novel) {
   	                        		bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "active");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_webtoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "active");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_cartoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "active");
   	                			}
   	                        	
   	                        	for(String typeBtn: bl_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'bl_novel' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
	                            boolean isBl_novel = activeMap.get("bl_novel").equals(currentURI);
   	                        	boolean isBl_webtoon = activeMap.get("bl_webtoon").equals(currentURI);
                            	boolean isBl_cartoon = activeMap.get("bl_cartoon").equals(currentURI);
   	                        	
   	                        	String[] bl_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl\">웹소설</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_novel\">소설 e북</a> </div> </li>",
   	                        			"<li class=\"sub_webtoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_webtoon\">웹툰</a> </div> </li>",
   	                        			"<li class=\"sub_cartoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_cartoon\">만화 e북</a> </div> </li>"
   	                        	};
   	                        	if(isBl_novel) {
   	                        		bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "active");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_webtoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "active");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_cartoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "active");
   	                			}
   	                        	
   	                        	for(String typeBtn: bl_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'bl_webtoon' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
	                            boolean isBl_novel = activeMap.get("bl_novel").equals(currentURI);
   	                        	boolean isBl_webtoon = activeMap.get("bl_webtoon").equals(currentURI);
                            	boolean isBl_cartoon = activeMap.get("bl_cartoon").equals(currentURI);
   	                        	
   	                        	String[] bl_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl\">웹소설</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_novel\">소설 e북</a> </div> </li>",
   	                        			"<li class=\"sub_webtoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_webtoon\">웹툰</a> </div> </li>",
   	                        			"<li class=\"sub_cartoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_cartoon\">만화 e북</a> </div> </li>"
   	                        	};
   	                        	if(isBl_novel) {
   	                        		bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "active");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                        	}else if(isBl_webtoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "active");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_cartoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "active");
   	                			}
   	                        	
   	                        	for(String typeBtn: bl_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
				<c:when test="${param.active eq 'bl_cartoon' }">
					<li class="sub_sb_menu">
                        <div>
                            <ul>
                            <%
	                            boolean isBl_novel = activeMap.get("bl_novel").equals(currentURI);
   	                        	boolean isBl_webtoon = activeMap.get("bl_webtoon").equals(currentURI);
                            	boolean isBl_cartoon = activeMap.get("bl_cartoon").equals(currentURI);
   	                        	
   	                        	String[] bl_type = {
   	                        			"<li class=\"sub_web {here}\"> <div class=\"right_border_line\"> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl\">웹소설</a> </div> </li>",
   	                        			"<li class=\"sub_e {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_novel\">소설 e북</a> </div> </li>",
   	                        			"<li class=\"sub_webtoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_webtoon\">웹툰</a> </div> </li>",
   	                        			"<li class=\"sub_cartoon {here}\"> <div> <a href=\"http://localhost/ridibooks.com/frontController.jsp?active=bl_cartoon\">만화 e북</a> </div> </li>"
   	                        	};
   	                        	if(isBl_novel) {
   	                        		bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "active");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_webtoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "active");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "");
   	                			}else if(isBl_cartoon) {
   	                				bl_type[0] = bl_type[0].replace("{here}", "");
   	                        		bl_type[1] = bl_type[1].replace("{here}", "");
   	                        		bl_type[2] = bl_type[2].replace("{here}", "");
   	                        		bl_type[3] = bl_type[3].replace("{here}", "active");
   	                			}
   	                        	
   	                        	for(String typeBtn: bl_type) {
   	                        		out.print(typeBtn);
   	                        	}
                            %>
                            </ul>
                        </div>
                    </li>
				</c:when>
 			</c:choose>
            </ul>
        </div>
    </div>
    
    <script>
    	let menu_navi = document.querySelectorAll('.menu_navi');
    	for (let i = 0; i < menu_navi.length; i++){
        	menu_navi[i].onclick = () => {
    			if(i == 0) window.location.href = "http://localhost/ridibooks.com";
    			
    			else location.href = "http://localhost/ridibooks.com/confirm/login/controller?page="+i;
    		}
        }
    </script>
    
</body>
