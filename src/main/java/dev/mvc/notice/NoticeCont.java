package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc = null;
  
  public NoticeCont() {
    System.out.println("--> NoticeCont created.");
  }
  
  // http://localhost:9090/team3/notice/create.do
 /**
  * 등록 폼
  * @return
  */
 @RequestMapping(value="/notice/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/notice/create"); // webapp/notice/create.jsp
   
   return mav;
 }
 
  // http://localhost:9090/team3/notice/create.do
  /**
   * 등록 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/notice/create.do", method=RequestMethod.POST )
  public ModelAndView create(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.noticeProc.create(noticeVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/notice/msg.do");
    
    return mav;
  }
  
  // http://localhost:9090/team3/notice/list.do
  /**
   * 목록
   * @return
   */
//  @RequestMapping(value="/notice/list.do", method=RequestMethod.GET )
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    
//    List<NoticeVO> list = this.noticeProc.list();
//    mav.addObject("list", list);
//    mav.setViewName("/notice/list"); // webapp/admin/create.jsp
//    
//    return mav; // forward
//  }
  
  
  /**
   * 목록 + 검색 지원
   * http://localhost:9090/team3/notice/list.do
   * http://localhost:9090/team3/notice/list.do?word=공지
   * @param cateno
   * @param word
   * @return
   */
   /*
    @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET) public
    ModelAndView list_by_search(
    @RequestParam(value="word", defaultValue="") String word ) {
    
    ModelAndView mav = new ModelAndView(); // /contents/list_by_cateno_search.jsp
   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    
    map.put("word", word); // #{word}
    
    // 검색 목록
    List<NoticeVO> list = noticeProc.list_by_search(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = noticeProc.search_count(map);
    mav.addObject("search_count", search_count);   
    
    mav.setViewName("/notice/list_by_search");
    return mav;
    
    }
    */
   
  
  // http://localhost:9090/team3/notice/read.do?noticeno=1
  /**
   * 공지사항 조회
   * @param noticeno
   * @return
   */
  @RequestMapping(value="/notice/read.do", method=RequestMethod.GET )
  public ModelAndView read(int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);
    mav.setViewName("/notice/read"); // webapp/admin/read.jsp
 
    int cnt = this.noticeProc.notice_cnt(noticeno);
    
    return mav; // forward
  }
  
  // http://localhost:9090/team3/notice/update.do?noticeno=1
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/notice/update.do", method=RequestMethod.GET )
  public ModelAndView update(int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = this.noticeProc.update(noticeno);
    mav.addObject("noticeVO", noticeVO);    
    mav.setViewName("/notice/update"); // webapp/notice/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team3/notice/update.do?noticeno=1
  /**
   * 수정 처리
   * @param noticeVO
   * @return
   */
  @RequestMapping(value="/notice/update.do", method=RequestMethod.POST )
  public ModelAndView update(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("noticeno", noticeVO.getNoticeno());
    mav.addObject("notice_title", noticeVO.getNotice_title());
    mav.addObject("notice_content", noticeVO.getNotice_content());
    mav.addObject("notice_rname", noticeVO.getNotice_rname());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("noticeno", noticeVO.getNoticeno());
    hashMap.put("notice_passwd", noticeVO.getNotice_passwd());
    
    int notice_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    notice_passwd_cnt = this.noticeProc.passwd_check(hashMap);
    
    if (notice_passwd_cnt == 1) { // 패스워드 일치
      cnt = this.noticeProc.update(noticeVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("notice_passwd_cnt", notice_passwd_cnt); // request에 저장
        
    if (notice_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/notice/msg.do");
    } else { 
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/notice/msg.do");
    }
    
    return mav;
  }
  
  // http://localhost:9090/team3/notice/delete.do?noticeno=1
 /**
  * 삭제 폼
  * @return
  */
 @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int noticeno) {
   ModelAndView mav = new ModelAndView();
   
   NoticeVO noticeVO = this.noticeProc.update(noticeno);
   mav.addObject("noticeVO", noticeVO);
   
   mav.setViewName("/notice/delete"); // webapp/notice/delete.jsp
   
   return mav;
 }
 
 // http://localhost:9090/team3/notice/delete.do?noticeno=1
 /**
  * 삭제 처리
  * @param contentsVO
  * @return
  */
 @RequestMapping(value="/notice/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(int noticeno, String notice_passwd) {
   ModelAndView mav = new ModelAndView();

   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("noticeno", noticeno);
   hashMap.put("notice_passwd", notice_passwd);
   
   int notice_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
   int cnt = 0;             // 삭제된 레코드 갯수 
   
   notice_passwd_cnt = this.noticeProc.passwd_check(hashMap);
   
   NoticeVO noticeVO = this.noticeProc.read(noticeno); 
   String notice_title = noticeVO.getNotice_title(); // 제목
   mav.addObject("notice_title", notice_title);
   
   if (notice_passwd_cnt == 1) { // 패스워드 일치
     cnt = this.noticeProc.delete(noticeno);
   }

   mav.addObject("cnt", cnt); // request에 저장
   mav.addObject("notice_passwd_cnt", notice_passwd_cnt); // request에 저장
       
   if (notice_passwd_cnt == 1 && cnt == 1) {
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
     mav.setViewName("redirect:/notice/msg.do");
   } else { 
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
     mav.setViewName("redirect:/notice/msg.do");
   }
   
   return mav;
 }
 
   /**
    * 출력 모드의 변경
    * @param noticeVO
    * @return
    */
   @RequestMapping(value="/notice/update_visible.do", 
       method=RequestMethod.GET )
   public ModelAndView update_visible(NoticeVO noticeVO) {
     ModelAndView mav = new ModelAndView();
     
     int cnt = this.noticeProc.update_visible(noticeVO);
          
     if (cnt == 1) {
       // mav.setViewName("redirect:/notice/list.do"); // request 객체가 전달이 안됨.
       mav.addObject("url", "update_visible_msg"); // delete_msg.jsp, redirect parameter 적용
       mav.setViewName("redirect:/notice/msg.do");
     } else {
       String name = this.noticeProc.read(noticeVO.getNoticeno()).getNotice_title();
       mav.addObject("name", name);
       mav.addObject("url", "update_visible_msg"); // delete_msg.jsp, redirect parameter 적용
       mav.setViewName("redirect:/notice/msg.do");
     }
     return mav;
   }  
 
  /**
   * 메시지
   * @param adminno
   * @return
   */
  @RequestMapping(value="/notice/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // 등록 처리 메시지: create_msg --> /notice/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /notice/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /notice/delete_msg.jsp
    mav.setViewName("/notice/" + url); // forward
    
    return mav; // forward
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/notice/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_search_paging(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<NoticeVO> list = noticeProc.list_by_search_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = noticeProc.search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = noticeProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/notice/list_by_search_paging");   
    
    return mav;
  }    
  
}
