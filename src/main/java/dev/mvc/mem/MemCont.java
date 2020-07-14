package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.mem_wish.Mem_wishProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class MemCont {
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem_wish.Mem_wishProc")
  private Mem_wishProcInter mem_wishProc;
  

  /**
   * 등록 폼
   */
  
  // http://localhost:9090/resort/mem/create.do
  @RequestMapping (value = "/mem/create.do", method = RequestMethod.GET )
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mem/create"); // webapp/mem/create.jsp
    return mav;
  }
  
  
  /**
   * ID 중복 체크 
   */
  
  // http://localhost:9090/resort/mem/checkID.do?id=user1
  // JSON 출력 → 한글 깨짐 주의 (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkID.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkID (String mem_id) {
    int cnt = this.memProc.checkID(mem_id);
    
    JSONObject json= new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  /**
   * 닉네임 중복 체크 
   */
  
  // http://localhost:9090/resort/mem/checkNick.do?id=user1
  // JSON 출력 → 한글 깨짐 주의 (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkNick.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkNick (String mem_nick) {
    int cnt = this.memProc.checkNick(mem_nick);
    
    JSONObject json= new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  /**
   * 핸드폰번호 중복 체크 
   */
  
  // http://localhost:9090/resort/mem/checkNick.do?id=user1
  // JSON 출력 → 한글 깨짐 주의 (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkTel.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkTel (String mem_tel) {
    int cnt = this.memProc.checkTel(mem_tel);
    
    System.out.println("핸드폰 번호 중복 확인 cnt: " + cnt);
    
    JSONObject json= new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  /**
   * 핸드폰번호 수정시 중복 체크 
   */
  
  // http://localhost:9090/resort/mem/checkNick.do?id=user1
  // JSON 출력 → 한글 깨짐 주의 (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkTelUpdate.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkTelUpdate (String mem_tel, HttpSession session) {

    JSONObject json= new JSONObject();
    int cnt = 0;
    
    MemVO memVO_old = this.memProc.read((int)session.getAttribute("mem_no")); // 회원용 ▶mem_no는 session으로 호출◀
    // MemVO memVO_old = this.memProc.read(memVO.getMem_no()); // 관리자용

    //    System.out.println("mem_no: " + (int)session.getAttribute("mem_no"));
    //    System.out.println("mem_tel: " + mem_tel );
    //    System.out.println("mem_tel_old: " + memVO_old.getMem_tel() );
    
    if (memVO_old.getMem_tel().equals(mem_tel)) {
      cnt = 0;
    } else {
      cnt = this.memProc.checkTel(mem_tel);
    }
    
    System.out.println("확인 결과:" + cnt);
    
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  

  
  /**
   * 등록 처리
   */
  
  // http://localhost:9090/resort/mem/create.do
  @ResponseBody
  @RequestMapping (value = "/mem/create.do", method = RequestMethod.POST,  produces="text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, MemVO memVO) {
    
    System.out.println("통과2");
    // System.out.println("fileMF: " + memVO.getMem_pic_nameMF());
    
    /*============※※※※※파일 전송 코드 시작※※※※※============*/ 
    String mem_pic_name_up = ""; // Main 이미지
    String mem_pic_th = ""; // Preview 이미지
    long mem_pic_size = 0;

    String upDir = Tool.getRealPath (request, "/mem/storage"); // 절대 경로

    // 전송 파일 유무 상관 X, fnamesMF (파일 목록) 객체 생성. (자바는 파일 객체가 따로 있음, spring이 개입)
    MultipartFile  MF = memVO.getMem_pic_nameMF();
    String fname = MF.getOriginalFilename(); // 원본 파일명
    

    System.out.println("fname: " + fname);
    
    mem_pic_size =  MF.getSize(); // 파일 크기
    System.out.println("mem_pic_size: " + mem_pic_size);
    
    if (mem_pic_size > 0) { // 전송 파일 유무 확인
      
      mem_pic_name_up = Upload.saveFileSpring (MF, upDir); // 절대 경로에 파일 저장
      System.out.println("mem_pic_name_up1: " + mem_pic_name_up);
      
      if (Tool.isImage (mem_pic_name_up)) { // 이미지 여부 확인 
        // ▼ mem_pic_th 이미지 생성 (선언한 고정 크기 (width 80, height 80)로 이미지 축소)
        mem_pic_th = Tool.preview (upDir, mem_pic_name_up, 80, 80); 
    }
    /*============※※※※※파일 전송 코드 종료※※※※※============*/ 
    
    }
    memVO.setMem_pic_th(mem_pic_th);
    memVO.setMem_pic_name_up(mem_pic_name_up);
    // System.out.println("mem_pic_name_up2: " + mem_pic_name_up);
    memVO.setMem_pic_size(mem_pic_size);
    
    
    int cnt = this.memProc.create(memVO);
    
    // ---------------------------------------------------------------------------------------
    // cnt, mem_no return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> memVO <-----> MyBATIS
    // Spring과 MyBATIS가 MemVO를 공유하고 있음.
    // MyBATIS는 insert후 PK 컬럼인 mem_no변수에 새로 생성된 PK를 할당함.
    int mem_no = memVO.getMem_no();  // MyBATIS 리턴된 PK
    System.out.println("mem_no: " + mem_no);
    // ---------------------------------------------------------------------------------------
    
    JSONObject json= new JSONObject();
    json.put("mem_no", mem_no);
    
    return json.toString();
    }
    
    

  
  
  /**
   * 목록
   */
  
   //http://localhost:9090/resort/mem/list.do
