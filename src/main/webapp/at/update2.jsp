<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>카테고리 그룹 수정</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

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
  <jsp:include page="/menu/top.jsp" />


  <DIV class='title_line'>수정</DIV>
  <!-- [${param.categrpno }]이전 url에서 param.으로 받아 옴 -->

  * [${at_VO.at_name }] 상품 정보
  <br>
  <c:forEach var="dates_cnt" items="${list }">
      날짜:${dates_cnt.dates_date } | 현 수량: ${dates_cnt.cnt }<br>
  </c:forEach>


  <FORM name='frm' id='frm' method='POST' class="form-horizontal">
    <input type='hidden' name='at_grp_no' id='at_grp_no'
      value='${at_VO.at_grp_no }'> <input type='hidden'
      name='at_no' id='at_no' value='${at_VO.at_no }'>



    <div class="form-group">
      <label class="control-label col-md-3">날짜</label>
      <div class="col-md-9">
        <input type="text" id="dates_date"
          value="${dates_Cnt.dates_date }" required>

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
            startDate : '+1d',
            autoclose : true,
            title : "예약일 선택",
            todayHighlight : true,
            format : "yyyy-mm-dd",
            language : "kr",
          });
        </script>


    <div class="form-group">
      <label class="control-label col-md-3">수량</label>
      <div class="col-md-9">
        <input type='number' name='stock' id='stock'
          value='${dates_Cnt.cnt }' required="required" placeholder=""
          min="1" max="1000" step="1" style='width: 30%;'
          class="form-control" required>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">출력 순서</label>
      <div class="col-md-9">
        <input type='number' name='at_seqno' id='at_seqno'
          value='${at_VO.at_seqno }' required="required" placeholder=""
          min="1" max="1000" step="1" style='width: 30%;'
          class="form-control">
      </div>
    </div>





    <div class="form-group">
      <label class="control-label col-md-3">출력 모드</label>
      <div class="col-md-9">
        <select name='at_visible' id='at_visible' class="form-control"
          style="width: 20%;">
          <option value='Y'
            ${at_VO.at_visible == 'Y' ? "selected='selected'" : "" }>Y</option>
          <option value='N'
            ${at_VO.at_visible == 'N' ? "selected='selected'" : "" }>N</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">상품명</label>
      <div class="col-md-9">
        <input type='text' name='at_name' id='at_name'
          value='${at_VO.at_name}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">상품명 상세 </label>
      <div class="col-md-9">
        <input type='text' name='at_detail' id='at_detail'
          value='${at_VO.at_detail}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>



    <div class="form-group">
      <label class="control-label col-md-3">가격</label>
      <div class="col-md-9">
        <input type='text' name='at_price' id='at_price'
          value='${at_VO.at_price}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">상세내용</label>
      <div class="col-md-9">
        <textarea class="form-control" name='at_content' id='at_content'
          rows='10' placeholder="내용" style='width: 60%'>${at_VO.at_content}</textarea>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">취소가능 여부</label>
      <div class="col-md-9">
        <select name='at_cancle' id='at_cancle' class="form-control"
          style="width: 20%;">
          <option value='Y'
            ${at_VO.at_cancle == 'Y' ? "selected='selected'" : "" }>Y</option>
          <option value='N'
            ${at_VO.at_cancle == 'N' ? "selected='selected'" : "" }>N</option>
        </select>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">최저가 보장 여부</label>
      <div class="col-md-9">
        <select name='at_lowest' id='at_lowest' class="form-control"
          style="width: 20%;">
          <option value='Y'
            ${at_VO.at_lowest == 'Y' ? "selected='selected'" : "" }>Y</option>
          <option value='N'
            ${at_VO.at_lowest == 'N' ? "selected='selected'" : "" }>N</option>
        </select>
      </div>
    </div>

    <!--              <div class="form-group">
      <label class="control-label col-md-3">조회수</label>
      <div class="col-md-9">
        <select name='at_hit' id='at_hit'
          class="form-control" style="width: 20%;">
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
      </div>
    </div>
     -->
    <div class="form-group">
      <label class="control-label col-md-3">소요시간</label>
      <div class="col-md-9">
        <input type='text' name='at_dur' id='at_dur'
          value='${at_VO.at_dur}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">지원언어</label>
      <div class="col-md-9">
        <input type='text' name='at_lang' id='at_lang'
          value='${at_VO.at_lang}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">SNS</label>
      <div class="col-md-9">
        <input type='text' name='at_sns' id='at_sns'
          value='${at_VO.at_sns}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">지도</label>
      <div class="col-md-9">
        <input type='text' name='at_map' id='at_map'
          value='${at_VO.at_map}' required="required"
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

     <div class="form-group">
      <div class="col-md-12">
        ⁂첫번째로 등록한 파일이 상품 대표 이미지로 자동 노출 <br>
        ⁂기존 이미지 삭제 후 재업로드 됨
        <input type='file'
          class="form-control" name='fnamesMF' id='fnamesMF' value=''
          placeholder="파일 선택" multiple="multiple" required>
      </div>
    </div>


    <div class="content_bottom_menu" style="padding-right: 20%;">
      <input type="submit" value="수정">
      <button type="button" onclick="location.href='./list.do'">수정
        취소</button>
    </div>

  </FORM>

<script type="text/javascript">


  $(function() {
    $('#btn_send').on('click', send);
  });

  function send() {
    var frm = $('#frm').serialize();
    var dates_date = $('#dates_date').val();
    var stock = $('#stock').val();

    var params = frm + "&dates_date=" + dates_date + "&stock=" + stock;

    //alert(params);

    if ($('#stock').val() == 0) {
      alert("0개 수량은 등록이 불가합니다. 권장:출력모드 N 변경");
      return;
    }

    $.ajax({
      type : "post",
      url : "./update.do",
      cache : false,
      dataType : "json",
      async : false,
      data : params,
      success : function(rdata) {

        if (rdata.cnt >= 1) {
          alert("수정 성공");
          location.href = "./list.do/" + "?at_grp_no=" + $('#at_grp_no').val();
        } else {
          alert("수정 실패");
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
</script>



  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>