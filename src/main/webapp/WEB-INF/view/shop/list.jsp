<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<style>
</style>
<body>

<c:import url="/WEB-INF/view/layout/navbar.jsp"/>

<%--
<div style="display: flex; justify-content: center; height:100%;">
    <div class="container" style="position: absolute; top:50%; left:50%; transform: translate(-50%, -50%);">

        <div class="row" style="justify-content: center;">
            <c:forEach items="${list}" var="list">
                <div class="text-center justify-content-center"
                     style="display: flex; width: 264px;">
                    <div class="">
                        <img src="/upload/${list.image}" class="rounded img-thumbnail"
                             style="width: 200px; height:200px;"
                             alt="...">
                        <p><a href="/shop/productInfo?id=${list.id}">${list.name}</a></p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
--%>
<div class="container">
    <div class="row p-5">
        <c:forEach items="${list}" var="list">
            <div class="col-sm-12 col-md-6 col-lg-4 p-5">
                <div class="panel panel-primary" style="text-align: center;">

                    <a style="text-decoration: none;" href="/shop/productInfo?id=${list.id}">
                    <div class="panel-body">
                        <img src="/upload/${list.image}" class="img-responsive" style="width:100%; height: 100%; max-width: 400px; max-height: 600px; border-radius: 10%;"
                             alt="Image">
                    </div>
                    <div>${list.name}</div>
                    </a>
                    <div>${list.price}원</div>

                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
