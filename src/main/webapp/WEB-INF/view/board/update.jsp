<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>조회 결과</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>

<div class="row container col-md-8" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">


    <div class="col-md-2"></div>
    <div class="col-md-8" style="border-radius: 20px; padding:20px;">
        <h3>${board.id}번 게시글 수정</h3>
        <hr/>
        <form action="/board/update" method="post">
            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <label for="inputTitle" class="text-primary">제목</label>
                </div>
                <div class="col-md-10">
                    <input type="text" class="form-control" name="title" id="inputTitle" value="${board.title}">
                </div>
            </div>

            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <label for="inputContent" class="text-primary">본문</label>
                </div>

                <div class="col-md-10">
                        <textarea class="form-control" name="content" id="inputContent" cols="30" rows="10" style="resize: none;"
                        >${board.content}</textarea>
                </div>
            </div>

<%--            <div class="row mb-2" style="margin: 0 auto;">--%>
<%--                <div class="col-md-2">--%>
<%--                    <label for="inputWriter" class="text-primary">작성자</label>--%>
<%--                </div>--%>

<%--                <div class="col-md-10">--%>
<%--                    <input type="text" class="form-control" name="writer" id="inputWriter" value="${board.writer}">--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="row mb-2" style="margin: 0 auto;">
                <div class="col-md-2">
                    <p class="text-primary">작성일</p>
                </div>

                <div class="col-md-10">
                    <input type="datetime-local" class="form-control" name="regDate" value="${board.regDate}" readonly>
                </div>
            </div>
            <div style="text-align: right;">
                <input type="hidden" name="id" value="${board.id}">
                <button class="btn btn-primary">수정</button>
            </div>
        </form>
    </div>
    <div class="col-md-2"></div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
