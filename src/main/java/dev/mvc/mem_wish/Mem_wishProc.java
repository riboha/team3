package dev.mvc.mem_wish;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.mem_wish.Mem_wishProc")
public class Mem_wishProc implements Mem_wishProcInter {
  
  @Autowired
  private Mem_wishDAOInter mem_wishDAO;

  @Override
  // 등록
  public int create(Mem_wishVO mem_wishVO) {
    int cnt = this.mem_wishDAO.create(mem_wishVO);
    return cnt;
  }

  
  @Override
  // 목록
  public List<At_Mem_wishVO> list(int mem_no) {
    List<At_Mem_wishVO> list = this.mem_wishDAO.list(mem_no);
    return list;
  }
  
  
  @Override
  // 검색 목록 + 페이징
  public List<At_Mem_wishVO> list_search_paging(HashMap<Object, Object> map) {
    
    System.out.println("Mem_wish Proc 진입");
    
    int mem_no = (Integer)map.get("mem_no");
    String word = (String)map.get("word");
    
    System.out.println("mem_no: " + mem_no);
    System.out.println("word: " + word);

    int nowPage = 0;
    try {
      nowPage = (Integer)map.get("nowPage");
    } catch (NullPointerException e){
      nowPage = 1;
    }
    
    System.out.println("Proc nowPage: " + nowPage);  
    
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    
    // int beginOfPage = ((Integer)map.get("nowPage") - 1) * Mem_wish.RECORD_PER_PAGE;
    int beginOfPage = (nowPage - 1) * Mem_wish.RECORD_PER_PAGE;
   
    // 시작 rownum
    // 1 페이지: 0 +1
    // 2 페이지: 10 + 1  
    // 3 페이지: 20 + 1 
    int startNum = beginOfPage + 1; 
    
    //  종료 rownum
    // 1 페이지: 00 + 10 = 10  
    // 2 페이지: 10 + 10 = 20 
    // 3 페이지: 20 + 10 = 30
    int endNum = beginOfPage + Mem_wish.RECORD_PER_PAGE;   
    
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    
    System.out.println("Proc: startNum: " + startNum);
    System.out.println("Proc: endNum: " + endNum);
    System.out.println("Proc: word: " + map.get("word"));
    System.out.println("Proc: mem_no: " + map.get("mem_no"));
    
    List<At_Mem_wishVO> list = this.mem_wishDAO.list_search_paging(map);
    return list;
  }
  

  
  /** 
   * 페이지 목록 문자열 생성, Box 형태 (※ DAO 호출 X ※)
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  
  @Override
  public String pagingBox (String listFile, int mem_no, int search_count, int nowPage, String word) {
    
    int totalPage = (int)(Math.ceil ((double) search_count/Mem_wish.RECORD_PER_PAGE));  // 전체 페이지  
    int totalGrp = (int)(Math.ceil ((double)totalPage/Mem_wish.PAGE_PER_BLOCK));              // 전체 그룹 
    int nowGrp = (int)(Math.ceil ((double)nowPage/Mem_wish.PAGE_PER_BLOCK));               // 현재 그룹 
    int startPage = ((nowGrp - 1) * Mem_wish.PAGE_PER_BLOCK) + 1;                                   // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Mem_wish.PAGE_PER_BLOCK);                                                 // 특정 그룹의 페이지 목록 종료   
     
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
    
    int _nowPage = (nowGrp-1) * Mem_wish.PAGE_PER_BLOCK;  
    
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&mem_no="+mem_no+"'>이전</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"&mem_no="+mem_no+"'>"+i+"</A></span>");   
      } 
      
    } 
 
    
    // ▶ 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작 페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작 페이지 21
    _nowPage = (nowGrp * Mem_wish.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&mem_no="+mem_no+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 

  
  
  @Override
  // 검색 레코드 갯수
  public int search_count(HashMap<Object, Object> hashMap) {
    int count = mem_wishDAO.search_count(hashMap);
    return count;
  }
  
  

  @Override
  // 조회
  public At_Mem_wishVO read(int mem_wish_no) {
    At_Mem_wishVO at_Mem_wishVO = this.mem_wishDAO.read(mem_wish_no);
    return at_Mem_wishVO;
  }

  @Override
  // 수정
  public int update(Mem_wishVO mem_wishVO) {
    int cnt = this.mem_wishDAO.update(mem_wishVO);
    return cnt;
  }

  @Override
  // 삭제
  public int delete(int mem_wish_no) {
    int cnt = this.mem_wishDAO.delete(mem_wish_no);
    return cnt;
  }

  @Override
  // 회원별 삭제
  public int delete_by_mem_no(int mem_no) {
    int cnt = this.mem_wishDAO.delete_by_mem_no(mem_no);
    return cnt;
  }



}
