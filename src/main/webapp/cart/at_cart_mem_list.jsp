<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
<link rel="stylesheet" href="../css/style_con.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<script type="text/javascript">

$(function() { // 자동 실행
  // $("button[id^='btn_cart_delete']").on('click', cart_delete); 
  // $("button[id^='btn_update']").on('click', cart_update);
    $('#btn_select_delete').on('click', select_del);
    $('#btn_select_pay').on('click', select_pay);  
});

function cart_delete(cart_no){

   //var frm_delete = $('#frm_delete');
   
   
  var mem_no = $('#mem_no1').val();
  var at_no = $('#at_no1').val();
//  var cart_no = $('#cart_no1').val();
  
  //var params = frm2.serialize();
  var params ='mem_no='+mem_no +'&at_no=' + at_no +'&cart_no=' + cart_no ;
  alert(params); 
  
  $.ajax({ 
    url: './delete.do',
    type: 'post',  //다른타입은 get
    cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
    async: true, //true: 비동기통신
    dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
    data: params, //데이터

    success: function(data) { // 서버로부터 성공적으로 응답이 온경우
      // var msg = "";
      alert ('cnt:' + data.cnt); // 정상적 전달 확인
      alert ('mem_no:' + data.mem_no); // 정상적 전달 확인
      
     if (data.cnt > 0) {
         alert("삭제?");
        
       location.href='${root}/cart/at_cart_mem_list.do?mem_no='+ data.mem_no;

      } else {
        alert("삭제못함");


      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR<br><br>';
      msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
      msg += '<strong>error</strong><br>'+error + '<hr>';
      console.log(msg);
    }
  });

}

function cart_update(cart_no, cart_cnt){

 //var frm2= $('#frm2');
 var mem_no = $('#mem_no1').val();
 var at_no = $('#at_no1').val();
 // var cart_no = $('#cart_no1').val();
 // var cart_cnt = $('#cart_cnt').val();
 
 //var params = frm2.serialize();
 var params ='mem_no='+mem_no +'&at_no=' + at_no +'&cart_no=' + cart_no +'&cart_cnt=' + cart_cnt ;
 // alert(params); 
 
 $.ajax({ 
   url: './update.do',
   type: 'post',  //다른타입은 get
   cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
   async: false, //true: 비동기통신
   dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
   data: params, //데이터

   success: function(data) { // 서버로부터 성공적으로 응답이 온경우
     // var msg = "";
     // alert ('cnt:' + data.cnt); // 정상적 전달 확인
     // alert ('mem_no:' + data.mem_no); // 정상적 전달 확인
     
     
    if (data.cnt > 0) {
        // alert ('cart_cnt:' + data.cart_cnt); // 정상적 전달 확인    
        alert("수정?");
        location.href='${root}/cart/at_cart_mem_list.do?mem_no='+ data.mem_no;

     } else {
       alert("수정못함");


     }
   },
   // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
   error: function(request, status, error) { // callback 함수
     var msg = 'ERROR<br><br>';
     msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
     msg += '<strong>error</strong><br>'+error + '<hr>';
     console.log(msg);
   }
 });

}

function allCheckFunc( ch ) {
	$("[name=checkOne]").prop("checked", $(ch).prop("checked") );
}


function oneCheckFunc( ch ){
var allch = $("[name=checkAll]");
var chName = $(ch).attr("name");

    if( $(ch).prop("checked") ){
    	checkBoxLength = $("[name="+ chName +"]").length;
    	checkedLength = $("[name="+ chName +"]:checked").length; 
    
      	if( checkBoxLength == checkedLength ) {
      		allch.prop("checked", true);
      	} else {
      		allch.prop("checked", false);
      	}
    }else{
    	allch.prop("checked", false);
    }
}

$(function(){
    $("[name=checkAll]").click(function(){
    	allCheckFunc( this );
    });

    $("[name=checkOne]").each(function(){
    	$(this).click(function(){
    		oneCheckFunc( $(this) );
    	});
    });
});




function select_del(){
  
   var confirm_val = confirm("렬루삭제?");
   
   if(confirm_val) {
    var arr = [];
    
    $("input[id='checkOne']:checked").each(function(){
      alert($(this).val());
      arr.push($(this).val());
      
    });   
     
     $.ajax({ 
      url: './delete_select.do',
      type: 'post', 
      cache: false,
      async: true, 
      dataType: 'json',
      data:  { Arr: arr},

      success: function(data) { // 서버로부터 성공적으로 응답이 온경우
        // var msg = "";
        alert ('cnt:' + data.cnt); 
        alert ('mem_no:' + data.mem_no); 
        
       if (data.cnt > 0) {
           alert("선삭?");
          
         location.href='${root}/cart/at_cart_mem_list.do?mem_no='+ data.mem_no;

        } else {
          alert("삭제못함");


        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    }); 


   } else{
     return false;
   }

}


// 선택 결재 처리
/*
function select_pay(){
  
  var confirm_val = confirm("선택 결제?");
  
  if(confirm_val) {
    var pay_arr = [];
  
    $("input[id='checkOne']:checked").each(function(){
      alert($(this).val());
      pay_arr.push($(this).val());
     
    });   

   var param = $("#frm").serialize();  //serialize값다받아옴 ->cont
   // alert(param);
   // return;
    
    $.ajax({ 
     url: '../payment/create_select.do',
     type: 'post', 
     cache: false,
     async: true, 
     dataType: 'json',
     data:  param,

     success: function(data) { // 서버로부터 성공적으로 응답이 온경우
       // var msg = "";
       alert ('cnt:' + data.cnt); 
       alert ('mem_no:' + data.mem_no);
       alert ('cart_no:' + data.cart_no);
       
       
      if (data.cnt > 0) {
         alert(data.cnt + " 건");
         
         
         
       } else {
         alert("주문 실패했습니다.");
       }
     },
     // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
     error: function(request, status, error) { // callback 함수
       var msg = 'ERROR<br><br>';
       msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
       msg += '<strong>error</strong><br>'+error + '<hr>';
       console.log(msg);
     }
   }); 


  } else{
    return false;
  }

}

*/
</script>

 

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    장바구니 목록   ♣${memVO.mem_id} 님이 로그인함
  </DIV>
 
  <FORM name='frm'  id='frm' method='GET' action='../payment/create_select.do' class="form-horizontal" style='margin-top:50px;'>
  
     <button type="button" id='btn_select_delete' name='btn_select_delete' class="btn_select_delete">선택삭제</button>
     
     <button type="submit" id='btn_select_pay' name='btn_select_pay' class="btn_select_pay">선택결제</button>
         
  <div style='width: 100%; margin-top:50px;' >
  
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>
          <input type="checkbox" id="checkAll" name="checkAll" >
          </th>
          <th style='text-align: center;'>상품번호</th>
          <th style='text-align: center;'>상품가격</th>
          <th style='text-align: center;'>수량</th>
          <th style='text-align: center;'>총액</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="at_Cart_VO" items="${list }">
        
          <c:set var="at_no" value="${at_Cart_VO.at_no }" />
          <c:set var="at_price" value="${at_Cart_VO.at_price }" />
          
          <c:set var="cart_no" value="${at_Cart_VO.cart_no }" />
          <c:set var="cart_payment" value="${at_Cart_VO.at_price*at_Cart_VO.cart_cnt }" /> <!-- 상품1총가격 -->
          <c:set var="cart_cnt" value="${at_Cart_VO.cart_cnt }" />
          <c:set var="cart_date" value="${at_Cart_VO.cart_date }" />
          
          <c:set var="mem_no" value="${memVO.mem_no }" />
          <c:set var="mem_id" value="${memVO.mem_id }" />
          
          <tr> 
           <td style='text-align: center;'>
           <input type="checkbox" id="checkOne" name="checkOne"  value="${cart_no }">
           ${cart_no }
 
           </td>
            <td style='text-align: center;'>${at_no}</td>
            <td style='text-align: center;'>${at_price}</td>
            <td style='text-align: center;'>
              <input type='number' name='cart_cnt_${cart_no }'  id='cart_cnt_${cart_no }' value='${cart_cnt }' required="required"  min='1' max='50' step='1' style='width: 50%;'>
        <br>
              <button type="button" id='btn_update_${cart_no }' name='btn_update_${cart_no }'  class="btn btn-info"
                    onclick="cart_update(${cart_no}, this.form.cart_cnt_${cart_no}.value)">수정</button>
            </td>
            
            <td style='text-align: center;'>${cart_payment }</td>
            <td style='text-align: center;'>${cart_date.substring(0,10)}</td>
            
            <td> 

              
              <button type="button" id='btn_cart_delete_${cart_no }' name='btn_cart_delete_${cart_no }'  class="btn btn-info"
                            onclick="cart_delete(${cart_no})">삭제</button>

           <a href="../payment/create.do?cart_no=${cart_no }"><button type="button">결제</button></a>
            </td>
            

          </tr>
          
              <input type='hidden' name='cart_no' id='cart_no' value='${cart_no}'> 
              <input type='hidden' name='mem_no' id='mem_no' value='${mem_no}'> 
              <input type='hidden' name='at_no'  id='at_no' value='1'>  
               
           
              


        </c:forEach>
             
      </tbody>
    </table>
    </div>
      
         총결제금액  :  ${cart_sum }   



    <br><br>
  
</FORM>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
 
 
</html> 
 
 