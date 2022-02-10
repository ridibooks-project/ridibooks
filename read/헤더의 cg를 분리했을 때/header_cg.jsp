<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String currentURI = request.getRequestURI();

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

</body>
