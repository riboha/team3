package dev.mvc.mem_wish;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;
import dev.mvc.mem_wish.Mem_wishVO;

@Controller
public class Mem_wishCont {


  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem_wish.Mem_wishProc")
  private Mem_wishProcInter mem_wishProc;
  
  
  /**
   * 등록 폼
   */
  
  // http://localhost:9090/team3/mem_wish/create.do
  @RequestMapping (value = "/mem_wish/create.do", method = RequestMethod.GET )
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem_wish/create"); // webapp/mem_wish/create.jsp
    return mav;
  }
  

  /**
   * 등록 처리
   */
  
  // http://localhost:9090/team3/mem_wish/create.do
  @ResponseBody 
  @RequestMapping (value = "/mem_wish/create.do", method = RequestMethod.POST )
  public String create (HttpServletRequest request, Mem_wishVO mem_wishVO) {
    int cnt = 0;
    JSONObject json= new JSONObject();
    String msg = "";
    
    try {
      cnt = this.mem_wishProc.create(mem_wishVO);
    } catch (DuplicateKeyException e){ // SQL 오류 발생시 (중복 등록 불가 등)
      cnt = 0;
      msg = "duplicated";
      json.put("msg", msg);
      System.out.println("→DuplicateKeyException");
    } 
    
    json.put("cnt", cnt);
    return json.toString();
  }
  
  

  /**
   * 목록 (회원 본인만 조회 가능)
   */
  
  // http://localhost:9090/team3/mem_wish/list.do
  @RequestMapping (value = "/mem_wish/list.do", method = RequestMethod.GET )
  public ModelAndView list (HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (memProc.isMember(session)) {
      
      // String mem_id = (String) session.getAttribute("mem_id");
      int mem_no = (Integer) session.getAttribute("mem_no");
      mav.addObject("mem_no", mem_no);
      
      
      List<At_Mem_wishVO> list = this.mem_wishProc.list(mem_no);
      mav.addObject("list", list);
      
      mav.setViewName("/mem_wish/list"); // webapp/mem_wish/list.jsp
      
    }

    
    return mav;
  }
  

  /**
   * 검색 + 페이징 (회원 본인만 조회 가능)
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  
  @RequestMapping(value = "/mem_wish/list_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search_paging 
      (HttpSession session,
      @RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    
    int mem_no = (int) session.getAttribute("mem_no");
    
    System.out.println("Controller 진입");
    System.out.println("--> nowPage1: " + nowPage);
    System.out.println("mem_no: "+ mem_no);
    System.out.println("word: "+ word);
    
    ModelAndView mav = new ModelAndView();
    
    if (memProc.isMember(session)) {
      
      // Obejct 사용, 숫자와 문자열 타입 저장
      HashMap<Object, Object> map = new HashMap<Object, Object>();
      map.put("mem_no", mem_no); // #{mem_no}
      map.put("word: ", word); // #{word}
      map.put("nowPage: ", nowPage); // MyBatis (DB 컬럼)이 아닌, paging을 위한 rownum을 찾아내기 위해 필요한 변수
      System.out.println("--> nowPage2: " + nowPage);
      
      // 검색 목록
      List<At_Mem_wishVO> list = mem_wishProc.list_search_paging(map);
      mav.addObject("list", list);
      
      // 검색된 레코드 갯수
      int search_count = mem_wishProc.search_count(map);
      mav.addObject("search_count", search_count);
      
      System.out.println("till here");
      
      /**
       * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
       * 18 19 20 [다음]
       * @param listFile 목록 파일명
       * @param search_count 검색(전체) 레코드수
       * @param nowPage 현재 페이지
       * @param word 검색어
       * @return 페이징 생성 문자열
       */
      // String listFile = mem_wishProc.list(mem_no);
      
      String paging = mem_wishProc.pagingBox("list_search_paging.do", mem_no, search_count, nowPage, word);
      mav.addObject("paging", paging);
      mav.addObject("nowPage", nowPage);
      
      mav.setViewName("/mem_wish/list_search_paging"); // /contents/list_by_cateno_search_paging.jsp
      
      
    } else {
      // mav.setViewName(""); 
    }
    return mav;

  }
  
  
  
  
  
  /**
   * 조회
   */
  
  // http://localhost:9090/team3/mem_wish/read.do?mem_no=
  @RequestMapping (value = "/mem_wish/read.do", method = RequestMethod.GET )
  public ModelAndView read (int mem_wish_no) {
    ModelAndView mav = new ModelAndView(); 

    At_Mem_wishVO at_Mem_wishVO = this.mem_wishProc.read(mem_wish_no);
    mav.addObject("at_Mem_wishVO", at_Mem_wishVO);
    
    mav.setViewName("/mem_wish/read"); // webapp/mem_wish/read.jsp
    return mav;
  }
  


  /**
   * 수정폼
   */
  
  // http://localhost:9090/team3/mem/update.do?mem_no=
  @RequestMapping (value = "/mem_wish/update.do", method = RequestMethod.GET )
  public ModelAndView update (int mem_no) {
    ModelAndView mav = new ModelAndView(); 
    
    At_Mem_wishVO at_Mem_wishVO = this.mem_wishProc.read(mem_no);
    mav.addObject("at_Mem_wishVO", at_Mem_wishVO);
    
    mav.setViewName("/mem_wish/update"); // webapp/mem/read.jsp
    return mav;
  }
  
  
  
  /**
   * 수정 처리
   */
  
  // http://localhost:9090/team3/mem/update.do
  @ResponseBody 
  @RequestMapping(value="/mem_wish/update.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  public String update (Mem_wishVO mem_wishVO, HttpServletRequest request) {
    
    // Mem_wishVO mem_wishVO_old = this.mem_wishProc.read(mem_wishVO.getMem_no());
    
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    
    hashMap.put("mem_wish_no", mem_wishVO.getMem_wish_no());
    
    

    // int cnt = this.mem_wishProc.update(hashMap);
    
     JSONObject json= new JSONObject();
//    json.put("cnt", cnt);
//    json.put("mem_wish_no", mem_wishVO.getMem_his_no());
    
    return json.toString();
  }

  


  
  /**
   * 삭제 처리
   * @param request
   * @param mem_no
   * @return
   */
  
  // http://localhost:9090/team3/mem_wish/delete.do
  @ResponseBody 
  @RequestMapping(value="/mem_wish/delete.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  public String delete_proc(HttpServletRequest request, int mem_wish_no) {

    JSONObject json= new JSONObject();
    
    At_Mem_wishVO at_Mem_wishVO = this.mem_wishProc.read(mem_wish_no);
    int mem_no = at_Mem_wishVO.getMem_no();
    json.put("mem_no", mem_no);

    int cnt = this.mem_wishProc.delete(mem_wish_no);
    
    System.out.println("cnt: " + cnt);
    
    json.put("cnt", cnt);
    
    System.out.println( "cnt" + cnt + "mem_no: " + mem_no);
    
    return json.toString();

  }
  
  /**
   * 결합된 카테고리 그룹별 카테고리 목록
   * http://localhost:9090/resort/cate/list_index_left.do
   * @param request
   * @return
   */
 @RequestMapping(value="/mem_wish/list_index_left.do", method=RequestMethod.GET)
 public ModelAndView list_index_left(HttpServletRequest request, HttpSession session){
   
   ModelAndView mav = new ModelAndView();
   
   System.out.println("호출!");
   
   MemVO memVO = this.memProc.read((int)session.getAttribute("mem_no"));
   
   mav.addObject("mem_no", (int)session.getAttribute("mem_no"));
   mav.addObject("mem_pic_th", memVO.getMem_pic_th());
   mav.addObject("mem_nick", memVO.getMem_nick());
   mav.setViewName("./mem/list_index_left"); // webapp/cate/list_index_left.jsp

   return mav;
 } 
  
  
  

  
   
  
  
}
