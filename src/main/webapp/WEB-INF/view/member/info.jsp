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
<div class="container col-md-7" style="position: absolute; top:50%; left:50%; transform: translate(-50%, -50%);">


    <div class="col-md-2"></div>
    <div class="row col-md-8" style="margin: 0 auto;">
        <h3>회원 정보 조회</h3>
        <hr/>
        <div class="card">
            <div class="card-body">
                <div class="alert alert-success" role="alert" style="text-align: center;">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>번호</label>
                        </div>
                        <div class="col-md-6">
                            ${member.id}
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>이메일</label>
                        </div>
                        <div class="col-md-6">
                            ${member.email}
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>비밀번호</label>
                        </div>
                        <div class="col-md-6">
                            ${member.password}
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>닉네임</label>
                        </div>
                        <div class="col-md-6">
                            ${member.nickName}
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>등록일</label>
                        </div>
                        <div class="col-md-6">
                            ${member.regDate}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