//  @RequestMapping (value = "/mem/list.do", method = RequestMethod.GET )
//  public ModelAndView list ( ) {
//    ModelAndView mav = new ModelAndView();
//    
//    List<MemVO> list = this.memProc.list();
//    mav.addObject("list", list);
//    
//    mav.setViewName("/mem/list"); // webapp/mem/list.jsp
//    return mav;
//  }
  
  

  /**
   * 목록 (상태별)
   */
  
  // http://localhost:9090/team3/mem/list_select.do?mem_sts=
  @RequestMapping (value = "/mem/list_select.do", method = RequestMethod.GET )
  public ModelAndView list_select (int mem_sts) {
    ModelAndView mav = new ModelAndView();
    
    List<MemVO> list = this.memProc.list_select(mem_sts);
    mav.addObject("list", list);
    
    mav.setViewName("/mem/list"); // webapp/mem/list.jsp
    return mav;
  }
  
  
  /**
   * 검색 + 페이징 지원 http://localhost:9090/team3/mem/list.do
   * http://localhost:9090/team3/mem/
?word=스위스&nowPage=1
   * 
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  
  @RequestMapping(value = "/mem/list_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_search_paging
      (@RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    
    System.out.println("Controller 진입");
    System.out.println("--> nowPage1: " + nowPage);

    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("word", word); // #{word}
    map.put("nowPage", nowPage); // MyBatis (DB 컬럼)이 아닌, paging을 위한 rownum을 찾아내기 위해 필요한 변수

    System.out.println("--> nowPage2: " + nowPage);
    
    // 검색 목록
    List<MemVO> list = this.memProc.list_search_paging(map);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = this.memProc.search_count(map);
    mav.addObject("search_count", search_count);

    
    
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * 
     * @param listFile 목록 파일명
     * 
     * @param cateno 카테고리번호
     * 
     * @param search_count 검색(전체) 레코드수
     * 
     * @param nowPage 현재 페이지
     * 
     * @param word 검색어
     * 
     * @return 페이징 생성 문자열
     */
    
    String paging = memProc.pagingBox("list_search_paging.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    // mav.setViewName("/contents/list_by_cateno_search_paging"); // /contents/list_by_cateno_search_paging.jsp
    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table1"); // /contents/list_by_cateno_search_paging.jsp
    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table2"); // /contents/list_by_cateno_search_paging.jsp
    
    mav.setViewName("/mem/list_search_paging"); // /contents/list_by_cateno_search_paging.jsp
    return mav;
  }
  
  
  
  /**
   * 회원 목록 (관리자만 접근 가능)
   * @param session
   * @return
   */
  @RequestMapping(value="/mem/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<MemVO> list = memProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/mem/list"); // /webapp/mem/list.jsp

    } else {
      mav.setViewName("redirect:/mem/login_need.jsp"); // /webapp/mem/login_need.jsp
    }
    
    return mav;
  }



   
  
  /**
   * 조회
   */
  
  // http://localhost:9090/team3/mem/read.do?mem_no=
  @RequestMapping (value = "/mem/read.do", method = RequestMethod.GET )
  public ModelAndView read (int mem_no) {
    ModelAndView mav = new ModelAndView(); 
    
    MemVO memVO = this.memProc.read(mem_no);
    mav.addObject("memVO", memVO);
    
    mav.setViewName("/mem/read"); // webapp/mem/read.jsp
    return mav;
  }
  
  
  /**
   * 수정폼
   */
  
  // http://localhost:9090/team3/mem/update.do?mem_no=
  @RequestMapping (value = "/mem/update.do", method = RequestMethod.GET )
  public ModelAndView update (int mem_no) {
    ModelAndView mav = new ModelAndView(); 
    
    MemVO memVO = this.memProc.read(mem_no);
    mav.addObject("memVO", memVO);
    
    mav.setViewName("/mem/update"); // webapp/mem/read.jsp
    return mav;
  }
  
  
  // 프로필 사진 삭제(수정)

   
  @ResponseBody 
  @RequestMapping(value="/mem/update_pic.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  public String update_pic (int mem_no , HttpServletRequest request) {
    
    System.out.println("controller has been recieved mem_no: " + mem_no);
    
    MemVO memVO = this.memProc.read(mem_no);
    
    // 디스크 삭제
    String upDir = Tool.getRealPath(request, "/mem/storage"); 
    Tool.deleteFile(upDir, memVO.getMem_pic_name_up()); 
    Tool.deleteFile(upDir, memVO.getMem_pic_th()); 

    // DB null값 부여
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("mem_pic_name_up", null);
    hashMap.put("mem_pic_th", null);
    hashMap.put("mem_pic_size", null);
    hashMap.put("mem_no", mem_no);
    int profpic_delete = this.memProc.update_pic(hashMap);
    
    JSONObject json= new JSONObject();
    json.put("profpic_delete", profpic_delete);
    json.put("mem_no", memVO.getMem_no());
    
    return json.toString();
  }
    
  
  
  /**
   * 수정 처리 (로그인된 회원만 가능)
   */
  
  // http://localhost:9090/team3/mem/update.do
  @ResponseBody 
  @RequestMapping(value="/mem/update.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  // public String update (MemVO memVO, int profpic_delete, HttpServletRequest request, HttpSession session) {
  public String update (MemVO memVO, HttpServletRequest request, HttpSession session) {
    
    System.out.println("수정처리 진입");
    
    JSONObject json= new JSONObject();
    
    if (memProc.isMember(session)) {
      
      String mem_pic_name_up = ""; // 업로드 이미지
      String mem_pic_th = ""; // 썸네일 
      long mem_pic_size = 0; // 업로드 이미지 크기
      
      MemVO memVO_old = this.memProc.read((int)session.getAttribute("mem_no")); // 회원용 ▶mem_no는 session으로 호출◀
      // MemVO memVO_old = this.memProc.read(memVO.getMem_no()); // 관리자용
      HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
      String upDir = Tool.getRealPath (request, "/mem/storage"); // 절대 경로
      

      MultipartFile MF = memVO.getMem_pic_nameMF(); // 전송 파일 유무 상관 X, fnamesMF (파일 목록) 객체 생성. (자바는 파일 객체가 따로 있음, spring이 개입)
      
      // 이미지 업로드 여부 판별, 예외 처리
      try {
        mem_pic_size =  MF.getSize(); // 업로드 O
      } catch (NullPointerException e) {
        mem_pic_size = 0; // 업로드 X
      }

      if (mem_pic_size > 0) {
        System.out.println("새 프로필 사진을 업로드");
      } else if (mem_pic_size == 0) {
        System.out.println("새 프로필 사진을 업로드 X");
      } else {
        System.out.println("뭐임?");
      }
      
       
      if (mem_pic_size > 0) { // 업로드 O
        
        mem_pic_name_up = Upload.saveFileSpring (MF, upDir); // 절대 경로에 파일 저장
        
        if (Tool.isImage (mem_pic_name_up)) { // 이미지 여부 확인 
          // ▼ mem_pic_th 이미지 생성 (선언한 고정 크기 (width 80, height 80)로 이미지 축소)
          mem_pic_th = Tool.preview (upDir, mem_pic_name_up, 100, 100); 

        }
      }
      
      if (memVO.getMem_pw_new().equals("")) { // 비밀번호를 새로 입력하지 않았을 경우 (.equals로 사용해야함, '==null'은 비교 불가)
        hashMap.put("mem_pw", memVO.getMem_pw());
      } else {
        hashMap.put("mem_pw", memVO.getMem_pw_new());
      }
      
      if (memVO.getMem_tel().equals(memVO_old.getMem_tel())) {
        hashMap.put("mem_tel", memVO_old.getMem_tel());
      } else {
        if (this.memProc.checkTel(memVO.getMem_tel()) == 0 ) {
          hashMap.put("mem_tel", memVO.getMem_tel());
        } else {
          
        }
      }

      hashMap.put("mem_zip", memVO.getMem_zip());
      hashMap.put("mem_addr1", memVO.getMem_addr1());
      hashMap.put("mem_addr2", memVO.getMem_addr2());
      hashMap.put("mem_no", memVO.getMem_no());
      
      if (mem_pic_size == 0) {
        hashMap.put("mem_pic_name_up", memVO_old.getMem_pic_name_up());
        hashMap.put("mem_pic_th", memVO_old.getMem_pic_th());
        hashMap.put("mem_pic_size", memVO_old.getMem_pic_size());
        System.out.println("기존 프로필 이름: " + memVO_old.getMem_pic_name_up());
        
      } else {
        hashMap.put("mem_pic_name_up", mem_pic_name_up);
        hashMap.put("mem_pic_th", mem_pic_th);
        hashMap.put("mem_pic_size", mem_pic_size);
      }
      
      int cnt = this.memProc.update(hashMap);

      json.put("cnt", cnt);
      json.put("mem_no", memVO.getMem_no());
      
      
    } else {
      
    }
    

    // json.put(key, value)

    
    return json.toString();
    
  }

  

  
  /**
   * 패스워드 변경 폼
   * @param mem_no
   * @return
   */
  @RequestMapping(value="/mem/update_pw.do", method=RequestMethod.GET)
  public ModelAndView update_pw(int mem_no){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mem/update_pw");
    
    return mav;
  }
  
  

  /**
   * 패스워드 확인
   * @param mem_pw
   * @param request
   * @return
   */
 @ResponseBody 
 @RequestMapping(value="/mem/check_pw.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
 public String check_pw (String mem_pw, int mem_no, HttpServletRequest request) {
   
   System.out.println("mem_no: " + mem_no);
   System.out.println("mem_pw: " + mem_pw);
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("mem_no", mem_no);
   hashMap.put("mem_pw", mem_pw);
   
   int cnt = this.memProc.check_pw(hashMap);
   
   JSONObject json= new JSONObject();
   json.put("cnt", cnt);
   
   return json.toString();
 }
  
  
  /**
   * 패스워드 변경 처리
   * @param mem_no 회원 번호
   * @param current_passwd 현재 패스워드
   * @param new_passwd 새로운 패스워드
   * @return
   */
  @RequestMapping(value="/mem/update_pw.do", method=RequestMethod.POST)
  public ModelAndView update_pw ( int mem_no, String current_passwd, String new_passwd ) {
    ModelAndView mav = new ModelAndView();
    
    // 현재 패스워드 검사
    // HashMap: Getter, Setter 없이 일시적으로 Key:Value 요소를 가져올 수 있음
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("mem_no", mem_no);
    hashMap.put("mem_pw", current_passwd);
    
    int cnt = memProc.check_pw(hashMap); // 현재 패스워드 일치 여부
    int update_cnt = 0; // 변경된 패스워드 수
    
    if (cnt == 1 )  { // 현재 패스워드가 일치하는 경우
      hashMap = new HashMap<Object, Object>();
      
      hashMap.put("mem_pw", new_passwd);
      update_cnt = memProc.update_pw(hashMap); // 패스워드 변경
      mav.addObject ("update_cnt", update_cnt); // 변경된 레코드 갯수 저장
    }
    
    mav.addObject ("cnt", cnt);
    // mav.addObject ("url", "passwd_update_msg");
    
    // mav.setViewName("redirect:/mem/msg.do"); // 메시지 처리로 redirect
    mav.setViewName("redirect:/mem/list.jsp"); // 메시지 처리로 redirect
    
    return mav;
  }
  
  

  
  

  
  /**
   * 삭제 처리
   * @param request
   * @param mem_no
   * @return
   */
  
  // http://localhost:9090/team3/mem/delete.do
  @ResponseBody 
  @RequestMapping(value="/mem/delete.do", method=RequestMethod.POST)
  public String delete_proc(HttpServletRequest request, int mem_no) {
    
    JSONObject json= new JSONObject();

    
    // 삭제할 파일 정보
    MemVO memVO = this.memProc.read(mem_no);
    
    // 디스크에서 프로필 사진 삭제
    String upDir = Tool.getRealPath(request, "/mem/storage"); 
    Tool.deleteFile(upDir, memVO.getMem_pic_name_up()); 
    Tool.deleteFile(upDir, memVO.getMem_pic_th()); 
    
    // DBMS에서 삭제
    this.mem_wishProc.delete_by_mem_no(mem_no); // mem_wish 삭제
    // this.mem_hisProc.delete_by_mem_no(mem_no); // mem_his 삭제
    int cnt = this.memProc.delete(mem_no);
    
    json.put("cnt", cnt);
    
    return json.toString();

  }
  

  /**
   * 로그인 폼 (쿠키 O)
   * @return
   */
  // http://localhost:9090/ojt/mem/login.do 
  @RequestMapping(value = "/mem/login.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id 저장 변수
    String ck_id_save = ""; // id 저장 여부를 체크
    String ck_passwd = ""; // passwd 저장 변수
    String ck_passwd_save = ""; // passwd 저장 여부를 체크

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        
        cookie = cookies[i]; // 쿠키 객체 추출
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
        
      }
    }
    
    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    
    mav.setViewName("/mem/login_ck_form");
    return mav;
  }
  
  
  /**
   * 로그인 처리  (쿠키 O)
   * @param request  Cookie 읽기에 필요
   * @param response  Cookie 사용에 필요
   * @param session  로그인 정보 메모리에 기록
   * @param id  회원 id
   * @param passwd  회원 password
   * @param id_save  회원 id 쿠키 저장 여부
   * @param passwd_save 회원 mem_pw 쿠키 저장 여부
   * @return
   */
  // http://localhost:9090/ojt/mem/login.do 
  @RequestMapping(value = "/mem/login.do", method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request, HttpServletResponse response, HttpSession session,
                                                 String mem_id, String mem_pw,
                                                 @RequestParam(value="id_save", defaultValue="") String id_save,
                                                 @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("mem_id", mem_id);
    map.put("mem_pw", mem_pw);
    
    
    System.out.println("▶ Controller: ");
    System.out.println("mem_id: " + mem_id);
    System.out.println("mem_pw: " + mem_pw);
    
    int count = this.memProc.login(map);    
        
    if (count == 1) { // 로그인 성공
      System.out.println(mem_id + " 로그인 성공");
      
      MemVO memVO = memProc.readById(mem_id);
      session.setAttribute("mem_no", memVO.getMem_no());
      session.setAttribute("mem_id", mem_id);
      session.setAttribute("mem_name", memVO.getMem_name());
      session.setAttribute("mem_no", memVO.getMem_no());
      
      // -------------------------------------------------------------------
      // mem_id 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id를 저장할 경우
        Cookie ck_id = new Cookie("ck_id", mem_id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
        response.addCookie(ck_id);
        
      } else { // N, mem_id를 저장하지 않는 경우
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
      
      // mem_id를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      
      // -------------------------------------------------------------------
      // Password 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
        Cookie ck_passwd = new Cookie("ck_passwd", mem_pw);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, 패스워드를 저장하지 않을 경우
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // mem_pw를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/mem/login_fail_msg.jsp");
    }
    return mav;
  }
  
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/mem/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/mem/logout_msg.jsp");
    
    return mav;
  }
  
  
  
  /**
   * 결합된 카테고리 그룹별 카테고리 목록 (session 호출)
   * http://localhost:9090/resort/cate/list_index_left.do
   * @param request
   * @return
   */
 @RequestMapping(value="/mem/list_index_left.do", method=RequestMethod.GET)
 public ModelAndView list_index_left(HttpServletRequest request, HttpSession session){
   
   ModelAndView mav = new ModelAndView();
   MemVO memVO = this.memProc.read((int)session.getAttribute("mem_no"));
   
   mav.addObject("mem_no", (int)session.getAttribute("mem_no"));
   mav.addObject("mem_pic_th", memVO.getMem_pic_th());
   mav.addObject("mem_nick", memVO.getMem_nick());
   mav.setViewName("/mem/list_index_left"); // webapp/cate/list_index_left.jsp

   return mav;
 } 

  
  
  


}
