<%
    String viewpage=(String)request.getAttribute("viewpage");
    String title=(String)request.getAttribute("title");
    String username=(String)request.getAttribute("username");
    if (username==null) {
        username="Connected";
    }
%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Demo-spring - <%= title %></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <spring:url value="/assets/lib/owlcarousel/assets/owl.carousel.min.css" var="owlCarouselCss" />
    <link href="${owlCarouselCss}" rel="stylesheet">

    <spring:url value="/assets/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" var="tempusDominusCss" />
    <link href="${tempusDominusCss}" rel="stylesheet">

    <spring:url value="/assets/css/bootstrap.min.css" var="bootstrapCss" />
    <link href="${bootstrapCss}" rel="stylesheet">

    <spring:url value="/assets/css/style.css" var="styleCss" />
    <link href="${styleCss}" rel="stylesheet">
    <!-- Favicon -->
    <!-- <link href="/assets/img/favicon.ico" rel="icon"> -->


    <!-- Google Web Fonts -->
    <!--
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">
-->
    <!-- Icon Font Stylesheet -->
    <!--
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
-->

</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="${pageContext.request.contextPath}/hello.do" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-cat me-2"></i>Demo-spring</h3>
                </a>
                <div class="navbar-nav w-100">
                    <a href="${pageContext.request.contextPath}/hello.do" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Home</a>
                    <a href="${pageContext.request.contextPath}/tocrudemp.do" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Emp</a>
                    <a href="${pageContext.request.contextPath}/tocruddept.do" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dept</a>
<!-- [navbarLinks] -->
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0" style="display: flex; justify-content: space-between;">
                <a href="${pageContext.request.contextPath}/hello.do" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-leaf"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <span class="d-none d-lg-inline-flex"><%= username %></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="${pageContext.request.contextPath}/login.do" class="dropdown-item">Log out</a>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->
            <jsp:include page="/WEB-INF/views/jsp/${viewpage}.jsp"/>

            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Demo-spring</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                            <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <spring:url value="/assets/js/jquery-3.7.1.min.js" var="jquery" />
    <spring:url value="/assets/js/bootstrap.bundle.min.js" var="bootstrapBundleJs" />
    <spring:url value="/assets/lib/chart/chart.min.js" var="chart"/>
    <spring:url value="/assets/lib/easing/easing.min.js" var="easing"/>
    <spring:url value="/assets/lib/waypoints/waypoints.min.js" var="waypoint"/>
    <spring:url value="/assets/lib/owlcarousel/owl.carousel.min.js" var="carouseljs"/>
    <spring:url value="/assets/lib/tempusdominus/js/moment.min.js" var="moment"/>
    <spring:url value="/assets/lib/tempusdominus/js/moment-timezone.min.js" var="timezone"/>
    <spring:url value="/assets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js" var="bootstrapjs"/>
    <spring:url value="/assets/js/main.js" var="mainjs"/>

    <script src="${jquery}"></script>
    <script src="${bootstrapBundleJs}"></script>
    <script src="${chart}"></script>
    <script src="${easing}"></script>
    <script src="${waypoint}"></script>
    <script src="${carouseljs}"></script>
    <script src="${moment}"></script>
    <script src="${timezone}"></script>
    <script src="${bootstrapjs}"></script>
    <!--<script src="https://kit.fontawesome.com/9a5477cba8.js" crossorigin="anonymous"></script>-->
    <!-- Template Javascript -->
    <script src="${mainjs}"></script>
</body>

</html>
