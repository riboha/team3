package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqCont {
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc = null;
  
  public FaqCont() {
    System.out.println("--> FaqCont created.");
  }
  
  // http://localhost:9090/team3/faq/create.do
  /**
   * FAQ 등록 폼
   * @return
   */
  @RequestMapping(value="/faq/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/create"); // webapp/faq/create.jsp
    
    return mav;       
    
  }
  
  // http://localhost:9090/team3/faq/create.do
  /**
   * 등록 처리
   * @param faqVO
   * @return
   */
  @RequestMapping(value="/faq/create.do", method=RequestMethod.POST )
  public ModelAndView create(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.faqProc.create(faqVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/faq/msg.do");
    
    return mav;
  }       
  
  // http://localhost:9090/team3/faq/list.do
  /**
   * 목록
   * @return
   */
  @RequestMapping(value="/faq/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<FaqVO> list = this.faqProc.list_seqno_desc();
    mav.addObject("list", list);
    mav.setViewName("/faq/list"); // webapp/faq/create.jsp
    
    return mav; // forward
  }
  
 // http://localhost:9090/team3/faq/read.do?faqno=1
 /**
  * FAQ 조회
  * @param faqno
  * @return
  */
 @RequestMapping(value="/faq/read.do", method=RequestMethod.GET )
 public ModelAndView read(int faqno) {
   ModelAndView mav = new ModelAndView();
   
   FaqVO faqVO = this.faqProc.read(faqno);
   mav.addObject("faqVO", faqVO);
   mav.setViewName("/faq/read"); // webapp/faq/read.jsp
   
   return mav; // forward
 }
 
  // http://localhost:9090/team3/faq/update.do?faqno=1
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/faq/update.do", method=RequestMethod.GET )
  public ModelAndView update(int faqno) {
    ModelAndView mav = new ModelAndView();
    
    FaqVO faqVO = this.faqProc.update(faqno);
    mav.addObject("faqVO", faqVO);    
    mav.setViewName("/faq/update"); // webapp/faq/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team3/faq/update.do?faqno=1
  /**
   * 수정 처리
   * @param faqVO
   * @return
   */
  @RequestMapping(value="/faq/update.do", method=RequestMethod.POST )
  public ModelAndView update(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("faqno", faqVO.getFaqno());
    mav.addObject("faq_title", faqVO.getFaq_title());
    mav.addObject("faq_content", faqVO.getFaq_content());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("faqno", faqVO.getFaqno());
    hashMap.put("faq_passwd", faqVO.getFaq_passwd());
    
    int faq_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    faq_passwd_cnt = this.faqProc.passwd_check(hashMap);
    
    if (faq_passwd_cnt == 1) { // 패스워드 일치
      cnt = this.faqProc.update(faqVO);
    }
  
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("faq_passwd_cnt", faq_passwd_cnt); // request에 저장
        
    if (faq_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/faq/msg.do");
    } else { 
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/faq/msg.do");
    }
    
    return mav;
  }

  // http://localhost:9090/team3/faq/delete.do?faqno=1
 /**
  * 삭제 폼
  * @return
  */
 @RequestMapping(value="/faq/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int faqno) {
   ModelAndView mav = new ModelAndView();
   
   FaqVO faqVO = this.faqProc.update(faqno);
   mav.addObject("faqVO", faqVO);
   
   mav.setViewName("/faq/delete"); // webapp/faq/delete.jsp
   
   return mav;
 }
 
 // http://localhost:9090/team3/faq/delete.do?faqno=1
 /**
  * 삭제 처리
  * @param faqno FAQ 번호
  * @param faq_passwd 패스워드
  * @return
  */
 @RequestMapping(value="/faq/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(int faqno, String faq_passwd) {
   ModelAndView mav = new ModelAndView();

   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("faqno", faqno);
   hashMap.put("faq_passwd", faq_passwd);
   
   int faq_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
   int cnt = 0;             // 삭제된 레코드 갯수 
   
   faq_passwd_cnt = this.faqProc.passwd_check(hashMap);
   
   FaqVO faqVO = this.faqProc.read(faqno); 
   String faq_title = faqVO.getFaq_title(); // 제목
   mav.addObject("faq_title", faq_title);
   
   if (faq_passwd_cnt == 1) { // 패스워드 일치
     cnt = this.faqProc.delete(faqno);
   }

   mav.addObject("cnt", cnt); // request에 저장
   mav.addObject("faq_passwd_cnt", faq_passwd_cnt); // request에 저장
       
   if (faq_passwd_cnt == 1 && cnt == 1) {
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
     mav.setViewName("redirect:/faq/msg.do");
   } else { 
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
     mav.setViewName("redirect:/faq/msg.do");
   }
   
   return mav;
 }
 
  // http://localhost:9090/team3/faq/update_seqno_up.do?faqno=1
  // http://localhost:9090/team3/faq/update_seqno_up.do?faqno=1000
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param faqno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/faq/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_up(int faqno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.faqProc.update_seqno_up(faqno);  // 우선 순위 상향 처리
  
    mav.addObject("url", "update_seqno_up_msg"); // update_seqno_up_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/faq/msg.do");
    
    return mav;
  }  
  
  // http://localhost:9090/team3/faq/update_seqno_down.do?faqno=1
  // http://localhost:9090/team3/faq/update_seqno_down.do?faqno=1000
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param faqno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/faq/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_down(int faqno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.faqProc.update_seqno_down(faqno);
  
    mav.addObject("url", "update_seqno_down_msg"); // update_seqno_down_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/faq/msg.do");
    
    return mav;
  }  

  /**
   * 메시지
   * @param adminno
   * @return
   */
  @RequestMapping(value="/faq/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // 등록 처리 메시지: create_msg --> /faq/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /faq/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /faq/delete_msg.jsp
    mav.setViewName("/faq/" + url); // forward
    
    return mav; // forward
  }
  
}
