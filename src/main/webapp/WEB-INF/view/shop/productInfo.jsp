<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
<style>
    #pills-tab {
        overflow: hidden;
    }

    .cont {
        display: none;
    }

    #tab1 {
        display: block;
    }

    #star a {
        text-decoration: none;
        color: gray;
    }

    #star a.on {
        color: red;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"/>

<div class="container mt-5">
    <div class="row col-md-10" style="margin: 0 auto;">

        <div class="row">
            <div class="col-md-6" style="display: flex; justify-content: center;">
                <div style="width:350px; height:350px;">
                    <img src="/upload/${mainImage}" style="width:100%; height:100%; text-align: center;">
                </div>

                <div style="display: block;">
                    <div style="width:100px; height:100px">
                        <c:forEach items="${subImageList}" var="subImg">
                            <img src="/upload/${subImg.path}" style="width:100%; height:100%;">
                        </c:forEach>
                    </div>
                    <div style="display:flex; width:100px; height:100px">
                    </div>
                </div>
            </div>

            <div class="col-md-6"
                 style="text-align: center; display: flex; align-items: center; justify-content: center; flex-direction: column;">
                <p style="font-size: 2rem" class="form-control-plaintext">${product.name}</p>

                <hr/>
                <div class="row col-md-12 mb-2" style="">
                    <div class="col-md-4">
                        <label for="InputQuantity" class="form-control-plaintext">재고</label>
                    </div>
                    <div class="col-md-8">
                        <p class="form-control-plaintext">${product.stock}</p>
                    </div>
                </div>

                <div class="row col-md-12 mb-2" style="">
                    <div class="col-md-4">
                        <label for="InputQuantity" class="form-control-plaintext">수량</label>
                    </div>
                    <div class="col-md-5" style="margin: 0 auto;">
                        <div style="display: flex;">
                            <div class="col-md-3">
                                <button class="btn btn-dark" id="minus">-</button>
                            </div>
                            <div class="col-md-6" style="margin: 0 auto; text-align: center;">
                                <p class="form-control-plaintext" id="InputQuantity">1</p>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-dark" id="plus">+</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row col-md-12" style="">
                    <hr/>
                    <div class="col-md-4">
                        <label for="InputPrice" class="form-control-plaintext">가격</label>
                    </div>
                    <div class="col-md-7">
                        <p class="form-control-plaintext" id="InputPrice">${product.price}</p>
                    </div>
                </div>
                <hr/>
                <div class="row mt-2" style="display: flex;">
                    <div class="col-md-12">
                        <button class="btn btn-primary">장바구니</button>
                        <button class="btn btn-success">구매</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row mt-5 col-md-10" style="text-align: center; margin: 0 auto;" id="product_tab">
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <div class="col-md-4">
                <li class="nav-item onShow" role="presentation">
                    <a href="#tab1" class="nav-link active tabBtn" data-bs-toggle="pill"
                       data-bs-target="#pills-home"
                       type="button"
                       role="tab" aria-controls="pills-home" aria-selected="true">상품상세
                    </a>
                </li>
            </div>

            <div class="col-md-4">
                <li class="nav-item" role="presentation">
                    <a href="#tab2" class="nav-link tabBtn" data-bs-toggle="pill" data-bs-target="#pills-profile"
                       type="button"
                       role="tab" aria-controls="pills-profile" aria-selected="false" id="productCount">
                        상품평(${reviewCount})
                    </a>
                </li>
            </div>
            <div class="col-md-4">
                <li class="nav-item" role="presentation">
                    <a href="#tab3" class="nav-link tabBtn" data-bs-toggle="pill" data-bs-target="#pills-profile"
                       type="button"
                       role="tab" aria-controls="pills-profile" aria-selected="false" id="countQnA">상품문의(${countQnA})
                    </a>
                </li>
            </div>
        </ul>
        <hr/>
        <div class="row cont" id="tab1">
            <textarea class="form-control-plaintext" id="editor">${product.content}</textarea>
        </div>

        <div class="cont container" id="tab2">
            <div class="row col-md-12" style="margin:0 auto;">
                <c:if test="${reviewCount == 0}">
                    <p style="color:red;">평점(0)</p>
                </c:if>

                <c:if test="${reviewCount != 0}">
                    <p id="reviewAvgScore" style="color:red;">평점</p>
                </c:if>
                <hr/>
                <div class="row">
                    <div class="row" id="reviewArea">
                        <c:if test="${reviewCount == 0}">
                            <p class="alert alert-danger" id="contentQnA">작성 리뷰는 없습니다</p>
                        </c:if>
                    </div>
                </div>
                <hr/>
                <div class="col-md-8" style="vertical-align: center;">
                        <textarea class="star_box form-control" placeholder="리뷰 내용을 작성해주세요."
                                  id="reviewContent" style="resize: none;"></textarea>
                </div>
                <div class="col-md-4">
                    <p class="form-control-plaintext" id="star"> <!-- 부모 -->
                        <a href="#" value="1">★</a> <!-- 자식들-->
                        <a href="#" value="2">★</a>
                        <a href="#" value="3">★</a>
                        <a href="#" value="4">★</a>
                        <a href="#" value="5">★</a>
                    </p>
                    <input type="submit" class="btn btn-primary" onclick="addReview()" value="리뷰 등록"/>
                </div>
            </div>
        </div>

        <div class="cont" id="tab3">
            <table class="table">
                <thead>
                <tr>
                    <th style="width:50%">제목</th>
                    <th style="width:20%">작성자</th>
                    <th style="width:20%">작성일</th>
                </tr>
                </thead>
                <tbody id="areaQnA">
                <c:if test="${countQnA == 0}">
                    <tr>
                        <td colspan="12" style="text-align: center;">
                            <p class="alert alert-danger" id="contentQnA">작성된 문의글이 없습니다</p>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <hr/>
            <div class="row col-md-12" style="margin: 0 auto;">
                <div class="col-md-9" style="vertical-align: center;">
                    <input type="text" class="form-control" placeholder="제목.." id="titleQnA">
                    <textarea class="star_box form-control" placeholder="문의내용 작성해주세요"
                              id="textQnA" style="resize: none;"></textarea>
                </div>
                <div class="col-md-3">
                    <div class="col-md-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <p style="text-align: left; margin:0;">비밀글</p>
                        </div>
                        <p style="text-align: left;">
                            <input type="submit" class="btn btn-primary" onclick="addQnA()" value="작성"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="contentDisplayArea">
