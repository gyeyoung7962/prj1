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
    .panel-body {
        position: relative;
        display: inline-block;
    }

    .panel-body:hover .overlay {
        height: 100%;
        display: block;
        animation-delay: 3s;
    }

    #imgList {
        display: block;
        width: 100%;
        height: auto;
    }

    .overlay {
        position: absolute;
        display: none;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: rgba(81, 167, 136, 0.13);
        overflow: hidden;
        width: 100%;
        height: 0;
        transition: .5s ease;
        color: white;
        font-size: 20px;
        text-align: center;
        padding: 20px;
    }
</style>
<body>

<c:import url="/WEB-INF/view/layout/navbar.jsp"/>

<div class="container-fluid">
    <div class="row p-5 m-5">
        <c:forEach items="${list}" var="list">
            <div class="col-sm-12 col-md-6 col-lg-3 p-2">
                <div class="panel panel-primary" style="text-align: center;">

                    <a style="text-decoration: none;" href="/shop/productInfo?id=${list.id}">
                        <div class="panel-body">
                            <img src="/upload/${list.image}" class="img-responsive rounded img-thumbnail" id="imgList"
                                 style="width:100%; height: 100%; max-width: 300px; max-height: 400px; border-radius: 10%;"
                                 alt="Image">
                            <div class="overlay">${list.name}</div>
                        </div>

                        <div class="">${list.name}</div>
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
