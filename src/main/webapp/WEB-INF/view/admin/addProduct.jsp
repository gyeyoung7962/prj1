<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"></c:import>


<div class="container col-md-6 mt-5">
    <%--    style="position:absolute; top:50%; left:50%; transform: translate(-50%,-50%);"--%>

    <h3 style="text-align: left;">상품 추가</h3>
    <hr/>

    <form action="/product/add" method="post" enctype="multipart/form-data">

        <div class="row mb-2">

            <label for="InputImage">이미지</label>
                <img id="previewImg"
                     style="border:1px solid black;max-width: 100%; max-height: 500px; width: 100%; height: 100%; object-fit: cover;">
                <input type="file" class="form-control" name="file" id="InputImage" value="">
        </div>

        <div class="row mb-2">
            <div class="col-md-3">
                <label class="form-label" for="InputName">상품명</label>
            </div>
            <div class="col-md-6">
                <input type="text" id="InputName" class="form-control" name="name"/>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-md-3">
                <label for="InputInfo">분류</label>
            </div>
            <div class="col-md-3 mb-2">
                <select id="selectCategoryId" class="form-control" name="categoryId" onchange="showSubCategory()">
                    <c:forEach items="${categoryList}" var="list">
                        <option value="${list.categoryId}">${list.categoryName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-3 mb-2">
                <select id="selectSubCategoryId" class="form-control" name="subCategoryId">
                    <c:forEach items="${subCategoryList}" var="sublist">
                        <option class="category${sublist.parentCategoryId}"
                                value="${sublist.subCategoryId}">${sublist.subCategoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-md-3">
                <label for="InputPrice">가격</label>
            </div>
            <div class="col-md-3">
                <input type="text" id="InputPrice" class="form-control" name="price"/>
            </div>
            <div class="col-md-2">
                <p>원</p>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-md-3">
                <label for="InputHasNumber">재고수량</label>
            </div>
            <div class="col-md-3">
                <input type="number" id="InputHasNumber" class="form-control" min="1" max="999" name="stock"/>
            </div>
        </div>


        <div class="row mb-2">
            <div class="col-md-3">
                <label for="InputInfo">상세정보</label>
            </div>
            <div class="col-md-9">
                <textarea class="form-control" cols="15" rows="15" id="InputInfo" name="content"
                          style="resize: none;"></textarea>
            </div>
        </div>


        <div class="row col-md-12 justify-content-center">
            <div class="col-md-6" style="text-align: center;">
                <button class="btn btn-primary">등록</button>
                <button type="reset" class="btn btn-danger">취소</button>
            </div>
        </div>
    </form>
</div>
<script>
    function showSubCategory() {
        const parentId = document.querySelector("#selectCategoryId").value; //선택한 카테고리 값
        const selected = document.querySelectorAll("#selectSubCategoryId > option.category" + parentId);// 중분류에있는 옵션값부모아이디 조회
        const selectedAll = document.querySelectorAll("#selectSubCategoryId > option");

        console.log("==parentId==" + parentId);
        console.log("==select===" + selected);
        console.log(selectedAll)

        for (let s of selectedAll) {
            s.classList.add("d-none")
        }
        for (let s of selected) {
            s.classList.remove("d-none");
        }
    }

    let previewImg = $("#previewImg");
    let inputImg = $("#InputImage");

    inputImg.on("change", function (e) {

        const file = e.target.files[0];

        const reader = new FileReader();

        reader.onload = function (e) {
            previewImg.attr("src", e.target.result);
        }
        reader.readAsDataURL(file);

    });


</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
