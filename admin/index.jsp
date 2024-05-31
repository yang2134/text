<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>电影票小程序</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<%=path %>/admin/css/morris.css">
        <link rel="stylesheet" href="<%=path %>/admin/css/style.css">
         
 </head>
 
  <body>


     <%   String adminLname=(String) session.getAttribute("adminLname");
		String role=(String) session.getAttribute("role");
         if(adminLname==null){ %>
            <script type="text/javascript" language="javascript">
		        alert("您还没有登录，请登录...");
	        	window.document.location.href="<%=path %>/login.jsp";	
	        </script>	
  <%     return;} %>   
     
        <div id="preloader">
            <div class="lds-hourglass"></div>
        </div>


        <div class="main-container-wrapper">
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo" href="<%=path %>/admin/index.jsp" style="font-size: 22px;color: white;">电影票小程序
                    </a>
                    <a class="navbar-brand brand-logo-mini" href="<%=path %>/admin/index.jsp" style="color: white;font-size: 16px;">电影票小程序</a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center justify-content-between">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                                <line x1="3" y1="12" x2="21" y2="12"></line>
                                <line x1="3" y1="6" x2="21" y2="6"></line>
                                <line x1="3" y1="18" x2="21" y2="18"></line>
                            </svg>
                        </span>
                    </button>
                    
                    <ul class="top-navbar-area navbar-nav navbar-nav-right">
                        
                        
                        
                        <li class="nav-item nav-profile dropdown dropdown-animate">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown"><img src="img/contact-3.jpg" alt="profile"></a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown profile-top" aria-labelledby="profileDropdown">
                                <div class="profile-header d-flex align-items-center">
                                    <div class="thumb-area"><img src="img/contact-3.jpg" alt=""></div>
                                    <div class="content-text">
                                        <h6><%= adminLname%></h6>
                                        <p class="mb-0"><%= role%></p>
                                    </div>
                                </div>
<!--                                <a href="<%=path%>/index.action" class="dropdown-item" target="_blank">-->
<!--                                    <i class="fa fa-home"></i>-->
<!--                                    网站首页</a>-->
                           
                                <a href="<%=path %>/admin/admin/pass.jsp" class="dropdown-item" target="main_iframe">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings profile-icon">
                                        <circle cx="12" cy="12" r="3"></circle>
                                        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                                    </svg>修改密码</a>
                                <a href="<%=path %>/admin/quit.jsp" onclick='return confirm("您确定要退出登录吗？");' class="dropdown-item">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out profile-icon">
                                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                        <polyline points="16 17 21 12 16 7"></polyline>
                                        <line x1="21" y1="12" x2="9" y2="12"></line>
                                    </svg>退出登录</a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-xl-none align-self-center" type="button" data-toggle="offcanvas">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid menu-bar-icon">
                                <rect x="3" y="3" width="7" height="7"></rect>
                                <rect x="14" y="3" width="7" height="7"></rect>
                                <rect x="14" y="14" width="7" height="7"></rect>
                                <rect x="3" y="14" width="7" height="7"></rect>
                            </svg>
                        </span>
                    </button>
                </div>
            </nav>
            <div class="container-fluid page-body-wrapper">
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="<%=path %>/admin/index.jsp">
                                <svg id="icon-home2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-box link-icon">
                                    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z" style="stroke-dasharray: 61, 81; stroke-dashoffset: 0;"></path>
                                    <path d="M3.27,6.96L12,12.01L20.73,6.96" style="stroke-dasharray: 21, 41; stroke-dashoffset: 0;"></path>
                                    <path d="M12,22.08L12,12" style="stroke-dasharray: 11, 31; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">系统首页</span>
                            </a>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app7" aria-expanded="false" aria-controls="app7">
                                <svg id="icon-home-7" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">基础数据管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app7">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/roomsToAdd.action" target="main_iframe">添加放映厅</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/roomsList.action" target="main_iframe">管理放映厅</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/seatsToAdd.action" target="main_iframe">添加座位</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/seatsList.action" target="main_iframe">管理座位</a>
                                    </li>

                                </ul>
                            </div>
                        </li>



                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app0" aria-expanded="false" aria-controls="app0">
                                <svg id="icon-home-0" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">用户管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app0">
                                <ul class="nav flex-column sub-menu">
                                    		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/membersList.action" target="main_iframe">管理用户</a>
                                    </li>

                                </ul>
                            </div>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app2" aria-expanded="false" aria-controls="app2">
                                <svg id="icon-home-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">资讯管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app2">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/newsToAdd.action" target="main_iframe">添加资讯</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/newsList.action" target="main_iframe">管理资讯</a>
                                    </li>

                                </ul>
                            </div>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app1" aria-expanded="false" aria-controls="app1">
                                <svg id="icon-home-1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">电影管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app1">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/mtypeToAdd.action" target="main_iframe">添加影片分类</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/mtypeList.action" target="main_iframe">管理影片分类</a>
                                    </li>
                                    		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/moviesToAdd.action" target="main_iframe">添加电影</a>
                                    </li>
		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/moviesList.action" target="main_iframe">管理电影</a>
                                    </li>

                                </ul>
                            </div>
                        </li>



