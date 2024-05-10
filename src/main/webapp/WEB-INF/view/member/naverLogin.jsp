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

<ul>
  <li>
    <!-- 아래와같이 아이디를 꼭 써준다. -->
    <a id="naverIdLogin_loginButton" href="javascript:void(0)">
      <span>네이버 로그인</span>
    </a>
  </li>
  <li onclick="naverLogout(); return false;">
    <a href="javascript:void(0)">
      <span>네이버 로그아웃</span>
    </a>
  </li>
</ul>

<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

  var naverLogin = new naver.LoginWithNaverId(
          {
            clientId: "yd4ANL0ly4EfshynmuOQ", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
            callbackUrl: "http://localhost:8080/naver-login", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
            isPopup: false,
            callbackHandle: true
          }
  );

  naverLogin.init();

  window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {
      if (status) {
        var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

        console.log(naverLogin.user);

        if( email == undefined || email == null) {
          alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
          naverLogin.reprompt();
          return;
        }
      } else {
        console.log("callback 처리에 실패하였습니다.");
      }
    });
  });


  var testPopUp;
  function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
  }
  function closePopUp(){
    testPopUp.close();
  }

  function naverLogout() {
    openPopUp();
    setTimeout(function() {
      closePopUp();
    }, 1000);


  }
</script>




<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
