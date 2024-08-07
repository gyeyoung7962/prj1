<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
      integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
    * {
        font-family: 'NanumSquareNeo-Variable';
    }

    @font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        /*font-weight: bolder;*/
        /*font-style: bolder;*/
    }


</style>
<nav class="navbar navbar-expand-lg"
     style="background-color: white; color: black; position: fixed; top:0; left:0; right: 0; width: 100%; z-index: 1000;">
    <div class="navbar" style="text-align: center; text-indent: 20%;">
        <a class="navbar-brand text-black fs-3" href="/" style="font-weight: bolder;">
            <span style="font-size: 2rem;">Zer0#</span>

        </a>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar navbar-nav me-auto mb-2 mb-lg-0"
            style=" width:100%; display:flex; justify-content: center;">
            <li class="nav-item">
                <a class="nav-link text-black fs-6" aria-current="page" href="/board/list">게시판</a>
            </li>

            <li class="nav-item">
                <a class="nav-link text-black fs-6" aria-current="page" href="/shop/list">쇼핑</a>
            </li>

            <li class="nav-item" style="text-align: center;">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 100%;">
            </li>
        </ul>
    </div>

    <div class="navbar">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <sec:authorize access="not isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link text-black fs-6" aria-current="page" href="/member/join">회원가입</a>
                </li>
            </sec:authorize>

            <sec:authorize access="not isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link text-black fs-6" href="/member/login">로그인</a>
                </li>
            </sec:authorize>

            <sec:authorize access="hasAuthority('admin')">
                <li class="nav-item">
                    <a class="nav-link text-black fs-6" href="/admin/index">관리자페이지</a>
                </li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.member" var="member"/>

                <li class="nav-item">
                    <a class="nav-link text-black fs-6"
                       href="/shop/cartList?id=${member.id}">장바구니
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-black fs-6"
                       href="/member/info?id=${member.id}">${member.nickName}님
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link text-black fs-6" href="/member/logout">로그아웃</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

