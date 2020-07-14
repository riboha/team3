<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>서울여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
  href="../../img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/gijgo.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/slicknav.css">

<link rel="stylesheet" href="../css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

<script type="text/javascript">
  $(function() {
    $('#btn_send').on('click', send);
    $('#btn_img_dlt').on('click', img_dlt);
  });

  
  function send() {
    var frm = $('#frm').serialize(); //At_Dates
    var dates_date = $('#dates_date').val();
    var params = frm + "&dates_date=" + dates_date;
    //alert(params);
    $.ajax({
      type : "post",
      url : "./book.do",
      cache : false,
      dataType : "json",
      async : false,
      data : params,
      success : function(rdata) {

        if (rdata.cnt >= 1) {
          alert("예약 성공");
          location.href = "./book.jsp";
        } else if (rdata.no_book == 1) {
          alert("예약 가능한 수량이 없습니다. 날짜와 수량을 다시 확인해 주세요.");
        }
      },
      error : function(request, status, error) { // callback 함수, 전형적인 에러함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
        console.log(msg);
      }
    });
  }

  function img_dlt() {
    var frm = $('#frm');
    var at_no = $('#at_no', frm).val();
    var param = "at_no=" + at_no;
    alert(at_no);
    $.ajax({
          type : "post",
          url : "../at_img/delete.do",
          cache : false,
          dataType : "json",
          async : false,
          data : param,
          success : function(rdata) {

            if (rdata.cnt >= 1) {
              alert("이미지 삭제 성공");
              location.href = "./read.do?at_grp_no=${at_VO.at_grp_no }&at_no=${at_VO.at_no }";
            } else {
              alert("이미지 삭제 실패");
            }
          },
          error : function(request, status, error) { // callback 함수, 전형적인 에러함수
            var msg = 'ERROR<br><br>';
            msg += '<strong>request.status</strong><br>' + request.status
                + '<hr>';
            msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
            console.log(msg);
          }
        });
  }
</script>




</head>

<body>

  <!-- header-start -->

  <jsp:include page="/menu/top.jsp" />
  <!-- 관리자만 노출 -->
  <ASIDE style='float: right;'>
    <button type="button"
      onclick="location.href='${root }/at/update.do?at_no=${at_VO.at_no }'">상품
      수정</button>
  </ASIDE>
  <!-- 관리자만 노출 -->






  <!--  본문 start -->
  <div class="destination_details_info">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-9">
          <div class="destination_info">

            <h3>${at_VO.at_name }</h3>

            <p>${at_VO.at_detail }|
              <fmt:formatNumber value="${at_VO.at_price }"
                pattern="#,###" />
              KRW
            </p>
            <p>
              <c:forEach var="dates_cnt" items="${list }">
         예약 가능 날짜:${dates_cnt.dates_date } | 예약 가능 수량: ${dates_cnt.cnt}<br>
              </c:forEach>
            </p>

            <!-- 예약입력받기 start -->

            <FORM name='frm' id='frm' method='POST' action='./book.do'>
              <!-- 넘겨야 할 값: At_dates, int book -->
              <%--       <input type='hidden' name='at_grp_no' id='at_grp_no'
                value='${at_VO.at_grp_no }'> --%>
              <input type='hidden' name='at_no' id='at_no'
                value='${at_VO.at_no }'>


              <div class="form-group">
                <label class="control-label col-md-3">날짜</label>
                <div>
                  <input type="text" id="dates_date" value=""
                    class="form-control" style="width: 50%;">

                </div>
              </div>


              <script
                src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
              <script
                src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
                              
                            </script>
              <script
                src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js">
                              
                            </script>
              <script type="text/javascript">
                              $('#dates_date').datepicker({
                                format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
                                language : "kr",
                              });
                            </script>



              <div class="form-group">
                <label class="control-label col-md-3">수량</label>
                <div>
                  <input type='number' name='book' id='book' value='2'
                    required="required" placeholder="" min="1"
                    max="1000" step="1" style='width: 30%;'
                    class="form-control" style="width:50%;">
                </div>
              </div>
              <button type="button" class="btn" id="btn_send">예약</button>

            </FORM>

          </div>
        </div>
      </div>


      <!-- 예약입력받기 end -->

      <div class="bordered_1px"></div>
      <p>${at_VO.at_content }</p>
      <p>${at_VO.at_map }</p>
      <div class="single_destination">
        <h4>Point</h4>
        <p>There are many variations of passages of Lorem Ipsum
          available, but the majority have suffered alteration in some
          form, by injected humour, or randomised words.</p>
      </div>

      <div class="bordered_1px"></div>

      <!-- 이미지 갤러리 -->

      <div class="section-top-border">
        <div>
          <h3>Image Gallery</h3>
          <!-- 관리지만 표시 -->
          <a href="${root }/at_img/modify.do?at_no=${at_VO.at_no }">이미지
            파일 추가 업로드</a>
          <div class="row gallery-item">

            <!--   <button type="button" class="btn" id="btn_img_dlt">이미지 파일 전체 삭제</button></div> -->
            <!-- 관리자만 표시 -->

            <c:forEach var="img" items="${list_img }">
              <div class="col-md-4 ">
                <a href="./storage/${img.at_img_fupname }"
                  class="img-pop-up">
                  <div class="single-gallery-image"
                    style="background: url(./storage/${img.at_img_fname});"></div>
                </a>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
      <!-- 이미지 갤러리 -->


    </div>



    <!--  본문 end -->




    <jsp:include page="/menu/bottom.jsp" />
</body>

</html>