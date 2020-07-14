<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" >

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  $(function() {
    
    $('#btn_delete').on('click', dlt);
  
  });


  function dlt(){

    if(confirm("삭제하시겠습니까")){

      var str = ""
      //var tdArr = new Array();    // 배열 선언
      var checkBtn = $(this);

      // checkBtn.parent() : checkBtn의 부모는 <td>이다.
      // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
      var tr = checkBtn.parent().parent();
      var td = tr.children();

      var at_grp_no = td.eq(0).text();
      return dlt_proc(at_grp_no);
    }
    else{
      location.href = "./list.do";
    }

  }

  function dlt_proc(at_grp_no){
    var at_grp_no = {at_grp_no : at_grp_no};

      $.ajax({
        type : "post",
        url : "./delete.do",
        cache : false,
        dataType : "json",
        async : false,
        data : at_grp_no,
        success : function(rdata) {

          if (rdata.cnt == 1) {
            alert("삭제 성공");
          } else {
            alert("삭제 실패");
          }

          location.href = "./list.do";
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
</head>


<body>
  <jsp:include page="/menu/top.jsp" />

  <DIV class='title_line'>
    상품<br>


    <ASIDE style='float: right;'>

      <A href="./create.do">새로 등록</A> <span class='top_menu_sep'>&nbsp;</span>
      <A href="javascript:location.reload();">새로고침</A>

    </ASIDE>
  </DIV>


  <TABLE class='table table-striped'>
    <!-- TABLE 전체에 bootstrap 적용 -->
    <colgroup>
      <col style='width: 5%;' />
      <col style='width: 5%;' />
      
      <col style='width: 5%;' />
      <col style='width: 5%;' />
      <col style='width: 5%;' />
      
      <col style='width: 10%;' />
      <col style='width: 20%;' />
      <col style='width: 5%;' />
      
      <col style='width: 5%;' />
      <col style='width: 5%;' />

      <col style='width: 5%;' />
      <col style='width: 5%;' />
      <col style='width: 5%;' />
      <col style='width: 5%;' />

      <col style='width: 5%;' />
      <col style='width: 5%;' />
    </colgroup>

    <thead>
      <TR>
        <TH class="th_bs">상품그룹번호</TH>
        <TH class="th_bs">상품번호</TH>
        
        <TH class="th_bs">출력순서 상향</TH>
        <TH class="th_bs">출력순서 하향</TH>
        <TH class="th_bs">출력모드</TH>
        
        <TH class="th_bs">상품명</TH>
        <TH class="th_bs">상품명 상세</TH>        
        <TH class="th_bs">가격</TH>
       
        
        <TH class="th_bs">상품취소가능여부</TH>
        <TH class="th_bs">상품최저가보장여부</TH>
        
        <TH class="th_bs">상품조회수</TH>
        <TH class="th_bs">상품소요시간</TH>
        <TH class="th_bs">상품지원언어</TH>
        <TH class="th_bs">상품추천지수</TH>
        
        <TH class="th_bs">수정</TH>
        <TH class="th_bs">삭제</TH>

      </TR>
    </thead>

    <tbody>

      <c:forEach var="at_VO" items="${at_list }">
        <c:set var="at_no" value="${at_VO.at_no }" />

        <tr>
          <td class="td_bs">${at_VO.at_grp_no}</td>
          <td class="td_bs">${at_no}</td>
            
  
          <td class="td_bs"><a
            href="./update_seqno_up.do?at_no=${at_no }"><img
              src='${root}/menu/images/arrow_up.png'
              style="width: 20px;"></a></td>
          <td class="td_bs"><a
            href="./update_seqno_down.do?at_no=${at_no }"><img
              src='${root}/menu/images/arrow_down.png'
              style="width: 20px;"></a></td>
              
             
          <td class="td_bs">
          <c:choose>
              <c:when test="${at_VO.at_visible =='Y'}">
                <a
                  href="./update_visible.do?at_no=${at_no }&at_visible=${at_VO.at_visible}"><img
                  src='${root}/menu/images/visible_Y.png'></a>
              </c:when>

              <c:otherwise>
                <a
                  href="./update_visible.do?at_no=${at_no }&at_visible=${at_VO.at_visible}"><img
                  src='${root}/menu/images/visible_N.png'></a>
              </c:otherwise>
            </c:choose></td>  
            
            
          <td class="td_bs"><a
            href="../at/read.do?at_no=${at_no }">${at_VO.at_name }</a></td>
          <td class="td_bs"> ${at_VO.at_detail }</td>
          <td class="td_bs"> ${at_VO.at_price }</td>
          
          
          <td class="td_bs"> ${at_VO.at_cancle }</td>
          <td class="td_bs"> ${at_VO.at_lowest }</td>
           
           
           
          <td class="td_bs"> ${at_VO.at_hit }</td>
          <td class="td_bs"> ${at_VO.at_dur }</td>
          <td class="td_bs"> ${at_VO.at_lang }</td>
          <td class="td_bs"> ${at_VO.at_recom }</td>
           

                   

          <td class="td_bs"><a
            href="./update.do?at_no=${at_no }"><img
              src='${root}/menu/images/update.png' style="width: 20px;"></a></td>

          <td><button type="button" id='btn_delete'>삭제</button></td>


        </tr>
      </c:forEach>

    </tbody>

  </TABLE>
  <DIV class='bottom_menu'>${paging }</DIV>

  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>