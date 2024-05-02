<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>전체 게시물 조회</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>
<div class="row container col-md-6" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">


    <h3>전체 게시물 조회</h3>
    <hr/>

    <table class="table table-hover">
        <thead class="table-primary">
        <tr>
            <th class="col-1 text-align-center">글번호</th>
            <th class="col-3">제목</th>
            <th class="col-1">작성자</th>
            <th class="col-1">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="list" varStatus="status">
            <tr>
                <c:if test="${list == null}">
                    <td colspan="4">조회가 불가능합니다</td>
                </c:if>
                <td>${list.id}</td>
                <td>
                    <a href="/board/read?id=${list.id}" style="text-decoration: none;">${list.title}</a>
                </td>
                <td>${list.writer}</td>
                <td>
                    <fmt:parseDate value="${list.regDate}"
                                   pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                    <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="row">

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>

                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>


    <div class="row">

        <div class="col-md-2">
            <select class="form-select" aria-label="Default select example">
                <option selected>분류</option>
                <option value="3">전체검색</option>
                <option value="1">제목</option>
                <option value="2">작성자</option>
                <option value="3">내용</option>
            </select>
        </div>

        <div class="col-md-6">
            <input type="text" class="form-control col-md-6" aria-label="Text input with segmented dropdown button">
        </div>

        <div class="col-md-2">
            <button class="btn btn-primary" style="margin-right: 30px;">검색</button>
        </div>

        <div class="col-md-2" style="text-align: end;">
            <a href="/board/add" class="btn btn-success">글쓰기</a>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
