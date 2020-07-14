<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

   // JavaScript 전역 변수 선언 문제

/*     var idx1 = false; // 아이디 중복 체크 여부
    var idx2 = false; // 닉네임 중복 체크 여부
    var idx3 = false; // 핸드폰 번호 중복 체크 여부
    // var frm = $('#frm')[0];
    var frm = $('#frm');
    var mem_id = $('#mem_id', frm).val(); 
    var mem_nick = $('#mem_nick', frm).val(); 
    var mem_tel = $('#mem_tel', frm).val();  */
    
  $(document).ready(function(e){

	  var idx1 = false; // 아이디 중복 체크 여부
	  var idx2 = false; // 닉네임 중복 체크 여부
	  var idx3 = false; // 핸드폰 번호 중복 체크 여부

      // 아이디 중복 체크
      $('#checkID1').click(function(){
        
        var frm = $('#frm');
        var mem_id = $('#mem_id', frm).val(); 
        idx1 = false; // 아이디 중복 체크 여부
         
        if ($.trim(mem_id).length == 0) { 
          var html="<tr><td colspan='3' style='color: green'>ID를 입력해주세요</td></tr>";
          $('#id_span').empty();
          $('#id_span').append(html);
          
        } else {
          $.ajax ({
            url: './checkID.do', 
            type: 'get', 
            cache: false, 
            async: true,
            dataType: 'json', 
            data: {
              'mem_id': mem_id
            },
            success: function (rdata) {
              if(rdata.cnt == 0){
                idx1 = true;
                $('#mem_id').attr("readonly",true);
                var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
                $('#id_span').empty();
                $('#id_span').append(html);
              } else {
                var html="<tr><td colspan='3' style='color: red'>사용 불가능</td></tr>";
                $('#id_span').empty();
                $('#id_span').append(html);
              }
            },
            error: function(request, status, error) { 
              var msg = 'ERROR<br><br>';
              msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
              msg += '<strong>error</strong><br>'+error + '<hr>';
              console.log(msg);
            }
          });
        }
        }); 

      
      // 아이디 중복 체크 해체
      $('#checkID2').click(function(){
        
        var frm = $('#frm');
        var mem_id = $('#mem_id', frm).val(); 
        idx1 = false; // 아이디 중복 체크 여부 해제

        $('#mem_id').attr("readonly", false);
        // var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
        $('#id_span').empty();
        $('#id_span').append(html);
        }); 

      
      // 닉네임 중복 체크
      $('#checkNick1').click(function(){
        
        var frm = $('#frm');
        var mem_nick = $('#mem_nick', frm).val(); 
        idx2 = false; // 아이디 중복 체크 여부
        
        if ($.trim(mem_nick).length == 0) { 
          var html="<tr><td colspan='3' style='color: green'>닉네임을 입력해주세요</td></tr>";
          $('#nick_span').empty();
          $('#nick_span').append(html);
          
        } else {
          $.ajax ({
            url: './checkNick.do', 
            type: 'get', 
            cache: false,
            async: true, 
            dataType: 'json',
            data: {
              'mem_nick':$('#mem_nick', frm).val()
            },
            success: function (rdata) { 
              if (rdata.cnt == 0) {
                idx2 = true;
                $('#mem_nick').attr("readonly",true);
                var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
                $('#nick_span').empty();
                $('#nick_span').append(html);
              } else {
                var html="<tr><td colspan='3' style='color: red'>사용 불가능</td></tr>";
                $('#nick_span').empty();
                $('#nick_span').append(html);
                // $.cookie ('checkID', 'TRUE'); // Cookie 기록
              }
            },
            error: function(request, status, error) { 
              var msg = 'ERROR<br><br>';
              msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
              msg += '<strong>error</strong><br>'+error + '<hr>';
              console.log(msg);
            }
          });
        }
    });

    // 닉네임 중복 체크 해체
    $('#checkNick2').click(function(){
      
      var frm = $('#frm');
      var mem_nick = $('#mem_nick', frm).val(); 
      idx2 = false; // 닉네임 중복 체크 여부 해제

      $('#mem_nick').attr("readonly", false);
      // var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
      $('#nick_span').empty();
      $('#nick_span').append(html);
      }); 

    // 핸드폰 번호 중복 체크
    $('#checkTel1').click(function(){
      
      var frm = $('#frm');
      var mem_nick = $('#mem_tel', frm).val(); 
      idx3 = false; // 아이디 중복 체크 여부 
      
      if ($.trim(mem_tel).length == 0 || $.trim($('#mem_tel').val()) == '') { 
        var html="<tr><td colspan='3' style='color: green'>핸드폰 번호를 입력해주세요</td></tr>";
        $('#tel_span').empty();
        $('#tel_span').append(html);
        
      } else {
        $.ajax ({
          url: './checkTel.do', 
          type: 'get', 
          cache: false,
          async: true, 
          dataType: 'json',
          data: {
            'mem_tel':$('#mem_tel', frm).val()
          },
          success: function (rdata) { 
            if (rdata.cnt == 0) {
              idx3 = true;
              $('#mem_tel').attr("readonly",true);
              var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
              $('#tel_span').empty();
              $('#tel_span').append(html);
            } else {
              var html="<tr><td colspan='3' style='color: red'>사용 불가능</td></tr>";
              $('#tel_span').empty();
              $('#tel_span').append(html);
              // $.cookie ('checkID', 'TRUE'); // Cookie 기록
            }
          },
          error: function(request, status, error) { 
            var msg = 'ERROR<br><br>';
            msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
            msg += '<strong>error</strong><br>'+error + '<hr>';
            console.log(msg);
          }
        });
      }
  });

  // 핸드폰 번호 중복 체크 해체
  $('#checkTel2').click(function(){
    
    var frm = $('#frm');
    var mem_tel = $('#mem_tel', frm).val(); 
    idx2 = false; // 닉네임 중복 체크 여부 해제

    $('#mem_tel').attr("readonly", false);
    // var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
    $('#tel_span').empty();
    $('#tel_span').append(html);
    });   

   // 제출
  $('#send').click(function(){

    // mem_id 입력 확인
    if($.trim($('#mem_id').val()) == ''){
      alert("아이디를 입력해주세요");
      $('#mem_id').focus();
      return false;
    }

    // mem_id 중복체크 확인
    if(idx1==false){
      alert("아이디 중복체크를 해주세요.");
      $('#mem_id').focus();
      return;
    }
    
    // mem_pw 일치 여부 확인
    if ($('#mem_pw').val() != $('#mem_pw2').val()) {
      alert("비밀번호가 일치하지 않습니다");
      $('#mem_pw2').focus();
      return false; // submit 중지
    }

    // mem_nick 입력 확인
    if($.trim($('#mem_nick').val()) == ''){
    alert("닉네임을 입력해주세요");
    $('#mem_nick').focus();
    return false;
    }

    // mem_nick 중복체크 확인
    if(idx2==false){
    alert("닉네임 중복체크를 해주세요.");
    $('#mem_nick').focus();
    return false;
    }

    // mem_name 입력 확인
    if($.trim($('#mem_name').val()) == ''){
    alert("성명을 입력해주세요");
    $('#mem_name').focus();
    return false;
    }

    // mem_tel 입력 확인
    if($.trim($('#mem_tel').val()) == ''){
    alert("전화번호를 입력해주세요");
    $('#mem_tel').focus();
    return false;
    }

    // mem_tel 중복체크 확인
    if(idx3==false){
    alert("전화번호를 중복체크를 해주세요.");
    $('#mem_nick').focus();
    return false;
    }

    var frm = $('#frm')[0];
    var formData = new FormData(frm);

    $.ajax({
      url: './create.do', 
      type: 'post', // type: post / get
      cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
      async: true, // 비동기 통신
      dataType: 'json', // 응답 형식: json / html / xml
      processData: false,
      contentType: false,    
      data: formData, // 데이터
      
      // ▼ 서버로부터 성공적으로 응답이 온경우
      success: function (rdata) {
        if(rdata.mem_no>0) {
          // location.href='${root}/team3/mem/read.do?mem_no='+rdata.mem_no;
          var success = 1;
          
          location.href='${root}/team3/mem/login.do?success='+success;
          
          msg = "회원 가입 성공";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('회원정보 수정 성공'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        }
      },   
      error: function(request, status, error) { 
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
  });

  // 조회 go
  $('#toread').click(function(){
    location.href='${root}/team3/mem/read.do?mem_no='+mem_no;
    });

  })

</script>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- ▶ 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- ▶ 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id="toread" class="btn btn-default" data-dismiss="modal">확인</button>
          <!-- <button type="button" onclick="" data-dismiss="modal">확인</button> -->
        </div>
      </div>
    </div>
  </div> 
<!-- Modal 알림창 종료 --> 

  <DIV class='title_line'>회원가입</DIV>

  <ASIDE style='float: left;'>
      *: 필수 입력  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 

  <div class='menu_line'></div>

  <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
  
    <br><br>
    
    <div class="form-group">
      <label for="mem_id" class="col-md-2 control-label">아이디*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_id' id='mem_id' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
              <button type='button' id="checkID1" class="btn btn-info btn-md">중복확인</button>
              <button type='button' id="checkID2" class="btn btn-info btn-md">다시 입력</button>
 <%--          <c:choose>
            <c:when test="">
            </c:when>
            <c:otherwise>
            </c:otherwise>
          </c:choose> --%>
        
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div>   
                
    <div class="form-group">
      <label for="passwd" class="col-md-2 control-label">패스워드*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='mem_pw' id='mem_pw' value='1234' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   

    <div class="form-group">
      <label for="passwd2" class="col-md-2 control-label">패스워드 확인*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='mem_pw2' id='mem_pw2' value='1234' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>
    
    <div class="form-group">
      <label for="mem_nick" class="col-md-2 control-label">닉네임*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_nick' id='mem_nick' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <button type='button' id="checkNick1" class="btn btn-info btn-md">중복확인</button>
        <button type='button' id="checkNick2" class="btn btn-info btn-md">다시 입력</button>
        
        <SPAN id='nick_span'></SPAN> 
      </div>
    </div>   
    
    <div class="form-group">
      <label for = "mem_pic" class="col-md-2 control-label">프로필 사진</label>
        <div class="col-md-10">
          <input type='file' class="form-control" name='mem_pic_nameMF' id='mem_pic_nameMF'  value='' placeholder="파일 선택" style='width: 30%;' >
        </div>
    </div>
    
    <div class="form-group">
      <label for="mem_name" class="col-md-2 control-label">성명*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_name' id='mem_name' value='' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   

    <div class="form-group">
      <label for="tel" class="col-md-2 control-label">전화번호*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_tel' id='mem_tel' value='' required="required" style='width: 30%;' placeholder="전화번호"> 
        <button type='button' id="checkTel1" class="btn btn-info btn-md">중복확인</button>
        <button type='button' id="checkTel2" class="btn btn-info btn-md">다시 입력</button>
        <SPAN id='tel_span'></SPAN> 
        <br>예) 010-0000-0000
      </div>
    </div>   

    <div class="form-group">
      <label for="zipcode" class="col-md-2 control-label">우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_zip' id='mem_zip' value=''  style='width: 30%;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  

    <div class="form-group">
      <label for="address1" class="col-md-2 control-label">주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_addr1' id='mem_addr1' value=''  style='width: 50%;' placeholder="주소">
      </div>
    </div>   

    <div class="form-group">
      <label for="address2" class="col-md-2 control-label">상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_addr2' id='mem_addr2' value=''  style='width: 50%;' placeholder="상세 주소">
      </div>
    </div>   

    <div class="form-group">
      <div class="col-md-12">

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<!-- iframe 기법 → 특정 영역만큼 타 사이트 띄우기 -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_addr1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#mem_addr2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='send' class="btn btn-primary btn-md">가입</button>
        <button type="button" onclick="location.href='../index.jsp'" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>   
  </FORM>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
 