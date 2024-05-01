<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새 게시물 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    div{
        margin:20px;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="row container col-md-8" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">


    <div class="col-md-3"></div>
    <div class="col-md-6" style="border: 1px solid lightcoral; border-radius: 20px; padding:20px;">
        <h3>게시글 작성</h3>
        <hr/>

        <form action="/board/add" method="post">
            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
<%--                    <p class="text-primary">제목</p>--%>
                    <label for="inputTitle" class="form-label text-primary">제목</label>
                </div>
                <div class="col-md-6">
                    <input id="inputTitle" type="text" class="form-control"  name="title" required>
                </div>
            </div>

            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
                    <label for="inputContent" class="form-label text-primary">내용</label>
                </div>

                <div class="col-md-6">
                    <textarea id="inputContent" class="form-control" name="content" cols="30" rows="10" style="resize: none;" required></textarea>
                </div>
            </div>

            <div class="row" style="margin: 0 auto;">
                <div class="col-md-2">
                    <label for="inputWriter" class="text-primary">작성자</label>
                </div>

                <div class="col-md-6">
                    <input id="inputWriter" type="text" class="form-control" name="writer" required>
                </div>
            </div>

            <div class="row" style="margin: 0 auto;">
                <div class="col-md-12" style="text-align: center;">
                    <button class="btn btn-warning">저장</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-3"></div>
</div>
</body>
</html>
