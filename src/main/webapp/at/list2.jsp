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
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="${root }/css/bootstrap.min.css">
<link rel="stylesheet" href="${root }/css/owl.carousel.min.css">
<link rel="stylesheet" href="${root }/css/magnific-popup.css">
<link rel="stylesheet" href="${root }/css/font-awesome.min.css">
<link rel="stylesheet" href="${root }/css/themify-icons.css">
<link rel="stylesheet" href="${root }/css/nice-select.css">
<link rel="stylesheet" href="${root }/css/flaticon.css">
<link rel="stylesheet" href="${root }/css/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/gijgo.css">
<link rel="stylesheet" href="${root }/css/animate.css">
<link rel="stylesheet" href="${root }/css/slick.css">
<link rel="stylesheet" href="${root }/css/slicknav.css">

<link rel="stylesheet" href="${root }/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>

<body>
  <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
  <jsp:include page="/menu/top.jsp" />


  <!-- bradcam_area  -->
  <div class="bradcam_area bradcam_bg_2">
    <div class="container">
      <div class="row">
        <div class="col-xl-12">
          <div class="bradcam_text text-center">
            <h3>Destinations</h3>
            <p>Pixel perfect design with awesome contents</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/ bradcam_area  -->




  <!--검색  -->
  <div class="where_togo_area">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-4">
          <div class="form_area" style="padding-bottom:10px;">
            <h3>어떤 ${at_grp_VO.at_grp_name }을 찾으세요?</h3>
          </div>
        </div>
        <div class="col-lg-8">
          <div class="search_wrap">

            <!--  검색 입력 폼 시작 -->
            <form class="search_form" name="search_form"
              id="search_form" method="get" action="./list.do">
              <input type='hidden' name='at_grp_no'
                value='${at_grp_VO.at_grp_no }'>

              <div class="input_field" style="width:100%;">
                <input type="text" name="at_name" id="at_name"
                  placeholder="상품통합검색" value="" style="width:70%; padding-right: 10px;">
              </div>
             <!--  <div class="input_field">
                <input id="dates_date" placeholder="이날 예약을 원해요" value="">
              </div> -->

              <div class="search_btn">
                <button class="boxed-btn4 " type="submit">Search</button>
              </div>
            </form>
            <!--  검색 입력 폼 끝 -->



          </div>
        </div>
      </div>
    </div>
  </div>
  <!--검색  -->


  <!-- 관리자만  노출 -->
  <ASIDE style='float: right;'>
    <a href="${root }/at/create.do?at_grp_no=${at_grp_VO.at_grp_no }">${at_grp_VO.at_grp_name }
      상품 등록</a>
  </ASIDE>
  <!-- 관리자만  노출 -->

  <!--  검색 시 출력 -->
  <ASIDE style='float: left;'>
    <c:choose>
      <c:when test='${param.at_name != null}'>
        <%-- 검색하는 경우 --%>
            ⁂ ${param.at_name } ${param.dates_date }${search_count } 건 검색됨.
        </c:when>
      <c:otherwise>
        <%-- 검색하지 않는 경우 --%>
           ⁂ ${search_count } 건 등록됨
        </c:otherwise>
    </c:choose>
  </ASIDE>
  <!--  검색 시 출력 -->


  <!-- 리스트 시작 -->
  <div class="popular_places_area">
    <div class="container">



      <c:forEach var="at_Img" items="${at_img_list }">
        <div class="col-md-4">
          <div class="single_place">
            <div class="thumb">
              <!-- 각첨부파일의 첫번째 이미지 노출, 만약 첨부파일 없을시 디폴트 이미지 출력 -->
              <c:choose>
                <c:when test="${not empty at_Img.at_img_fupname}">
                  <img
                    src="${root }/at/storage/${at_Img.at_img_fupname}">
                </c:when>
                <c:otherwise>
                  <img src="${root }/img/place/1.png">
                </c:otherwise>
              </c:choose>

              <!-- 각첨부파일의 첫번째 이미지 노출, 만약 첨부파일 없을시 디폴트 이미지 출력 -->

              <a
                href="${root }/at/read.do?at_grp_no=${at_Img.at_grp_no }&at_no=${at_Img.at_no }"
                class="prise"> <fmt:formatNumber
                  value="${at_Img.at_price }" pattern="#,###" />KRW
              </a>
            </div>
            <div class="place_info">
              <a
                href="${root }/at/read.do?at_grp_no=${at_Img.at_grp_no }&at_no=${at_Img.at_no }"><h3>${at_Img.at_name }</h3></a>
              <p>${at_Img.at_detail }</p>
              <div class="rating_days d-flex justify-content-between">
                <span
                  class="d-flex justify-content-center align-items-center">
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i> <a href="#">(20 Review)</a>
                </span>
                <div class="days">
                  <i class="fa fa-clock-o"></i> ${at_Img.at_dur }시간
                </div>

                <!-- 관리자만 노출 -->

                <button type="button"
                  onclick="location.href='${root }/at/update.do?at_no=${at_Img.at_no }'">수정</button>
                <button type="button"
                  class="delete_${at_Img.at_no }_btn"
                  data-id="${at_Img.at_no}">삭제</button>


                <script type="text/javascript">
                                  $(".delete_${at_Img.at_no }_btn")
                                      .click(
                                          function() {
                                            var params = '';
                                            $(this).data("id",
                                                "${at_Img.at_no}");
                                            var params = $(this).data("id");
                                            params = 'at_no=' + params;
                                            alert(params);

                                            if (confirm("삭제하시겠습니까(복구 불가)")) {
                                              $
                                                  .ajax({
                                                    type : "post",
                                                    url : "${root}/at/delete.do",
                                                    cache : false,
                                                    dataType : "json",
                                                    async : false,
                                                    data : params,
                                                    success : function(rdata) {

                                                      if (rdata.cnt == 1) {
                                                        alert("삭제 성공");
                                                      } else {
                                                        alert("삭제 실패");
                                                      }
                                                      location.href = "${root}/at/list.do?at_name=${at_name}&nowPage=${now_Page}&at_grp_no=${at_grp_no}";
                                                    },

                                                    error : function(request,
                                                        status, error) { // callback 함수, 전형적인 에러함수
                                                      var msg = 'ERROR<br><br>';
                                                      msg += '<strong>request.status</strong><br>'
                                                          + request.status
                                                          + '<hr>';
                                                      msg += '<strong>error</strong><br>'
                                                          + error + '<hr>'; //에러메시지
                                                      console.log(msg);
                                                    }
                                                  });
                                            }
                                            ;
                                          });
                                </script>
                <!-- 관리자만 노출 -->

              </div>
            </div>
          </div>
          <!-- single_place -->
        </div>
        <!-- col-md-3 -->
      </c:forEach>


    </div>
  </div>


  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter"
    tabindex="-1" role="dialog"
    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
          <input type="text" placeholder="Search">
          <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>
  <!-- link that opens popup -->


  <!-- JS here -->
  <script src="${root }/js/vendor/modernizr-3.5.0.min.js"></script>
  <script src="${root }/js/vendor/jquery-1.12.4.min.js"></script>
  <script src="${root }/js/popper.min.js"></script>
  <script src="${root }/js/bootstrap.min.js"></script>
  <script src="${root }/js/owl.carousel.min.js"></script>
  <script src="${root }/js/isotope.pkgd.min.js"></script>
  <script src="${root }/js/ajax-form.js"></script>
  <script src="${root }/js/waypoints.min.js"></script>
  <script src="${root }/js/jquery.counterup.min.js"></script>
  <script src="${root }/js/imagesloaded.pkgd.min.js"></script>
  <script src="${root }/js/scrollIt.js"></script>
  <script src="${root }/js/jquery.scrollUp.min.js"></script>
  <script src="${root }/js/wow.min.js"></script>
  <script src="${root }/js/jquery-ui.min.js">
      
    </script>
  <script src="${root }/js/nice-select.min.js"></script>
  <script src="${root }/js/jquery.slicknav.min.js"></script>
  <script src="${root }/js/jquery.magnific-popup.min.js"></script>
  <script src="${root }/js/plugins.js"></script>
  <script src="${root }/js/range.js"></script>
  <!-- <script src="js/gijgo.min.js"></script> -->
  <script src="${root }/js/slick.min.js"></script>



  <!--contact js-->
  <%--  <script src="${root }/js/contact.js"></script> --%>
  <script src="${root }/js/jquery.ajaxchimp.min.js"></script>
  <script src="${root }/js/jquery.form.js"></script>
  <script src="${root }/js/jquery.validate.min.js"></script>
  <script src="${root }/js/mail-script.js"></script>



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
        startDate : '+1d',
        autoclose : true,
        title : "원하는 날짜 선택",
        todayHighlight : true,
        format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
        language : "kr",
      });
    </script>



  <DIV class='bottom_menu'>${paging }</DIV>
  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>