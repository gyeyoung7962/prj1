<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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

<%--<div class="container" style="position: absolute; top:40%; left:50%; transform:translate(-50%, -50%);">--%>
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
                    <a href="#tab2" class="nav-link tabBtn" data-bs-toggle="pill" data-bs-target="#pills-profile"
                       type="button"
                       role="tab" aria-controls="pills-profile" aria-selected="false">상품문의
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
                <p id="reviewAvgScore" style="color:red;">평점</p>
                <hr/>
                <div class="row">
                    <div class="row" id="reviewArea">

                    </div>
                </div>
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

            상품 문의

        </div>


    </div>
</div>

<script>

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
            '<div class="col-md-8">'
            + '<p class="alert alert-primary" id="reviewCon">' + value.content + '</p>'
            + '</div>'
            + '<div class="col-md-3">' + '<p class="form-control-plaintext" id="star">' + '<a href="#" value="' + value.rating + '" style="color: red;">' + ratingText + '</a>' + '</p>' + '<p>' + value.writer + '</p>' + '</div>'
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
        }
        else if(result >= 4 && result < 5) {
          star = "★★★★";
        }
        else if(result == 5){
          star = "★★★★★";
        }

        $("#reviewAvgScore").text("평점 :" + star+"("+result+")");
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

        alert("리뷰등록");
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
    $("#InputPrice").html(parseInt($("#InputPrice").text()) - priceVal);
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
