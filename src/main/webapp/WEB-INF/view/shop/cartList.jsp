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
    .table tbody tr > td {
        align-content: center;
    }
</style>
<body>
<c:import url="/WEB-INF/view/layout/navbar.jsp"/>

<div class="container mt-5 col-sm-12 col-md-12 col-lg-12">
    <h3>Cart</h3>
    <hr/>
    <table class="table" style="text-align: center; align-items: center;">
        <thead>
        <tr>
            <th>체크</th>
            <th>상품명</th>
            <th>사진</th>
            <th>수량</th>
            <th>가격</th>
            <th>카트 등록일</th>
        </tr>
        </thead>
        <tbody>

        <c:if test="${cartList == null || cartList.isEmpty()}">
            <tr>
                <td colspan="6">
                    <p class="alert alert-danger">장바구니 상품이 비어있습니다</p>
                </td>
            </tr>
        </c:if>


        <c:forEach items="${cartList}" var="item">
            <tr class="cartItem" data-price="${item.originalPrice}" data-quantity="${item.quantity}">
                <td>
                    <input class="form-check-input select-item p-2" type="checkbox" value="" id="ckBox" checked>
                </td>
                <td class="p-3"><p class="alert alert-dark" style="margin-bottom:0">${item.name}</p></td>
                <td>
                    <img src="/upload/${item.path}" alt=""
                         style="width:100%; height:100%; max-width:200px; max-height:200px;">
                </td>
                <td>
                    <div class="row col-md-12 mb-2" style="">
                        <div class="col-12" style="margin: 0 auto;">
                            <div style="display: flex;">
                                <div class="col-md-3">
                                    <button class="btn btn-dark minus p-2" id="minus">-</button>
                                </div>
                                <div class="col-md-6" style="margin: 0 auto; text-align: center;">
                                    <p class="form-control-plaintext quantity p-2" id="InputQuantity">${item.quantity}</p>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-dark plus p-2" id="plus">+</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td class="price" id="InputPrice">${item.price}원</td>
                <td>${item.regDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <hr/>
</div>
<div class="row col-lg-4 col-md-12 p-5"
     style="margin: 0 auto; text-align: center; align-items: center; font-size: x-large">
    <div class="col-lg-4 col-md-4 w-100">
        <p class="text-primary">총 금액</p>
    </div>
    <div class="col-lg-4 col-md-4 w-100">
        <p class="text-danger" id="totalPrice">원</p>
    </div>
    <div class="row col-md-4 col-lg-12 w-100">
        <div class="col-md-6">
            <button class="btn btn-danger w-100 p-3">구매</button>
        </div>
        <div class="col-md-6">
            <button class="btn btn-secondary w-100 p-3">취소</button>
        </div>
    </div>
</div>


<script>
  updateTotalPrice();

  function updateTotalPrice() {

    let totalPrice = 0;
    $(".select-item:checked").each(function () {

      const cartItem = $(this).closest('.cartItem'); //체크를 선택한 상품의 cartItem 태그
      const price = cartItem.data("price") // 오리지널 상품가격
      const quantity = parseInt(cartItem.find(".quantity").text());

      totalPrice += price * quantity;
    });
    $("#totalPrice").text(totalPrice + "원");
  }

  $(document).on('change', '.select-item', updateTotalPrice);

  $(document).on('click', '#plus', function () {

    const cartItem = $(this).closest('.cartItem');
    const quantityElem = cartItem.find('.quantity');
    let quantity = parseInt(quantityElem.text());

    const price = cartItem.data("price");

    console.log("오리지널 값:" + price);
    console.log("증가값:" + quantity);

    quantity += 1;

    if (quantity > 1) {
      cartItem.find("#minus").attr("disabled", false);
    }
    quantityElem.text(quantity);

    cartItem.find(".price").text(price * quantity + "원");

    updateTotalPrice();
  });

  $(document).on('click', '#minus', function () {

    const cartItem = $(this).closest(".cartItem");
    const price = cartItem.data("price");
    const quantityElem = cartItem.find(".quantity")
    let quantity = parseInt(quantityElem.text());

    const priceElem = cartItem.find("#InputPrice");

    quantity -= 1;

    if (quantity == 0) {

      quantity = 1;

      quantityElem.text(quantity);

      cartItem.find("#minus").attr("disabled", true);
      alert("최소수량입니다");
    } else if (quantity > 1) {
      cartItem.find("#minus").attr("disabled", false);
    }

    quantityElem.text(quantity);

    priceElem.text(quantity * price + "원");

    console.log(quantity);

    updateTotalPrice();

  });


</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
