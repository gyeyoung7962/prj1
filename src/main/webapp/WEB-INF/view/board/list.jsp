<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>전체 게시물 조회</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>
<div class="row container col-md-8"
     style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">
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

        <c:if test="${list == null}">
            <tr>
                <td colspan="4">조회가 불가능합니다</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="list" varStatus="status">
            <c:set var="num" value="${pageInfo.totalCount}"/>
            <tr>
                <td>${list.id}</td>
                <td>
                    <a href="/board/read?id=${list.id}"
                       style="text-decoration: none;">${list.title}</a>
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
                <c:if test="${pageInfo.currentPage > 1}">
                    <c:url var="firstPageLink" value="/board/list">
                        <c:param name="page" value="1"/>
                    </c:url>
                    <li class="page-item">
                        <a class="page-link" href="${firstPageLink}">&laquo;</a>
                    </li>
                </c:if>

                <c:if test="${pageInfo.prevPageNumber > 0}">
                    <c:url value="/board/list" var="prevPageLink">
                        <c:param name="page" value="${pageInfo.prevPageNumber}"/>
                    </c:url>

                    <li class="page-item">
                        <a class="page-link" href="${prevPageLink}">&lt;</a>
                    </li>
                </c:if>


                <c:forEach begin="${pageInfo.currentStartPage}" end="${pageInfo.currentEndPage}" var="page">
                    <c:url var="pageLink" value="/board/list">
                        <c:param name="page" value="${page}"/>
                    </c:url>
                    <li class="page-item ${pageInfo.currentPage eq page ? 'active' : ''}">
                        <a class="page-link" href="${pageLink}">${page}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageInfo.nextPageNumber < pageInfo.lastPageNumber}">
                    <c:url value="/board/list" var="nextPageLink">
                        <c:param name="page" value="${pageInfo.nextPageNumber}"/>
                    </c:url>
                    <li class="page-item">
                        <a class="page-link" href="${nextPageLink}">&gt;</a>
                    </li>
                </c:if>


                <c:if test="${pageInfo.currentPage < pageInfo.lastPageNumber}">
                    <c:url var="lastPageLink" value="/board/list">
                        <c:param name="page" value="${pageInfo.lastPageNumber}"/>
                    </c:url>
                    <li class="page-item">
                        <a class="page-link" href="${lastPageLink}">>></a>
                    </li>
                </c:if>
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
            <input type="text" class="form-control col-md-6"
                   aria-label="Text input with segmented dropdown button">
        </div>

        <div class="col-md-2">
            <button class="btn btn-primary" style="margin-right: 30px;">검색</button>
        </div>

        <div class="col-md-2" style="text-align: end;">
            <a href="/board/add" class="btn btn-success">글쓰기</a>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>

