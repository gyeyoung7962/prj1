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
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"/>

<div class="container" style="position: absolute; top:50%; left:50%; transform:translate(-50%, -50%);">
    <h3>${product.id} 상품 정보</h3>
    <hr/>
    <p>메인 이미지</p>
    <div class="row" style="margin: 0 auto;">
        <div class="col-md-5">
            <div style="width:350px; height:350px;">
                <img src="/upload/${mainImage}" style="width:100%; height:100%;">
            </div>
        </div>

        <div class="col-md-2"></div>

        <div class="col-md-5">
            <p style="font-size: 1.3rem">${product.name}</p>
        </div>
    </div>

    <p>서브 이미지</p>
    <div style="display:flex; width:100%; height:150px;">
        <c:forEach items="${subImageList}" var="subImg">
            <img src="/upload/${subImg.path}" style="width:100%; height:100%; max-width: 100px; max-height:100px;">
        </c:forEach>
    </div>


</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
