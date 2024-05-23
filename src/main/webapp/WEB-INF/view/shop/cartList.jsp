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

<div class="container mt-5 col-lg-12">
    <h3>Cart</h3>
    <hr/>


    <table class="table">
        <thead>
        <tr>
            <th>상품명</th>
            <th>사진</th>
            <th>수량</th>
            <th>가격</th>
            <th>카트 담긴 날짜</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartList}" var="cartItem">
            <tr>
                <td>${cartItem.name}</td>
                <td>
                    <img src="/upload/${cartItem.path}" alt=""
                         style="width:100%; height:100%; max-width:200px; max-height:200px;">
                </td>
                <td>${cartItem.quantity}</td>
                <td>${cartItem.price}</td>
                <td>${cartItem.regDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
