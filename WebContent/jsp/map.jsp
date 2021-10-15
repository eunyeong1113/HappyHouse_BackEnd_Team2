<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 <script type="text/javascript">
      var map, marker;
      $(document).ready(function () {
        // 초기 kakao map 설정 start
        var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
        // var lat = 37.5012743;
        // var lng = 127.039585;
        var locPosition = new kakao.maps.LatLng(37.5012743, 127.039585); // (멀티캠퍼스)
        var options = {
          //지도를 생성할 때 필요한 기본 옵션
          center: locPosition, //지도의 중심좌표.
          level: 3, //지도의 레벨(확대, 축소 정도)
        };

        map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
        if (navigator.geolocation) {
          // GeoLocation을 이용해서 접속 위치를 얻어옵니다
          navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude, // 위도
              lon = position.coords.longitude; // 경도

            locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            var message = '<div style="padding:5px;">현재위치인가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
          });
        } else {
          // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

          locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
          var message = "geolocation을 사용할수 없어요..";

          displayMarker(locPosition, message);
        }
        // 초기 kakao map 설정 end

        // 시군구
        var cafeArea = {
          서울: ["강남구", "종로구"],
          대전: ["대덕구", "동구"],
          부산: ["강서구", "금정구"],
        };

        // 동
        var dongArea = {
          강남구: ["개포3동"],
          종로구: ["사직동"],
          대덕구: ["회덕2동"],
          동구: ["개포3동"],
          강서구: ["대저1동"],
          금정구: ["구서1동"],
        };

        var officePosition = {
          역삼점: { lat: 37.500613, lng: 127.036431 },
          선릉점: { lat: 37.504268, lng: 127.048188 },
          학하점: { lat: 36.35536, lng: 127.298294 },
          봉명점: { lat: 36.358843, lng: 127.344192 },
          연수원점: { lat: 36.098594, lng: 128.38977 },
          구미사업장: { lat: 36.109553, lng: 128.415011 },
          하남산단점: { lat: 35.204279, lng: 126.807198 },
          광주역점: { lat: 35.165476, lng: 126.909216 },
          부산사업장점: { lat: 35.095765, lng: 128.856344 },
          녹산산단점: { lat: 35.093641, lng: 128.855679 },
        };

        var officeAddress = {
          역삼점: "서울특별시+강남구+역삼동+테헤란로+212",
          선릉점: "서울특별시 강남구 역삼동 테헤란로 334 LG 화재빌딩",
          학하점: "대전광역시 유성구 덕명동 124",
          봉명점: "대전광역시 유성구 봉명동 대학로 60 봉명가든 6층",
          연수원점: "경상북도 구미시 공단동 259",
          구미사업장: "경상북도 구미시 임수동 94",
          하남산단점: "107 하남산단6번로 광산구 광주광역시",
          광주역점: "광주광역시 북구 중흥동 611",
          부산사업장점: "부산광역시 강서구 송정동 녹산산업중로 삼성전기 부산사업장사",
          녹산산단점: "부산광역시 강서구 송정동 삼성전기부속의원",
        };

        $(".dropdown-item.area").click(function () {
          var selArea = $(this).text();
          $("#searchByBtn").text(selArea);
        });

        $(".dropdown-item.cafe_area").click(function () {
          var selArea2 = $(this).text();
          $("#areaBtn1").text(selArea2);

          var areas = cafeArea[selArea2];
          var a1 = [];
          $("#office_div").empty();
          $.each(areas, function (i, a) {
            $("#office_div").append('<label class="dropdown-item cafe_office">' + a + "</label>");
          });
        });

        //officePosition의 lat, lng를 이용한 marker
        $(document).on("click", ".dropdown-item.cafe_office", function () {
          var selOffice = $(this).text();
          $("#officeBtn").text(selOffice);
          var office = officePosition[selOffice];

          // 이동할 위도 경도 위치를 생성합니다
          var moveLatLon = new kakao.maps.LatLng(office.lat, office.lng);
          var message = `<div style="padding:5px;">${selOffice}</div>`;

          // 지도 중심을 부드럽게 이동시킵니다
          // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
          map.panTo(moveLatLon);

          displayMarker(moveLatLon, message);
        });

        // 동별 아파트별 검색
        $("#searchBtn").on("click", function () {
          var selectedSearch = $("#searchByBtn").text().trim();
          console.log(selectedSearch);
          if (selectedSearch == "동별검색") {
            location.href = "searchByD.html";
          } else if (selectedSearch == "아파트별검색") {
            location.href = "searchByApt.html";
          } else {
            alert("검색 방법을 선택하세요");
          }
        });
      });

      function displayMarker(locPosition, message) {
        if (marker) marker.setMap(null); // 기존 maker 제거

        var imageSrc = "../img/my_position.png", // 마커이미지의 주소입니다
          imageSize = new kakao.maps.Size(50, 70), // 마커이미지의 크기입니다
          imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

        // 마커를 생성합니다
        marker = new kakao.maps.Marker({
          map: map,
          position: locPosition,
          image: markerImage,
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
          iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
          content: iwContent,
          removable: iwRemoveable,
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
      }
    </script>
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
</head>
<body>

    <div class="container">
      <!-- Kakao Map start -->
      <!-- 지도 버튼 시작 -->
      <div class="text-center mb-2">
        <div class="dropdown">
          <div class="btn-group">
            <button
              type="button"
              id="searchByBtn"
              class="btn btn-warning dropdown-toggle dropdown-toggle-split"
              data-toggle="dropdown"
            >
              검색방법
            </button>
            <div class="dropdown-menu">
              <label class="dropdown-item area">동별검색</label>
              <label class="dropdown-item area">아파트별검색</label>
            </div>
          </div>
          <div class="btn-group">
            <button
              type="button"
              id="areaBtn1"
              class="btn btn-warning dropdown-toggle dropdown-toggle-split"
              data-toggle="dropdown"
            >
              도/광역시
            </button>
            <div id="do" class="dropdown-menu">
              <label class="dropdown-item cafe_area">서울</label>
              <label class="dropdown-item cafe_area">대전</label>
              <label class="dropdown-item cafe_area">부산</label>
            </div>
          </div>
          <div class="btn-group">
            <button
              type="button"
              id="officeBtn"
              class="btn btn-warning dropdown-toggle dropdown-toggle-split"
              data-toggle="dropdown"
            >
              시/구/군
            </button>
            <div id="office_div" class="dropdown-menu"></div>
          </div>
          <button type="button" id="searchBtn" class="btn">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
      <div id="map" style="width: 100%; height: 300px; margin: auto" class="mb-3"></div>
      <!-- Kakao Map end -->
</body>
</html>