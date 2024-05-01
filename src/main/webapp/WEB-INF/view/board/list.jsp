<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>전체 게시물 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="row container col-md-8" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%);">


<h3>전체 게시물 조회</h3>
<hr/>

<table class="table table-dark">
    <thead class="table-primary">
    <tr>
        <th class="col-1">글번호</th>
        <th class="col-2">글내용</th>
        <th class="col-2">작성자</th>
        <th class="col-2">작성일</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <c:if test="${list == null}">
            <td colspan="4">조회가 불가능합니다</td>
        </c:if>

        <c:forEach items="${list}" var="list" varStatus="status">

            <td>${status.count}</td>
            <td>${list.content}</td>
            <td>${list.writer}</td>
            <td>${list.regDate}</td>
        </c:forEach>
    </tr>
    </tbody>
</table>

</div>

</body>
</html>
