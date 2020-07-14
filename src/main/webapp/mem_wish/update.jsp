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
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript">

  $(function(){
    $('#btn_submit').on('click', submit);
    $('#btn_relocate_read').on('click', toread);
  });

  function submit () {

    var frm = $('#frm');

    var mem_tel = $('#mem_tel');
    var mem_zip = $('#mem_zip');
    var mem_addr1 = $('#mem_addr1');
    var mem_addr2 = $('#mem_addr2');

    var params = frm.serialize(); // 직렬화, form의 데이터를 key:value 구조로 조합

    $.ajax({
      url: './update.do', 
      type: 'post', // type: post / get
      cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
      async: true, // 비동기 통신
      dataType: 'json', // 응답 형식: json / html / xml
      data: params, // 데이터

      
      // ▼ 서버로부터 성공적으로 응답이 온경우
      success: function (rdata) {

        // alert('cnt: ' + rdata.cnt);
        
        if(rdata.cnt>0) {
          msg = "회원 정보 수정 성공";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('회원정보 수정 성공'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
          
          // location.href='${root}/team3/mem/read.do?mem_no='+rdata.mem_no;
        }
      },   
      
      error: function(request, status, error) { 
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
      })
      }

  


    function toread () {
      var frm = $('#frm');

      var mem_no = $('#mem_no', frm).val();
      // alert ('mem_no='+mem_no)
      
      location.href= '${root}/team3/mem/read.do?mem_no='+mem_no;
      //location.href='${root}/team3/mem/list.do'
    }
    
</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    회원 정보 수정
  </DIV>

  <ASIDE style='float: left;'>
      <A href='./mem/list.do'>회원 목록</A>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 

  <div class='menu_line'></div>
 
  <DIV id='main_panel'></DIV>
  
   <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <input type='hidden' id='mem_no' name='mem_no' value='${mem_no }'/>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" id='btn_relocate_read' name='btn_relocate_read' class="btn btn-default" data-dismiss="modal">조회</button>
          <button type="button" id='btn_relocate_update' name='btn_relocate_update' class="btn btn-default" data-dismiss="modal">수정</button>
        </div>
      </div>
    </div>
  </div> 
  <!-- Modal END -->
    
    
 <c:set var = "mem_no" value = '${memVO.mem_no}'/>
 <c:set var = "mem_id" value = '${memVO.mem_id}'/>
 <c:set var = "mem_pw" value = '${memVO.mem_pw}'/>
 <c:set var = "mem_nick" value = '${memVO.mem_nick}'/>
 <c:set var = "mem_name" value = '${memVO.mem_name}'/>
 <c:set var = "mem_addr1" value = '${memVO.mem_addr1}'/>
 <c:set var = "mem_addr2" value = '${memVO.mem_addr2}'/>
 <c:set var = "mem_zip" value = '${memVO.mem_zip}'/>
 <c:set var = "mem_tel" value = '${memVO.mem_tel}'/>
 <c:set var = "mem_pt" value = '${memVO.mem_pt}'/>
 <c:set var = "mem_date" value = '${memVO.mem_date}'/>
 <c:set var = "mem_sts" value = '${memVO.mem_sts}'/>
 
 <c:set var = "mem_pic_name" value = '${memVO.mem_pic_name.toLowerCase()}'/>
 <c:set var = "mem_pic_name_up" value = '${memVO.mem_pic_name_up}'/>
 <c:set var = "mem_pic_th" value = '${memVO.mem_pic_th.toLowerCase()}'/>
 
 
  <DIV class='title_line' style='width: 30%;'>회원 정보 조회 및 수정</DIV>
 
  <FORM name='frm' id='frm' method='POST' action='./update.do' onsubmit="return send();" class="form-horizontal">
    
    <input type='hidden' name='mem_no' id='mem_no' value='${mem_no }'>          
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>아이디</label>    
      <div class="col-md-10">
        ${mem_id }        
      </div>
    </div>   
                
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>성명</label>    
      <div class="col-md-10">
      ${mem_name }
      </div>
    </div>   

    
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>프로필 사진</label>    
        <div class="col-md-10">
          <IMG src="./storage/${mem_pic_th }">
          <input type="button" id="deleteMemPic" value="기존 사진 삭제" class="btn btn-info btn-md">
          <input type='file' class="form-control" name='mem_pic_nameMF' id='mem_pic_nameMF'  value='' placeholder="파일 선택" multiple="multiple" style='width: 30%;' >
        </div>
    </div>   
    
        <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_tel' id='mem_tel' value='${mem_tel }' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_zip' id='mem_zip' value='${mem_zip }' required="required" style='width: 30%;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_addr1' id='mem_addr1' value='${mem_addr1 }' required="required" style='width: 80%;' placeholder="주소">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_addr2' id='mem_addr2' value='${mem_addr2 }' required="required" style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-12">
 
<!-- ----- DAUM 우편번호 API 시작 ----- -->
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
                document.getElementById('mem_zip').value = data.zonecode; //5자리 새우편번호 사용
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
        <button type="button" id='btn_submit' name='btn_submit' class="btn btn-primary btn-md">저장</button>
        <!-- <button type="button" onclick="history.go(-1)  ;" class="btn btn-primary btn-md">취소</button> --> <!-- 이전 페이지 -->
        <button type="button" onclick="location.href='./list.do'" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>   
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>
</html>