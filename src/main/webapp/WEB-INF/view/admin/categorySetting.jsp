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
<style>
    #pills-tab {
        overflow: hidden;
    }

    .cont {
        display: none;
    }

    .tabActive {
        display: block;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"/>

<div class="container col-md-6" style="position: absolute; top:50%; left:50%; transform:translate(-50%, -50%);">
    <h3>카테고리 설정</h3>
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
        <li class="nav-item onShow" role="presentation">
            <a href="#tab1" class="nav-link active tabBtn" data-bs-toggle="pill" data-bs-target="#pills-home"
               type="button"
               role="tab" aria-controls="pills-home" aria-selected="true">추가
            </a>
        </li>
        <li class="nav-item" role="presentation">
            <a href="#tab2" class="nav-link tabBtn" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button"
               role="tab" aria-controls="pills-profile" aria-selected="false">삭제
            </a>
        </li>
    </ul>

    <hr/>

    <div class="cont" id="tab1">
        <div class="row mb-5">
            <div class="col-md-2">
                <label for="InsertCategory">대분류</label>
            </div>

            <div class="col-md-4">
                <select class="form-select selectCategory" name="categoryName">
                </select>
            </div>
            <div class="col-md-4">
                <input type="text" id="InsertCategory" name="categoryName" class="form-control">
            </div>

            <div class="col-md-2">
                <button class="btn btn-primary" onclick="addCategory()">추가</button>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-md-2">
                <label for="InsertSubCategory">중분류</label>
            </div>

            <div class="col-md-4">
                <select class="form-select subCategoryList" name="subCategoryName">
                </select>
            </div>

            <div class="col-md-4">
                <input type="text" id="InsertSubCategory" name="subCategoryName" class="form-control">
            </div>

            <div class="col-md-2">
                <button class="btn btn-primary" onclick="addSubCategory()">추가</button>
            </div>
        </div>
    </div>

    <div class="cont" id="tab2">
        <div class="row mb-5">
            <div class="col-md-2">
                <label for="InsertCategory">대분류</label>
            </div>

            <div class="col-md-4">
                <select class="form-select selectCategory" name="categoryName">
                </select>
            </div>
            <div class="col-md-4">
                <button class="btn btn-danger" id="cate_delBtn">삭제</button>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-md-2">
                <label for="InsertSubCategory">중분류</label>
            </div>

            <div class="col-md-4">
                <select class="form-select subCategoryList" name="subCategoryName">

                </select>
            </div>

            <div class="col-md-4">
                <button class="btn btn-danger" id="subCate_delBtn">삭제</button>
            </div>
        </div>
    </div>
</div>

<script>
  $(() => {
    $("#tab1").show();
    categoryList();

    $("#subCate_delBtn").attr("disabled", true);

    $("#tab1 .selectCategory").on('change', function () {
      const tab1SelectedVal = $("#tab1 .selectCategory option:selected").val();
      if (tab1SelectedVal) {
        showSubList(tab1SelectedVal, "#tab1 .subCategoryList");
      }
    });

    $("#tab2 .selectCategory").on('change', function () {

      const tab2SelectedVal = $("#tab2 .selectCategory option:selected").val();

      if (tab2SelectedVal) {
        showSubList(tab2SelectedVal, "#tab2 .subCategoryList");
      }
    });
  })

  function categoryList() {
    $.get({
      url: "/admin/getCategory",
      success: function (result) {
        $(".selectCategory").append(
          '<option value="default">' + "선택" + '</option>'
        );
        $(result).each((key, value) => {
          $(".selectCategory").append(
            '<option value=' + value.categoryId + '>' + value.categoryName + '</option>'
          );
        })
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    });
  }

  function addCategory() {
    const categoryVal = $("#InsertCategory").val();
    $.post({
      url: "/admin/addCategory",
      data: {category: categoryVal},
      success: function () {
        alert("추가 완료");
        $("#InsertCategory").val('');
        $(".selectCategory").empty();
        categoryList();
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    });
  }

  function subList() {
    const subCateList = $(".subCategoryList");
    const categorySelected = $(".selectCategory option:selected").val();
    $.get({
      url: "/admin/getSubCategory",
      data: {categoryId: categorySelected},
      success: function (result) {
        $(".subCategoryList option").remove();
        $(result).each((key, value) => {
          subCateList.append(
            '<option value=' + value.subCategoryId + '>' + value.subCategoryName + '</option>'
          );
        })
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

  function showSubList(selectedVal, target) {
    const subCateList = $(target);
    $.get({
      url: "/admin/getSubCategory",
      data: {categoryId: selectedVal},
      success: function (result) {
        $(".subCategoryList").empty();
        $("#tab2 .subCategoryList").append(
          '<option value="0">' + "-선택-" + '</option>'
        );
        $("#tab2 .subCategoryList option:selected").on('change', function () {
          if ($("#tab2 .subCategoryList option:selected").val() == 0) {
            console.log("default");
            $("#subCate_delBtn").attr("disabled", true);
            alert("삭제 불가");
          }
        })
        if (result.length === 0) {
          subCateList.append(
            '<option>' + "항목이 존재하지않습니다" + '</option>'
          );
        } else if (result.length !== 0) {
          $(result).each((key, value) => {
            subCateList.append(
              '<option value=' + value.subCategoryId + '>' + value.subCategoryName + '</option>'
            );
          })
        }
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

  function addSubCategory() {
    const categorySelected = $(".selectCategory option:selected").val();
    $.post({
      url: "/admin/addSubCategory",
      data: {
        parentCategoryId: categorySelected,
        subCategoryName: $("#InsertSubCategory").val()
      },
      success: function () {
        alert("추가 완료");
        $("#InsertSubCategory").val('');
        subList();
      },
      error: function (error) {
        console.log(error + "오류 발생");
      }
    });
  }

  $("#pills-tab li").on('click', function (e) {
    const index = $(this).index();
    console.log('index=' + index);
    if (index === 0) {
      $("#tab2").hide();
      $("#tab1").show();
      $("#tab1 .selectCategory").val('default');
      $("#tab1 .subCategoryList").val('');
    }
    if (index === 1) {
      $("#tab1").hide();
      $("#tab2").show();
      $("#tab2 .selectCategory").val('default');
      $("#tab2 .subCategoryList").val('');
      $("#tab2 .subCategoryList").append(
        '<option value="default">' + "----" + '</option>'
      );
    }
  });

  $("#tab2 .selectCategory").on('change', function () {
    categoryVal = $("#tab2 .selectCategory option:selected").val();
    categoryDataList(categoryVal);
  });

  function categoryDataList(categoryVal) {
    console.log("categoryVal=" + categoryVal);

    $("#tab2 .subCategoryList").off('change').on('change', function () {
      const subCategoryVal = $(".subCategoryList option:selected").val();
      $(".subCategoryList option[value='" + 0 + "']").remove();
      $.get({
        url: "/admin/subCategoryDataCount",
        data: {
          subCategoryId: subCategoryVal
        },
        success: function (result) {
          if (result == 0) {
            alert("삭제가능");
            $("#subCate_delBtn").attr("disabled", false);
          } else if (result == 1) {
            alert("삭제 불가능");
            $("#subCate_delBtn").attr("disabled", true);
          }
        },
        error: function (error) {
          console.log(error + "에러 발생");
        }
      });
    })
  }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