</div>

<sec:authentication property="principal.member" var="writerQnA"/>
<!-- Modal -->
<%--
<div class="modal fade" id="contentModal" tabindex="-1" aria-labelledby="contentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contentModalLabel">상세내용</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 모달 내용이 여기에 들어갑니다. -->
            </div>
            <div class="modal-footer" id="modalAddQnA">

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.member" var="writerQnA"/>
                    <c:if test="${writerQnA.nickName == writerList}">


                    </c:if>
                </sec:authorize>
                <hr/>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
--%>

<script>


  listQnA();
  reviewList();
  reviewAvgScore();


  function reviewList() {

    $.get({
      url: "/shop/reviewList",
      data: {
        productId: ${product.id}
      },
      success: function (result) {
        let ratingText = "";

        $(result).each((key, value) => {

          if (value.rating == 1) {
            ratingText = "★";
          } else if (value.rating == 2) {
            ratingText = "★★";
          } else if (value.rating == 3) {
            ratingText = "★★★";
          } else if (value.rating == 4) {
            ratingText = "★★★★";
          } else if (value.rating == 5) {
            ratingText = "★★★★★";
          }
          let rawDate = new Date(value.regDate);
          let formattedDate = String(rawDate.getFullYear()).slice(-2) + '/' +
            String(rawDate.getMonth() + 1).padStart(2, '0') + '/' +
            String(rawDate.getDate()).padStart(2, '0');

          $("#reviewArea").append(
            '<div class="col-md-9">'
            + '<p class="alert alert-primary" id="reviewCon">' + value.content + '</p>'
            + '</div>'
            + '<div class="col-md-2">' + '<p class="form-control-plaintext" id="star">' + '<a href="#" value="' + value.rating + '" style="color: red;">' + ratingText + '</a>' + '</p>' + '<p>' + value.writer + "님" + '</p>' + '</div>'
            + '<div class="col-md-1" style="display: flex; justify-content: center; flex-direction: column;">' + '<p>' + formattedDate + '</p>'
          );
        })
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    })
  }

  let ratingVal = 0;

  $('#star a').click(function () {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    ratingVal = $(this).attr("value");
  });

  function reviewCount() {

    $.get({
      url: "/shop/reviewCount",
      data: {
        productId: ${product.id}
      },
      success: function (result) {
        $("#productCount").text("상품평" + "(" + result + ")");
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    });
  }

  function reviewAvgScore() {
    $.get({
      url: "/shop/reviewAvgScore",
      data: {
        productId: ${product.id}
      },
      success: function (result) {
        let star = "";

        if (result >= 1 && result < 2) {
          star = "★";
        } else if (result >= 2 && result < 3) {
          star = "★★";
        } else if (result >= 3 && result < 4) {
          star = "★★★";
        } else if (result >= 4 && result < 5) {
          star = "★★★★";
        } else if (result == 5) {
          star = "★★★★★";
        }
        $("#reviewAvgScore").text("평점 :" + star + "(" + result + ")");
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    });
  }

  function addReview() {
    $.post({
      url: "/shop/productReview",
      data: {
        rating: ratingVal,
        content: $("#reviewContent").val(),
        productId: ${product.id},
      },
      success: function () {
        $("#reviewArea").text('');
        $("#reviewContent").val('');
        reviewList();
        reviewCount();
        reviewAvgScore();
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    });
  }

  let writerName = "${writerQnA.nickName}";

  console.log("로그인 사용자 닉네임:" + writerName);

  function listQnA() {

    $.get({
      url: "/shop/listQnA",
      data: {
        productId: ${product.id}
      },
      success: function (result) {

        $(result).each((key, value) => {


          let rawDate = new Date(value.regDate);
          let formattedDate = String(rawDate.getFullYear()).slice(-2) + '/' +
            String(rawDate.getMonth() + 1).padStart(2, '0') + '/' +
            String(rawDate.getDate()).padStart(2, '0');

          $("#areaQnA").append(
            '<tr>' +
            '<td>' + '<p class="view-content" data-id="' + value.id + '" data-content="' + value.content + '" + data-writer = "' + value.writer + '">' + value.title + '</p>' + '</td>' +
            '<td>' + value.writer + '</td>' +
            '<td>' + formattedDate + '</td>' +
            +'</tr>'
          );
        });
      },
      error: function (error) {
        console.log("에러" + error);
      }
    });
  }

  $(document).on('click', '.view-content', function () {
    let id = $(this).data('id');
    let content = $(this).data('content');
    let writer = $(this).data('writer');

    console.log(id);

    let $contentRow;

    if ((writerName === writer) || (writerName === "admin")) {

      $contentRow = $(
        '<tr class="content-row">' +
        '<td colspan="3">' +
        '<p>' + '<span class="badge text-bg-secondary" style="text-indent: 10%;">' + "내용)" + '</span>' + content + '<span class="badge text-bg-light" id="answerQnA" data-id="' + id + '">' + "답변" + "</span>" + '</p>' +
        '</td>' +
        '</tr>'
      );
    } else {
      console.log('작성자가 다릅니다');
      $contentRow = $(
        '<tr class="content-row">' +
        '<td colspan="3">' +
        '<p>' + '<span class="badge text-bg-secondary" style="text-indent: 10%;">' + "내용)" + '</span>' + content + '</p>' +
        '</td>' +
        '</tr>'
      );

    }


    $(".content-row").remove();
    $(this).closest('tr').after($contentRow);
  });

  $(document).on('click', '#answerQnA', function () {

    let id = $(this).data('id');

    /*
    $.post({
      url : "/shop/addQnAComment"

    });
     */


  });


  function addQnA() {

    $.post({
      url: "/shop/addQnA",
      data: {
        title: $("#titleQnA").val(),
        content: $("#textQnA").val(),
        productId: ${product.id}
      },
      success: function () {
        $("#areaQnA").empty();
        $("#titleQnA").val('');
        $("#textQnA").val('');
        countQnA();
        listQnA();
      },
      error: function (err) {
        console.log("요청에러:" + err);
      }
    });
  }

  function countQnA() {

    $.get({
      url: "/shop/countQnA",
      data: {
        productId: ${product.id}
      },
      success: function (result) {
        $("#countQnA").text("상품평" + "(" + result + ")");
      },
      error: function (error) {
        console.log("요청에러 =" + error);
      }
    });
  }


  ClassicEditor
    .create(document.querySelector('#editor'), {
      language: 'ko',
      toolbar: [],
    })
    .then(editor => {
      editor.enableReadOnlyMode('my-feature-id');
    })
    .catch(error => {
      console.error(error);
    });

  $("#product_tab #pills-tab > div").on('click', function (e) {

    const index = $(this).index();
    console.log('index=' + index);

    if (index == 0) {
      $("#tab2").hide();
      $("#tab3").hide();
      $("#tab1").show();
    }
    if (index == 1) {
      $("#tab1").hide();
      $("#tab3").hide();
      $("#tab2").show();
    }
    if (index == 2) {
      $("#tab1").hide();
      $("#tab2").hide();
      $("#tab3").show();
    }
  });

  const priceVal = parseInt($("#InputPrice").text());

  $("#minus").on('click', function () {
    const quantityVal = $("#InputQuantity").text();
    if (quantityVal == 1) {
      alert("최소수량입니다");
      return;
    }

    const count = parseInt(quantityVal) - 1
    $("#InputQuantity").text(count);
    $("#InputPrice").html(parseInt($("#InputPrice").text()) - priceVal + "원");
  })
  $("#plus").on('click', function () {

    const quantityVal = $("#InputQuantity").text();
    const count = parseInt(quantityVal) + 1
    $("#InputQuantity").text(count);
    $("#InputPrice").html(count * priceVal + "원");
  });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
