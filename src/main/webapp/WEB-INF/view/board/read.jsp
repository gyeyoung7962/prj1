<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>조회 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    div {
        margin: 20px;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="row container col-md-8" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">


    <div class="col-md-3"></div>
    <div class="col-md-6" style="border: 1px solid lightcoral; border-radius: 20px; padding:20px;">
        <h3>게시글 확인</h3>
        <hr/>

        <form action="/board/add" method="post">
            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">제목</p>
                </div>
                <div class="col-md-6 ">
                    <input type="text" class="form-control" name="title" value="${board.title}" readonly>
                </div>
            </div>

            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">본문</p>
                </div>

                <div class="col-md-6">
                    <textarea class="form-control" name="content" cols="30" rows="10" style="resize: none;"
                              readonly>${board.content}</textarea>
                </div>
            </div>

            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">작성자</p>
                </div>

                <div class="col-md-6">
                    <input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
                </div>
            </div>

            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">작성일</p>
                </div>

                <div class="col-md-6">
                    <input type="datetime-local" class="form-control" name="writer" value="${board.regDate}" readonly>
                </div>
            </div>
            <div>
                <button class="btn btn-primary">수정</button>
            </div>
            <div>
                <form action="/board/delete" method="post">
                    <input type="hidden" name="id" value="${list.id}">
                    <button class="btn btn-danger">삭제</button>
                </form>
            </div>
        </form>
    </div>
    <div class="col-md-3"></div>
</div>
</body>
</html>
