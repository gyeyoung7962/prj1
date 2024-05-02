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

<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="container col-md-5" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">

    <div class="row col-md-8" style="margin: 0 auto;">
        <h3>로그인</h3>
        <hr/>
        <form action="/member/login" method="post">
            <div class="row mb-3">
                <div class="col-md-3">
                    <label for="inputEmail">이메일</label>
                </div>
                <div class="col-md-9">
                    <input type="email" class="form-control" id="inputEmail" name="email">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <label for="inputPassword">비밀번호</label>
                </div>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="inputPassword" name="password">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-12" style="text-align: right;">
                    <button class="btn btn-success">확인</button>
                    <button class="btn btn-danger">취소</button>
                </div>
            </div>


        </form>
    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
