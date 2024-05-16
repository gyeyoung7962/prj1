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

    <script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>

</head>
<style>

    #imgLabel {
        all: unset;
        padding: 10px; /*padding를 주어 텍스트를 바탕으로 주변이 10px만큼 떨어지도록 설정*/
        text-align: center; /*버튼에서 텍스트가 가운데 있도록 설정*/
        background-color: royalblue; /*배경 색을 설정(원하는 걸로 바꿔도 됨)*/
        color: white; /*글자 색*/
        font-weight: 500; /*폰트 사이즈를 500으로 바꿈*/
        cursor: pointer;
        border-radius: 10px; /*버튼의 둥근 정도를 설정*/
        transition: opacity linear 0.1s;
    }

    .ck.ck-editor {

        max-width: 1000px;
    }

    .ck-editor__editable {
        min-height: 400px;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"/>


<div class="container col-md-6 mt-5">
    <%--    style="position:absolute; top:50%; left:50%; transform: translate(-50%,-50%);"--%>

    <h3 style="text-align: left;">상품 추가</h3>
    <hr/>
        <p class="alert alert-primary" role="alert">
            다중 이미시 선택시 첫번째 이미지가 메인 이미지로 만들어집니다
        </p>

    <form action="/product/add" method="post" enctype="multipart/form-data">
        <div class="row mb-2">
            <div class="col-md-4">
                <label id="imgLabel">상품 이미지 등록
                    <input type="file" name="files" class="form-control" multiple id="InputImage" style="display:none;">
                </label>
                <div style="width: 300px; height:300px; position: relative;">
                    <div id="previewContainer" style="display: flex;"></div>
                </div>
            </div>

            <div class="col-md-3"></div>
            <div class="row mt-5 mb-2">
                <div class="col-md-3">
                    <label class="form-label" for="InputName">상품명</label>
                </div>
                <div class="col-md-6">
                    <input type="text" id="InputName" class="form-control" name="name"/>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-3">
                    <label for="selectCategoryId">분류</label>
                </div>
                <div class="col-md-3 mb-2">
                    <select id="selectCategoryId" class="form-control" name="categoryId"
                            onchange="showSubCategory()">
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
                    <label>상세정보</label>
                </div>
                <div class="col-md-9">
                    <textarea name="content" id="editor"></textarea>
                </div>
            </div>
            <div class="row col-md-12 justify-content-center">
                <div class="col-md-6" style="text-align: center;">
                    <button class="btn btn-primary">등록</button>
                    <button type="reset" class="btn btn-danger">취소</button>
                </div>
            </div>

        </div>
    </form>
</div>
<script>

  ClassicEditor
    .create(document.querySelector('#editor'), {
      language: 'ko'
    })
    .catch(error => {
      console.error(error);
    });

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

  document.getElementById('InputImage').addEventListener('change', function (event) {
    // 파일 선택 여부 확인
    if (event.target.files.length > 0) {
      // 미리보기 컨테이너 선택
      var previewContainer = document.getElementById('previewContainer');

      // 선택된 파일들에 대해 미리보기 생성
      for (var i = 0; i < event.target.files.length; i++) {
        var file = event.target.files[i];
        var reader = new FileReader();

        console.log(file);

        // 파일 읽기 완료 이벤트 리스너 추가
        reader.onload = function (e) {
          // 이미지 태그 생성하여 미리보기 추가
          var imgElement = document.createElement('img');
          imgElement.src = e.target.result;
          imgElement.style.width = '200px'; // 미리보기 이미지 크기 설정
          imgElement.style.height = 'auto';
          previewContainer.appendChild(imgElement);
        };

        // 파일 읽기 시작
        reader.readAsDataURL(file);
      }
    }
  });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
