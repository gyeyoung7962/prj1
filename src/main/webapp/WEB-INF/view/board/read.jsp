<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>조회 결과</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
    form >button{
        margin:5px;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="row container col-md-8" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">


    <div class="col-md-2"></div>
    <div class="col-md-8" style="border-radius: 20px; padding:20px;">
        <h3>${board.id}번 게시글 확인</h3>
        <hr/>

        <form action="/board/add" method="post">
            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">제목</p>
                </div>
                <div class="col-md-10">
                    <input type="text" class="form-control" name="title" value="${board.title}" readonly>
                </div>
            </div>

            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">본문</p>
                </div>

                <div class="col-md-10">
                    <textarea class="form-control" name="content" cols="30" rows="10" style="resize: none;"
                              readonly>${board.content}</textarea>
                </div>
            </div>

            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">작성자</p>
                </div>

                <div class="col-md-10">
                    <input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
                </div>
            </div>

            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">작성일</p>
                </div>

                <div class="col-md-10">
                    <input type="datetime-local" class="form-control" name="writer" value="${board.regDate}" readonly>
                </div>
            </div>
        </form>
        <div class="d-flex" style="justify-content: right;">
            <form action="/board/update" method="get">
                <input type="hidden" name="id" value="${board.id}">
                <button class="btn btn-primary">수정</button>
            </form>

            <form action="/board/delete" method="post">
                <input type="hidden" name="id" value="${board.id}">
                <button class="btn btn-danger">삭제</button>
            </form>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
