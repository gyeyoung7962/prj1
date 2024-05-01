<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    * {
        font-family: 'Dovemayo_gothic';
        @font-face {
            font-family: 'Dovemayo_gothic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
    }


</style>
<nav class="navbar navbar-expand-lg" style="background-color: rgba(40,121,176,0.8)">
    <div class="container">
        <a class="navbar-brand text-white fs-2" href="/">Project</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText" style="border: 1px solid black;">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="border: 1px solid black;">
                    <li class="nav-item">
                        <a class="nav-link active text-white fs-5" aria-current="page" href="/board/list">목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white fs-5" href="/board/add">글쓰기</a>
                    </li>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

