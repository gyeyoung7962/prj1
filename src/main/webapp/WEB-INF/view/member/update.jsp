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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>
<div class="container col-md-6" style="position: absolute; top:50%; left:50%; transform: translate(-50%, -50%);">


    <div class="row col-md-8" style="margin: 0 auto;">
        <h3>회원 정보 수정</h3>
        <hr/>
        <div class="card">
            <div class="card-body">
                <div class="alert alert-success" role="alert" style="margin: 0 auto;">
                    <form action="/member/update" method="post">
                        <input type="hidden" name="id" value="${member.id}">
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
                                <input type="email" class="form-control" name="email" value="${member.email}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>비밀번호</label>
                            </div>
                            <div class="col-md-6">
                                <input type="password" class="form-control" name="password" id="password"
                                       value="${member.password}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>비밀번호 확인</label>
                            </div>
                            <div class="col-md-6">
                                <input type="password" class="form-control" name="password" id="passwordChk"
                                       onkeyup="pw_chk()">
                            </div>
                        </div>

                        <div>
                            <p class="pw_msg" style="text-align: right;"></p>
                        </div>


                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>닉네임</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="nickName" value="${member.nickName}">
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
                        <div class="row mb-3">
                            <div class="col-md-12" style="text-align: center">
                                <button id="modifyBtn" class="btn btn-primary" disabled>수정</button>
                                <button type="reset" class="btn btn-danger">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function pw_chk() {

        let password = $("#password").val();
        let passwordChk = $("#passwordChk").val();

        if (password == passwordChk) {
            $(".pw_msg").html("비밀번호가 일치합니다").addClass("text-primary").show();
            $(".pw_msg").removeClass("text-danger");
            $("#modifyBtn").attr('disabled', false);

        }  if (password != passwordChk) {
            $(".pw_msg").html("비밀번호가 일치하지않습니다").addClass("text-danger").show();
            $(".pw_msg").removeClass("text-primary");
            $("#modifyBtn").attr('disabled', true);
        }
         if(password == null || passwordChk == null || password === "" || passwordChk === ""){
            $(".pw_msg").html("비밀번호를 입력하세요").addClass("text-danger").show();
        }
    }

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
