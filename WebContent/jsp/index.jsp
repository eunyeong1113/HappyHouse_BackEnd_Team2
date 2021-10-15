<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>HappyHouse</title>
    <!-- 부트스트랩 사용하기 위함 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <!-- 아이콘 사용하기 위함 -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="shortcut icon" href="img/favicon.ico" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45c68664b414c9ffe8b8f1cd18dec311"
    ></script>
    <style>
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

      ul.nav {
        background-color: rgba(201, 201, 201, 0.5);
        padding: 10px;
        border-radius: 10px;
      }
      footer {
        font-family: "Nanum Gothic", sans-serif;
        text-align: center;
        background-color: rgba(125, 111, 111, 0.5);
      }
      .carousel-inner img {
        width: 100%;
        height: 100%;
      }
    </style>
    <script>
      $(function () {
        $("div#signinButtons button:first").click(function () {
          var myid = $("#id").val();
          var mypw = $("#pw").val();
          var myname = $("#name").val();
          var myphone = $("#phone").val();
          var myemail = $("#email").val();

          if (myid == null) {
            alert("아이디를 입력해 주세요!");
            return;
          }
          if (mypw == null) {
            alert("패스워드를 입력해 주세요!");
            return;
          }
          if (myname == null) {
            alert("이름을 입력해 주세요!");
            return;
          }
          if (myphone == null) {
            alert("전화번호를 입력해 주세요!");
            return;
          }
          if (myemail == null) {
            alert("이메일을 입력해 주세요!");
            return;
          }
          alert("회원가입이 완료되었습니다!");
        });

        $("#login").click(function () {
          var id = $("#ID").val();
          var pw = $("#PW").val();

          if (id == null) {
            alert("아이디를 입력해주세요!");
            return;
          }
          if (pw == null) {
            alert("비밀번호를 입력해주세요");
            return;
          }
          alert("로그인 완료!");

          $("#showInfo").show();
          $("#editInfo").show();
          $("#disjoin").show();
          $("#afterLogin").show();
          $("#logoutForm").show();
          $("#pinnedArea").show();

          $("#loginForm").hide();
          $("#signin").hide();
        });

        $("#logout").click(function () {
          alert("정상적으로 로그아웃 되었습니다.");

          $("#logoutForm").hide();
          $("#showInfo").hide();
          $("#editInfo").hide();
          $("#disjoin").hide();
          $("#pinnedArea").hide();

          $("#loginForm").show();
          $("#signin").show();
          
          $("#ID").val("");
          $("#PW").val("");
        });

        $("#showInfo").click(function () {
          open("showInfoPopup.html", "showInfo", "width=400px, height=500px, scrollbars=yes");
        });

        $("#editInfo").click(function () {
          open("editInfoPopup.html", "showInfo", "width=400px, height=500px, scrollbars=yes");
        });

        $("#disjoin").click(function () {
          if (confirm("탈퇴하시겠습니까?")) {
            alert("탈퇴 되셨습니다.");
            $("#showInfo").hide();
            $("#editInfo").hide();
            $("#disjoin").hide();
            $("#afterLogin").hide();
            $("#logoutForm").hide();
            $("#pinnedArea").hide();
            
            $("#loginForm").show();
            $("#signin").show();
            
            $("#ID").val("");
            $("#PW").val("");
            
          } else {
            alert("취소하셨습니다.");
          }
        });
      });
    </script>
  </head>
  <body>
    <!-- 1. header: navi bar -->
    <div>
      <header>
        <!-- nav bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin: 24px 0">
          <a class="navbar-brand" href="#">Happy House</a>

          <button
            class="navbar-toggler navbar-toggler-right"
            type="button"
            data-toggle="collapse"
            data-target="#navb"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navb">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
              <li class="nav-item"><a class="nav-link" href="#">오늘의 뉴스</a></li>
              <li class="nav-item"><a class="nav-link" href="#">주변 탐방</a></li>
            </ul>

            <form id="loginForm" class="form-inline my-2 my-lg-0">
              <input class="form-control mr-sm-2" type="text" id="ID" placeholder="Enter ID" />
              <input
                class="form-control mr-sm-2"
                type="password"
                id="PW"
                placeholder="Enter Password"
              />
              <button class="btn btn-success" type="button" id="login">Login</button>
            </form>

            <ul class="navbar-nav mr-auto" id="pinnedArea" style="display: none">
              <li class="nav-item"><a class="nav-link">관심지역 추가와 관심지역</a></li>
            </ul>
            <ul class="navbar-nav mr-auto" id="showInfo" style="display: none">
              <li class="nav-item"><a class="nav-link">회원 정보 조회</a></li>
            </ul>
            <ul class="navbar-nav mr-auto" id="editInfo" style="display: none">
              <li class="nav-item"><a class="nav-link">회원 정보 수정</a></li>
            </ul>
            <ul class="navbar-nav mr-auto" id="disjoin" style="display: none">
              <li class="nav-item"><a class="nav-link">회원 탈퇴</a></li>
            </ul>

            <button
              class="btn btn-primary"
              type="button"
              data-toggle="modal"
              data-target="#signinModal"
              id="signin"
            >
              Sign in
            </button>

            <!--  추가로 nav 만들기 회원 정보 조회, 수정, 탈퇴-->

            <form id="logoutForm" class="form-inline my-2 my-lg-0" style="display: none">
              <button class="btn btn-success my-2 my-sm-0" type="button" id="logout">Logout</button>
            </form>

            <!-- <form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search" placeholder="Search">
					<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
				</form>  -->
          </div>
        </nav>
      </header>
    </div>

    <!--  sign in modal -->
    <div class="modal" id="signinModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원가입</h4>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            아이디
            <input type="text" name="id" id="id" placeholder="영문으로 4자리 이상" /><br /><br />
            비밀번호
            <input
              type="password"
              name="pw"
              id="pw"
              placeholder="영문 숫자 포함 6자리 이상"
            /><br /><br />
            이름 <input type="text" name="name" id="id" placeholder="User Name" /><br /><br />
            전화번호
            <input type="tel" name="phone" id="phone" placeholder="Phone Number" /><br /><br />
            이메일 <input type="email" name="email" id="email" placeholder="E-mail" /><br /><br />
          </div>

          <!-- Modal footer -->
          <div class="modal-footer" id="signinButtons">
            <button type="button" class="btn btn-success" data-dismiss="modal">등록</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>

    <!-- body 전체를 div가 감싸고 있다. -->
    <!-- container는 양쪽에 공간을 조금 둔다 (fluid는 꽉 차게 한다) -->
    <!-- 2. body -->

    <!-- banner start -->
    <div
      class="banner dark-translucent-bg"
      style="background-image: url('../house.jpg'); background-position: 50% 55%"
    >
      <!-- breadcrumb end -->
      <div class="container">
        <div class="row justify-content-lg-center">
          <div class="col-lg-8 text-center pv-20">
            <h2
              class="title hc-element-invisible"
              data-animation-effect="fadeIn"
              data-effect-delay="100"
              style="text-align: center"
            >
              <strong>Happy House</strong>
            </h2>
            <div
              class="separator hc-element-invisible mt-10"
              data-animation-effect="fadeIn"
              data-effect-delay="100"
            ></div>
            <p
              class="text-center hc-element-invisible"
              data-animation-effect="fadeIn"
              data-effect-delay="100"
              style="text-align: center"
            >
              Welcome to our website!
            </p>
          </div>
        </div>
      </div>
      <br /><br /><br /><br /><br /><br /><br />
    </div>
    <!-- banner end -->
    
    <!-- map jsp 입력 -->
	<jsp:include page="map.jsp"/>
	
	<div class="container-fluid">
    <div class="row">
    <div class="col-lg-3" style="border:2px solid purple; background:lavender">
     <h3>CS 공부, 려니쌤과 함께라면 문제없어!</h3>
     <img src="../studying.jpg" width="150" height="150">
     <button>사이트 이동!</button>
    </div>
    
    <div class="col-lg-5">
    <h3>공지사항</h3>
    <hr>
    <ul>
	    <li> 서비스 이용 약관 변경</li><br>
	    <li> 추석 맞이 이벤트!</li><br>
	    <li> 고객 등급별 혜택 안내</li><br>
    	<li> 홈페이지가 새단장 했어요!</li><br>
    </ul>
    </div>
    
    <div class="col-lg-4" >
    <h3>오늘의 뉴스</h3>
    <hr>
    <h5>서울 아파트, 매매&전세 다른 양상보여.. (아시아경제)</h5>
    <ul>
    <li>서울 입주 2년차 아파트 전셋값 1억 4000만원 올라 (한겨레)</li>
    <li>재건축 대안 뜨는 수직증축 리모델링, 추진 속전속결 (동아일보)</li>
    <li>고가기준 9억, 서울 아파트 중간값 됐다 (아시아경제)</li>
    
    </ul>
    </div>

  </div>
  </div>	


	<div class="container mt-3">
	  <div class="row">
	  
	  	<div class="col-lg-2">
	  	<img src="../logo.jpg" width="150" height="100">
	  	</div>
	    <div class="col-lg-6">
	    <h4>Find us</h4>
	    <hr>
	    <ul>
	    <li>Address : 서울시 강남구 역삼동 멀티캠퍼스</li>
	    <li>Tel : 070 - 1234 - 5678</li>
	    <li>twoRyn@ssafy.com</li>
	    </ul>
	    </div>

	  </div>
	</div>

    <!-- 3. footer -->
    <div>
      <footer class="container mt-4">
        <p>Copyright by Ryn&Su. All right reserved.</p>
        <p></p>
      </footer>
    </div>
  </body>
</html>
</head>