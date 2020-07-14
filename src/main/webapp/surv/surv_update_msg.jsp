<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>서울여행</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <DIV class='title_line'> 
  <a href='./surv/surv_create.do'>설문조사등록</a> 
   >  설문조사수정 </DIV>
  
   <ASIDE style='float: right;'>
    <A href='./surv_list.do?surv_no=${param.surv_no }'>목록</A>
   </ASIDE> 
 <div class='menu_line'></div>
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
       <c:choose>
          <c:when test="${param.passwd_cnt == 1}"> <%--패스워드일치 --%>
            <c:choose>
              <c:when test="${param.cnt == 1 }"> <%-- 글 수정 성공--%>
                <LI class='li_none'>
                 <span class='span_success'>설문조사를 수정했습니다.</span>
                </LI>
                </c:when>
                
                <c:otherwise><%--글 수정 실패 --%>
                  <LI class='li_none'>
                    <span class='span_fail'>설문조사 수정에 실패했습니다.</span>
                  </LI>
                  <LI class='li_none'>
                    <span class='span_fail'>다시 시도해주세요.</span>
                  </LI>
                </c:otherwise>
            </c:choose>
              
          </c:when>
          <c:otherwise><%--패스워드불일치 --%>
            <LI class='li_none'>
              <span class='span_fail'>패스워드가 일치하지 않습니다. 다시 시도해주세요.</span>
            </LI>
          </c:otherwise>
        </c:choose>
        
        <c:choose>
          <c:when test="${param.cnt == 1 && param.passwd_cnt == 1}">
            <LI class='li_none'>
              <button type='button' 
                        onclick="location.href='./surv_read.do?surv_no=${param.surv_no}'"
                        class="btn btn-info">변경 확인</button>
             <button type='button' 
                        onclick="location.href='./surv_list.do?surv_no=${param.surv_no}'"
                        class="btn btn-info">목록</button>                        
           </LI>
          </c:when>
          <c:otherwise>
            <LI class='li_none'>
              <button type='button' 
                        onclick="history.back();"
                        class="btn btn-info">재시도</button>
             <button type='button' 
                        onclick="location.href='./surv_list.do?surv_no=${param.surv_no}'"
                        class="btn btn-info">목록</button>                        
           </LI>
          </c:otherwise>
        </c:choose>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>