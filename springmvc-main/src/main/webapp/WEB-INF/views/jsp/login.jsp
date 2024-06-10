<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String title=(String)request.getAttribute("title");
    String message=(String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Demo Spring Web - <%= title %></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Standard HTML link tags for CSS files -->
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
    <!--<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">
    -->
    <!-- Icon Font Stylesheet -->
    <!--<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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

        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a class="">
                                <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Demo Spring Web</h3>
                            </a>
                            <h3>Login</h3>
                        </div>
                        <form action="${pageContext.request.contextPath}/connexion.do" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="role" id="floatingInput" placeholder="name@example.com" value="admin">
                            <label for="floatingInput">User</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password" value="root">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Enter</button>
                        </form>
                        <p style="color: red;"><%= message %></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
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
