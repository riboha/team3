<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 등록화면 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>서울 여행</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

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

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">


<script type="text/javascript">
  $(function () { // 자동 실행
    list_by_contentsno_add_view();  // 댓글 목록 출력 (JS의 EL 접근)
  
  });

  //required 활성화 조건 (submit)
  $('#frm').on('submit', function(e) {
    e.preventDefault();
    var at_grp_no = $('#at_grp_no', frm).val();

    $.ajax({
      type : "post",
      processData : false,
      contentType : false,
      url : "./create.do",
      cache : false,
      dataType : "json",
      async : true,
      data : new FormData($(frm)[0]),
      success : function(rdata) {

        if (rdata.cnt >= 1) {
          alert("등록 성공");
          location.href="./list.do?at_grp_no=" + at_grp_no;
          //location.href = "${root}/at/list.do?at_name=${at_name}&nowPage=${now_Page}&at_grp_no=${at_grp_no}";
        } else {
          alert("등록 실패");
        }

      },
      error : function(request, status, error) { // callback 함수, 전형적인 에러함수

        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
        console.log(msg);
      }

    });

  });


//contentsno별 소속된 댓글 목록 + 더보기 버튼 (페이징)
  function list_by_contentsno_add_view(contentsno) {

    var replyPage = parseInt($("#reply_list").attr("data-replyPage")); // 현재 페이지
    
    var params = 'contentsno=' + ${contentsVO.contentsno} + '&replyPage=' +  replyPage;

    $.ajax({
      url: "../review/list_by_contentsno_add_view.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우

        $("#reply_list").attr("data-replyPage", replyPage+1);  // 개발자정의 속성 쓰기, replyPage 증가
        // alert(rdata);
        var msg = '';
        
        // $('#reply_list').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          
          msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "  " + row.rdate;
          
          if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
            msg += " <A href='javascript:reply_delete("+row.replyno+")'><IMG src='./images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.content;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#reply_list').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });
  }
</script>

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>${at_grp_VO.at_grp_name }등록</DIV>

  <FORM id='frm' enctype="multipart/form-data" class="form-horizontal">
    <input type='hidden' name='at_grp_no' id='at_grp_no'
      value='${at_grp_VO.at_grp_no }'>

    <div class="form-group">
      <label class="control-label col-md-3">날짜</label>
      <div class="col-md-9">
        <input type="text" name='dates_date' id="dates_date" value=""
          required>

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
        <input type='number' name='stock' id='stock' value='2'
          placeholder="" min="1" max="1000" step="1" style='width: 30%;'
          class="form-control" required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">출력 순서</label>
      <div class="col-md-9">
        <input type='number' name='at_seqno' id='at_seqno' value='4'
          placeholder="" min="1" max="1000" step="1" style='width: 30%;'
          class="form-control" required>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">출력 모드</label>
      <div class="col-md-9">
        <select name='at_visible' id='at_visible' class="form-control"
          style="width: 20%;">
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">상품명</label>
      <div class="col-md-9">
        <input type='text' name='at_name' id='at_name' value='라세느'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">상품명 상세 </label>
      <div class="col-md-9">
        <input type='text' name='at_detail' id='at_detail' value='단독상품'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>



    <div class="form-group">
      <label class="control-label col-md-3">가격</label>
      <div class="col-md-9">
        <input type='text' name='at_price' id='at_price' value='5000'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">상세내용</label>
      <div class="col-md-9">
        <textarea required class="form-control" name='at_content'
          id='at_content' rows='10' placeholder="내용" style="width: 60%;">4</textarea>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">취소가능 여부</label>
      <div class="col-md-9">
        <select name='at_cancle' id='at_cancle' class="form-control"
          style="width: 20%;">
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-3">최저가 보장 여부</label>
      <div class="col-md-9">
        <select name='at_lowest' id='at_lowest' class="form-control"
          style="width: 20%;">
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
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
        <input type='text' name='at_dur' id='at_dur' value='4'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">지원언어</label>
      <div class="col-md-9">
        <input type='text' name='at_lang' id='at_lang' value='4'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">AT_SNS</label>
      <div class="col-md-9">
        <input type='text' name='at_sns' id='at_sns' value='4'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">지도</label>
      <div class="col-md-9">
        <input type='text' name='at_map' id='at_map' value='4'
          autofocus="autofocus" class="form-control" style='width: 50%;'
          required>
      </div>
    </div>

    <div class="form-group">
      <div class="col-md-12">
        ⁂첫번째로 등록한 파일이 상품 대표 이미지로 자동 노출 <input type='file'
          class="form-control" name='fnamesMF' id='fnamesMF' value=''
          placeholder="파일 선택" multiple="multiple" required>
      </div>
    </div>

    <div class="content_bottom_menu" style="padding-right: 20%;">
      <input type="submit" value="등록">
      <button type="button" onclick="location.href='./list.do'">목록</button>
    </div>
  </FORM>
  
   
  
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
