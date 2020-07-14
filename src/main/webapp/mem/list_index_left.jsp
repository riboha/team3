<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<style type="text/css">
/* fieldset 전체 적용 */
.categrp_cate_left{
  width: 100%;
  margin: 0px auto; 
  border-left: none; 
  border-right: none;
  border-top: solid 1px #DDDDDD;  
  border-bottom: solid 1px #DDDDDD;  
  text-align: left;
}
 
/* <UL> 태그에 적용 */
.categrp_cate_list_left{
  padding-left: 10%; 
  line-height: 20px;
}
 
/* 카테고리 그룹 이름에 적용, Spring에서 사용 */
.categrp_name{
  margin-left: 5%;
  font-weight: bold;
  list-style-image: url("${pageContext.request.contextPath}/cate/images/categrp.png");
}
 
/* 카테고리에 적용, Spring에서 사용 */
.cate_name{
  margin-left: 5%;
  list-style-image: url("${pageContext.request.contextPath}/cate/images/cate.png");
}
</style>
 
 
    <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-sm-3 col-md-2"> <!-- 메뉴 출력 컬럼-->
    
          <fieldset class='categrp_cate_left' style='margin-left: 40px;'>
        <div>

        <c:choose>
          <c:when test="${mem_pic_th != null }">
            <IMG src="${root}/team3/mem/storage/${mem_pic_th }"> 
          </c:when>
          <c:otherwise>
            <IMG src="./images/profpic.png" width="180px;" height="180px;"> 
          </c:otherwise>
        </c:choose>
        
        </div>
        <br>
       [ ${mem_nick} ] 님
      </fieldset>
      <br>
      
      <fieldset class='categrp_cate_left' style='margin-left: 40px;'>
        <UL class='categrp_cate_list_left' >
          <li>☞ <a href="${root}/team3/mem_his/read.do?mem_no=${mem_no}">내 구매 내역</a></li>
          <br>
          <li>☞<a href="${root}/team3/mem_wish/list_search_paging.do?mem_no=${mem_no}">내 위시리스트</a></li>
          <br>
          <li>☞<a href="${root}/team3/review/list.do?mem_no=${mem_no}">내 후기</a></li>
          <br>
          <li>☞<a href="${root}/team3/mem_que/list.do?mem_no=${mem_no}">내 문의</a></li>
          <br>
          <li>☞<a href="${root}/team3/mem/read.do?mem_no=${mem_no}">내 계정</a></li>
        </UL>
     </fieldset>
    
   </DIV>