<li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app3" aria-expanded="false" aria-controls="app3">
                                <svg id="icon-home-3" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">放映计划管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app3">
                                <ul class="nav flex-column sub-menu">
                                    		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/plansToAdd.action" target="main_iframe">添加放映计划</a>
                                    </li>
		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/plansList.action" target="main_iframe">管理放映计划</a>
                                    </li>

                                </ul>
                            </div>
                        </li>


<li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app4" aria-expanded="false" aria-controls="app4">
                                <svg id="icon-home-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">购票管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app4">
                                <ul class="nav flex-column sub-menu">
                                    		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/ordersList.action" target="main_iframe">管理购票</a>
                                    </li>

                                </ul>
                            </div>
                        </li>



<li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app6" aria-expanded="false" aria-controls="app6">
                                <svg id="icon-home-6" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">电影评论管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app6">
                                <ul class="nav flex-column sub-menu">
                                    		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/assessList.action" target="main_iframe">管理电影评论</a>
                                    </li>

                                </ul>
                            </div>
                        </li>






<li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#app9" aria-expanded="false" aria-controls="app9">
                                <svg id="icon-home-9" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit link-icon">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" style="stroke-dasharray: 52, 72; stroke-dashoffset: 0;"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" style="stroke-dasharray: 42, 62; stroke-dashoffset: 0;"></path>
                                </svg>
                                <span class="menu-title">系统管理</span>
                                <i class="ti-angle-right"></i>
                            </a>
                            <div class="collapse" id="app9">
                                <ul class="nav flex-column sub-menu">

                                    <%
                                    if(role.equals("超级管理员")){%>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/adminToAdd.action" target="main_iframe">添加管理员</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/adminList.action" target="main_iframe">管理管理员</a>
                                    </li>
                                    <%
                                    }
                                    %>

                                    		<li class="nav-item">
                                        <a class="nav-link" href="<%=path %>/admin/admin/pass.jsp" target="main_iframe">修改密码</a>
                                    </li>

                                </ul>
                            </div>
                        </li>


                    </ul>
                </nav>
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="container-fluid">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="dashboard-header-title mb-30">
                                        <h5>
                                            <span id="title">后台首页</span>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <iframe name="main_iframe" width="100%" style="overflow-x: hidden;overflow-y: auto;" class="main_iframe" id="default" src="right.jsp" frameborder="0" data-id="right.jsp"></iframe>
                  


                            </div>
                            
                            
                        </div>
                    </div>
                    <div class="footer-area footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-sm-flex align-items-center text-center">
                                        <div class="copywrite-text" style="width: 100%;text-align: center;">
                                            <p>    <script>
                                                document.write(new Date().getFullYear())
                                            </script>
                                            <a>电影票小程序</a>
                                            </p>
                                        </div>
                                 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="<%=path %>/admin/js/jquery.min.js"></script> 
        <script src="<%=path %>/admin/js/bootstrap.min.js"></script>
        <script src="<%=path %>/admin/js/bundle.js"></script>
        <script src="<%=path %>/admin/js/vivus.min.js"></script>
        <script src="<%=path %>/admin/js/svg.animation.js"></script>    
        <script src="<%=path %>/admin/js/settings.js"></script>    
        <script src="<%=path %>/admin/js/active.js"></script>
   
      
        <script>
            $(function () {
                
                //target="main_iframe"点击事件，点击后修改title的内容
                $("a[target='main_iframe']").click(function () {
                    console.log("点击事件");
                    var title = $(this).text();
                    console.log(title);
                    $("#title").text(title);
                });

                //iframe的高度自适应
                var iframe_height = $(window).height() - 206;
                $(".main_iframe").css("height", iframe_height + "px");
            });
        </script>
    

  </body>
</html>




