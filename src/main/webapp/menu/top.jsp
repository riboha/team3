<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- header-start -->
<header>
  <div class="header-area ">
    <div id="sticky-header" class="main-header-area">
      <div class="container-fluid">
        <div class="header_bottom_border">
          <div class="row align-items-center">
            <div class="col-xl-2 col-lg-2">
              <div class="logo">
                <a href=""> <img src="${root}/img/logo.png" alt="">
                </a>
              </div>
            </div>
            <div class="col-xl-10 col-lg-10">
              <div class="main-menu  d-none d-lg-block">
                <nav>
                
                  <ul id="navigation">
                    <li><a class="active" href="${root }">home</a></li>
                    <li><a href='${root }/at/list.do'>상품 <i class="ti-angle-down"></i></a>
                      <ul class="submenu">
                        <li><a href="${root}/at/list.do?">전체 상품 (개선중)</a></li>
                        <li><a href="${root}/at/list.do?at_grp_no=1">인기 맛집</a></li>
                        <li><a href="${root}/at/list.do?at_grp_no=2">체험</a></li>
                        <li><a href="${root}/at/list.do?at_grp_no=3">명소</a></li>
                      </ul>
                    </li>
                    
                    <li><a href="#">설문조사 <i class="ti-angle-down"></i></a>
                      <ul class="submenu">
                        <li><a href="blog.html">blog</a></li>
                        <li><a href="single-blog.html">single-blog</a></li>
                      </ul>
                    </li>
                    
                    <li><a href="${root}/cart/at_cart_mem_list.do?${sessionScope.mem_no}">장바구니<i class="ti-angle-down"></i></a>
                    <ul class="submenu">
                        <li><a href="${root}/cart/create.do">등록</a></li>
                        <li><a href="${root}/cart/at_cart_mem_list.do?mem_no=1">목록</a></li>
                        <li><a href="#">수정</a></li>
                        <li><a href="#">삭제</a></li>
                      </ul>
                    </li>
                    
                    <li><a href="#">고객센터 <i class="ti-angle-down"></i></a>
                      <ul class="submenu">
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">자주묻는질문</a></li>
                      </ul>
                    </li>

                    <li> <a href="#">회원 <i class="ti-angle-down"></i> </a>
                      <ul class="submenu">
                        <li><a href="${root}/mem/create.do">회원 가입</a></li>
                        
                        <c:choose>
                          <c:when test="${sessionScope.admin_id != null}"> <!-- 관리자 로그인 -->
                            <li><a href="${root}/mem/list_search_paging.do">회원 목록</a></li>
                          </c:when>
                        </c:choose>
                        
                        <c:choose>
                          <c:when test="${sessionScope.mem_id != null}"> <!-- 회원 로그인 -->
                            <li><a href="${root}/mem_his/read.do?mem_no=${sessionScope.mem_no}">내 구매 내역</a></li>
                            <li><a href="${root}/mem_wish/list_search_paging.do?">내 위시리스트</a></li>
                            <li><a href="${root}/review/list_by_mem_no.do?mem_no=${sessionScope.mem_no}">내 리뷰</a></li>
                            <li><a href="${root}/mem_que/list.do?mem_no=${sessionScope.mem_no}">내 문의</a></li>
                            <li><a href="${root}/mem/read.do?mem_no=${sessionScope.mem_no}">내 계정</a></li>
                          </c:when>
                        </c:choose>
                      </ul></li>
                      
                    <li><a href="contact.html">Contact</a></li>
                  </ul>
                </nav>
              </div>
            </div>
            
            <div class="col-xl-2 col-lg-2 d-none d-lg-block" >
              <div class="social_wrap d-flex align-items-center justify-content-end" >
                <div class="social_links d-none d-xl-block" >
                   <span class="glyphicon glyphicon-user"> <a href="${root}/mem/create.do"> 회원가입</a> </span>
                   
                  <c:choose>
                    <c:when test="${sessionScope.mem_id == null}"> <!-- 로그인 X -->
                      <A class='menu_link'  href='${root}/mem/login.do' >Login</A> <span class='top_menu1'> | </span>
                    </c:when>
                    <c:otherwise> <!-- 로그인 O -->
                      ${sessionScope.mem_id } <A class='menu_link'  href='${root}/mem/logout.do' >Logout</A> <span class='top_menu1'> | </span>
                    </c:otherwise>
                  </c:choose>
                  
                  <br>
                  <c:choose>
                    <c:when test="${sessionScope.id_admin == null}">
                      <A class='menu_link'  href='${root}/admin/login.do' >관리자 Login</A>
                    </c:when>
                    <c:otherwise>
                      ${sessionScope.id_admin } <A class='menu_link'  href='${root}/admin/logout.do' >관리자 Logout</A> 
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
           
            <div class="col-12">
              <div class="mobile_menu d-block d-lg-none"></div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</header>
<!-- header-end -->