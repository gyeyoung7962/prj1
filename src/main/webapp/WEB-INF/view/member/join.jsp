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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="container col-md-3" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">
    <h3>회원가입</h3>
    <hr/>
    <form action="/member/join" method="post">
        <div class="row mb-3">
            <div class="">
                <label for="inputEmail">이메일</label>
            </div>
            <input type="email" class="form-control" id="inputEmail" name="email" required>
        </div>

        <div class="row mb-3">
            <div class="">
                <label for="inputPassword">비밀번호</label>
            </div>
            <input type="password" class="form-control" id="inputPassword" name="password" required>
        </div>

        <div class="row mb-3">
            <div class="">
                <label for="inputPasswordChk">비밀번호 확인</label>
            </div>
            <input type="password" class="form-control" id="inputPasswordChk" required onkeyup="pw_chk()">

            <div>
                <p class="pw_msg"></p>
            </div>
        </div>

        <div class="row mb-3">
            <div class="">
                <label for="inputNickName">닉네임</label>
            </div>
            <input type="text" class="form-control" id="inputNickName" name="nick_name" required>
        </div>
        <div class="row mb-3" style="text-align:right;">
            <div class="col-md-12">
                <button class="btn btn-success">확인</button>
                <button class="btn btn-danger" type="reset">취소</button>
            </div>


        </div>

    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>


    function pw_chk() {

        let password = $("#inputPassword").val();
        let passwordChk = $("#inputPasswordChk").val();

        if (password == passwordChk) {
            $(".pw_msg").html("비밀번호가 일치합니다").addClass("text-primary").show();
            $(".pw_msg").removeClass("text-danger");
        } else if (password != passwordChk) {
            $(".pw_msg").html("비밀번호가 일치하지않습니다").addClass("text-danger").show();
            $(".pw_msg").removeClass("text-primary");
        }
    }

</script>
</body>
</html>