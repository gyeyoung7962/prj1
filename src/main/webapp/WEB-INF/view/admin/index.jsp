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
    ul li{
        list-style: none;
    }
</style>
<body>

<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="container" style="position: absolute; top:50%; left:50%; transform:translate(-50%,-50%);">

    <div class="row mb-2">

        <div class="col-6">
            <ul>
                <h4>회원관리</h4>
                <hr/>
                <li>
                    <a href="/admin/memberList" class="btn">회원목록</a>
                </li>
            </ul>
        </div>

        <div class="col-6">
            <ul>
                <h4>상품관리</h4>
                <hr/>
                <li>
                    <a href="/admin/addProduct" class="btn">상품추가</a>
                    <a href="/admin/addProduct" class="btn">상품검색</a>
                    <a href="/admin/addProduct" class="btn">상품수정</a>
                    <a href="/admin/addProduct" class="btn">상품삭제</a>
                </li>
                <li>
                    <a href="/admin/categorySetting" class="btn">카테고리 설정</a>
                </li>
            </ul>
        </div>
    </div>


    <div class="row">

        <div class="col-6">
            <ul>
                <h4>주문관리</h4>
                <hr/>
                <li>
                    <a href="/admin/order" class="btn">고객 주문 목록</a>
                </li>
            </ul>
        </div>

        <div class="col-6">
            <ul>
                <h4>배송관리[주문리스트]</h4>
                <hr/>
                <li>
                    <a href="/admin/delivery" class="btn">배송 단계 설정</a>
                </li>
            </ul>
        </div>
    </div>


</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
