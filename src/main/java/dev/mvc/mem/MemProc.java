package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.mem.MemProc")
public class MemProc implements MemProcInter{
  
  @Autowired
  private MemDAOInter memDAO;

  @Override
  // 아이디 중복 체크
  public int checkID(String mem_id) {
    int cnt = this.memDAO.checkID(mem_id);
    return cnt;
  }
  
  @Override
  // 닉네임 중복 체크
  public int checkNick(String mem_nick) {
    int cnt = this.memDAO.checkNick(mem_nick);
    return cnt;
  }
  
  @Override
  // 핸드폰 번호 중복 체크
  public int checkTel(String mem_tel) {
    int cnt = this.memDAO.checkTel(mem_tel);
    return cnt;
  }

  @Override
  // 등록
  public int create(MemVO memVO) {
    int cnt = this.memDAO.create(memVO);
    return cnt;
  }
  
  @Override
  // 프로필 사진 등록 (수정)
  public int update_pic(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.update_pic(hashMap);
    return cnt;
  }

  @Override
  // 목록
  public List<MemVO> list() {
    List<MemVO> list = this.memDAO.list();
    return list;
  }

  
  @Override
  // 목록 (상태별)
  public List<MemVO> list_select(int mem_sts) {
    List<MemVO> list = this.memDAO.list_select(mem_sts);
    return list;
  }

  
  @Override
  // 조회
  public MemVO read(int mem_no) {
    MemVO memVO = this.memDAO.read(mem_no);
    return memVO;
  }

  @Override
  // 수정
  public int update(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.update(hashMap);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int mem_no) {
    int cnt = this.memDAO.delete(mem_no);
    return cnt;
  }

  @Override
  // 패스워드 검사
  public int check_pw(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.check_pw(hashMap);
    return cnt;
  }

  @Override
  // 패스워드 수정
  public int update_pw(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.update_pw(hashMap);
    return cnt;
  }

  
  
  @Override
  // 검색 + 페이징 목록
  public List<MemVO> list_search_paging(HashMap<Object, Object> map) {
    
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Mem.RECORD_PER_PAGE;
   
    // 시작 rownum
    // 1 페이지: 0 +1
    // 2 페이지: 10 + 1  
    // 3 페이지: 20 + 1 
    int startNum = beginOfPage + 1; 
    
    //  종료 rownum
    // 1 페이지: 0 + 10  
    // 2 페이지: 0 + 20 
    // 3 페이지: 0 + 30
    int endNum = beginOfPage + Mem.RECORD_PER_PAGE;   
    
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<MemVO> list = memDAO.list_search_paging(map);
    
    // --------------------------------------------------------------
    // 제목, 내용 글자수 조정
    // --------------------------------------------------------------
//    String title = "";
//    String content = "";
//    for (MemVO memVO: list) {
//      title = memVO.getTitle();
//      if (title.length() >= 14) {
//        title = Tool.textLength(title, 14);
//        memVO.setTitle(title);
//      }
//      content = memVO.getContent();
//      if (content.length() >= 100) {
//        content = Tool.textLength(content, 100);
//        memVO.setContent(content);
//      }
//    }
    // --------------------------------------------------------------   
    
    return list;
  }

  
  // Paging Box
  /** 
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
  @Override
  public String pagingBox (String listFile, int search_count, int nowPage, String word) {
    
    int totalPage = (int)(Math.ceil ((double) search_count/Mem.RECORD_PER_PAGE));  // 전체 페이지  
    int totalGrp = (int)(Math.ceil ((double)totalPage/Mem.PAGE_PER_BLOCK));              // 전체 그룹 
    int nowGrp = (int)(Math.ceil ((double)nowPage/Mem.PAGE_PER_BLOCK));               // 현재 그룹 
    int startPage = ((nowGrp - 1) * Mem.PAGE_PER_BLOCK) + 1;                                   // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Mem.PAGE_PER_BLOCK);                                                 // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    // ↓'id=paging'인 태그
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
    // str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    
    // ▶ 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 (10)
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 (20)
    
    int _nowPage = (nowGrp-1) * Mem.PAGE_PER_BLOCK;  
    
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+">이전</A></span>"); 
    } 
 
    
    // ▶중앙에 위치할 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      
      if (i > totalPage){ // 마지막 페이지를 넘어가면 종료
        break; 
      } 
  
      if (nowPage == i){ // 페이지가 현재 페이지와 같은 경우 CSS 강조, 링크 X
        str.append("<span class='span_box_2'>"+i+"</span>"); 
      }else{
        // 현재 페이지가 아닌 페이지, 링크 O
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
      
    } 
 
    
    // ▶ 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작 페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작 페이지 21
    _nowPage = (nowGrp * Mem.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+">다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 

  
  
  
  
  // 카테고리별 검색 레코드 갯수
  @Override
  public int search_count(HashMap<Object, Object> hashMap) {
    int count = memDAO.search_count(hashMap);
    return count;
  }

  
  @Override
  // 로그인
  public int login(Map<Object, Object> map) {
    int cnt = this.memDAO.login(map);
    return cnt;
  }

  
  @Override
  // mem_id 이용 회원 정보 조회
  public MemVO readById(String mem_id) {
    MemVO memVO = this.memDAO.readById(mem_id);
    return memVO;
  }
  
  
  @Override
  // 로그인된 회원 계정인지 검사
  public boolean isMember(HttpSession session){
    boolean sw = false; // 기본 설정: 로그인 X
    String mem_id = (String)session.getAttribute("mem_id");
    
    if (mem_id != null){
      sw = true; // 로그인 한 경우
    }
    return sw; 
  }







}
