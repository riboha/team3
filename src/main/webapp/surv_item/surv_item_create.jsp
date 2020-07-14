<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(function(){ // 자동실행
  $('#btn_send').on('click',send);
  $('#btn_list').on('click',send_list);
  
});


function send_list(){
    location.href='${root}/surv_item/surv_item_list.do'
}


function send(){
  var frm = $('#frm');
  var params = frm.serialize();
  var surv_no=$('#surv_no',frm).val();
  // var params = 'surv_no=' + surv_no;
  

  if($('#surv_item_ques',frm).val()==''){
      alert('설문조사 질문을 입력해주세요.')
      $('#surv_item_ques',frm).focus();
      return;
  }
  

  if($('#surv_item_passwd',frm).val()==''){
      alert('패스워드를 입력해주세요.')
      $('#surv_item_passwd',frm).focus();
      return;
  }
  

  
  $.ajax({
    url: './surv_item_create.do', 
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
<jsp:include page="/menu/top.jsp" flush='false' />
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
  
<DIV class='container' style='width:100%;'>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
<DIV class='content'>

<DIV class='title_line' style='width:100%'>설문조사 그룹 등록</DIV>

<FORM name='frm' id='frm'method='POST' action='./surv_item_create.do'
              class="form-horizontal">
 <input type='hidden' name='surv_no' value='${param.surv_no }'>

       
    <div class="form-group">   
      <label for="surv_item_ques" class="col-md-1 control-label">질문</label>
        <div class="col-md-2">
          <input type='text' class="form-control input-lg" name="surv_item_ques" id="surv_item_ques" placeholder="" value="" required ></input>
        </div>
    </div>   
      
    <div class="form-group">   
      <label for="seqno" class="col-md-2 control-label">출력순서</label>
      <div class="col-md-1">
        <input type='number' class="form-control input-lg" name='surv_item_seqno' id='surv_item_seqno' value="1"></input>
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-md-3">패스워드</label>
        <div class="col-md-9">
          <input type='password' class="form-control" name='surv_item_passwd' id='surv_item_passwd' value='' placeholder="패스워드" 
          style='width: 20%;'>
        </div>
    </div>
  
   <DIV style='text-align: right;'>
     <button type="button" id="btn_send" class="btn btn-info">등록</button>
     <button type="button" 
                  onclick="location.href='./surv_item_list.do'" 
                 class="btn btn-info">취소[목록]</button>
  </DIV> 
 </FORM>
</DIV>

</DIV> <!-- content END -->
<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>
</body>
</html> 