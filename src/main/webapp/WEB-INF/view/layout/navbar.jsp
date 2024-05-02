<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
    * {
        font-family:'NanumSquareNeo-Variable';
    }

    @font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }


</style>
<nav class="navbar navbar-expand-lg" style="background-color: rgba(40,121,176,0.8)">
    <div class="container">
        <a class="navbar-brand text-white fs-3" href="/" style="font-weight: bold;">Project</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white fs-6" aria-current="page" href="/board/list">게시판</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white fs-6" href="/member/list">회원목록</a>
                </li>

                    <li class="nav-item">
                        <a class="nav-link text-white fs-6" aria-current="page" href="/member/join">회원가입</a>
                    </li>

                    <c:if test="${nickName == null}">
                    <li class="nav-item">
                        <a class="nav-link text-white fs-6" href="/member/login">로그인</a>
                    </li>
                    </c:if>

                    <c:if test="${nickName != null}">
                        <li class="nav-item">
                            <a class="nav-link text-white fs-6" href="/member/info?id=${login.id}">${login.nickName}</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link text-white fs-6" href="/member/logout">로그아웃</a>
                        </li>
                    </c:if>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

