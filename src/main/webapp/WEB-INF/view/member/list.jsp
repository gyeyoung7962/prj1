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
<div class="container" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">
<h3>회원 목록</h3>
<hr/>
    <table class="table table-hover">
        <thead>
            <th class="col-1">번호</th>
            <th class="col-2">이메일</th>
            <th class="col-2">닉네임</th>
            <th class="col-2">비밀번호</th>
            <th class="col-2">가입일</th>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.id}</td>
            <td>${list.email}</td>
            <td>${list.nickName}</td>
            <td>${list.password}</td>
            <td>${list.regDate}</td>
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
