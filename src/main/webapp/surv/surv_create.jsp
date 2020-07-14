<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>서울여행</title>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(function(){ // 자동실행
    $('#btn_send').on('click',send);
    $('#btn_list').on('click',send_list);
    
 });
  
  
  function send_list(){
      location.href='${root}/surv/surv_list.do'
  }
  
  
  function send(){
    var frm = $('#frm');
    var params = frm.serialize();
    var surv_no=$('#surv_no',frm).val();
    // var params = 'surv_no=' + surv_no;
    
    if($('#surv_seqno',frm).val()==''){
        alert('설문조사 출력순서를 입력해주세요.')
        $('#surv_seqno', frm).focus();
        return;
    }

    if($('#surv_title',frm).val()==''){
        alert('설문조사 제목을 입력해주세요.')
        $('#surv_title',frm).focus();
        return;
    }

    if($('#surv_startdate',frm).val()==''){
        alert('시작날짜를 선택해주세요.')
        $('#surv_passwd',frm).focus();
        return;
    }

    if($('#surv_enddate',frm).val()==''){
        alert('종료날짜를 선택해주세요.')
        $('#surv_passwd',frm).focus();
        return;
    }
    
    if($('#surv_passwd',frm).val()==''){
        alert('패스워드를 입력해 주세요.')
        $('#surv_passwd',frm).focus();
        return;
    }

   
    
    $.ajax({
      url: './surv_create.do', 
      type: 'post', 
      cache: false, 
      async: true, // 비동기통신
      dataType: 'json', // 응답 형식: json,html,xml.. json이 가장 신속하고 빠른방법, 대신에 개발자가 json에 대한 지식이 있어야 함.
      data: params, //보내는데이터
      success: function(rdata){ // 성공했을때, 응답이 온 경우
        
        var msg ="";
        if(rdata.cnt > 0){
          msg = "등록에 성공 했습니다.";
          
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('등록성공'); // 제목 : modal_title 요소내용을 ID 중복 확인으로 바꿈
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();     
          
          
        } else {
          
          alert('등록에 실패 했습니다. 다시 등록 해 주세요.')
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 , 디버깅을 위해 있는 것 이고 소스는 거의 이대로 쓰임
      error: function(request, status, error) { // callback 함수, ajax가 호출하는 함수, ajax엔진이 호출 함
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>'; // 상태값.
          msg += '<strong>error</strong><br>'+error + '<hr>'; // 에러메세지 
          console.log(msg);
        } //브라우저 콘솔에 찍힘
      });
  } 
</script>
</head>

<body>

<!-- Modal 알림창 시작, 알림창 필요시 계속 사용할 수 있음-->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 핵심)제목 두가지 위치를 잘 알고 있어야 함-->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 핵심)내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='btn_list' class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
<DIV class='title_line'><h2>설문조사 등록</h2></div>

  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    설문조사 등록
  </ASIDE>
  
  <ASIDE style='float: right;'>
    <A href='./surv_list.do'>설문조사목록</A>
  </ASIDE> <BR><BR>
 
<FORM name='frm' id = 'frm' method='POST' action='./surv_create.do' class="form-horizontal">
    <input type='hidden' name='mem_no' id='mem_no' value='1'>
    
    <div class="form-group">
    <label class="control-label col-md-3">출력순서</label>
    <div class="col-md-9">
      <input type='number' name='surv_seqno' id='surv_seqno' value='' placeholder="출력순서" required="required"
          min="1" max="1000" step="1" style='width: 30%;' class="form-control">
    </div>
    </div>
    
    <div class="form-group">
    <label class="control-label col-md-3">설문 제목</label>
    <div class="col-md-9">
      <input type='text' class="form-control" name='surv_title' id='surv_title' value='' placeholder="설문제목" required="required" style='width: 40%;'>
    </div>
    </div>
    
    <div class="form-group">
    <label class="control-label col-md-3">시작 날짜</label>
    <div class="col-md-9">
      <input type='date' class="form-control" name='surv_startdate' id='surv_startdate' value='' placeholder="설문내용" required="required" style='width: 40%;'>
    </div>
    </div>
    
    <div class="form-group">
    <label class="control-label col-md-3">종료 날짜</label>
    <div class="col-md-9">
      <input type='date' class="form-control" name='surv_enddate' id='surv_enddate' value='' placeholder="설문내용" required="required" style='width: 40%;'>
    </div>
    </div>
    
    <div class="form-group">
  <label class="control-label col-md-3">상태</label>
  <div class="col-md-9">
      <select name='surv_continue' id='surv_continue' class="form-control" style="width: 16%;">
          <option value='설문진행' selected="selected">설문진행</option>
          <option value='설문종료'>설문종료</option>
      </select>
    </div>
    </div>
    
    <div class="form-group">
    <label class="control-label col-md-3">패스워드</label>
    <div class="col-md-9">
      <input type='password' class="form-control" name='surv_passwd' id='surv_passwd' value='' placeholder="패스워드" 
          style='width: 20%;'>
    </div>
    </div>
    
    
    <div style="margin-left: 400px;">
    <button type="button" id="btn_send" class="btn btn-info">등록</button>
    <button type="button" 
                    onclick="location.href='./surv_list.do'" 
                   class="btn btn-info">취소[목록]</button>
    </div>
</FORM>
</body> 
</html>
 
   

