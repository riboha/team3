package dev.mvc.at_grp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.at_grp.At_grp_Proc")
public class At_grp_Proc implements At_grp_ProcInter {

  @Autowired
  private At_grp_DAOInter at_grp_DAO;

  @Override
  public int create(At_grp_VO at_grp_VO) {
    int cnt = this.at_grp_DAO.create(at_grp_VO);
    return cnt;
  }
  

  @Override
  public int count() {
   int count = this.at_grp_DAO.count();
    return count;
  }

  

  @Override
  public List<At_grp_VO> list_by_at_grp_paging(HashMap<String, Object> map) {
    
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * At_grp.RECORD_PER_PAGE;
   
    // 시작 rownum, 1 페이지: 1, 2 페이지: 11, 3 페이지: 21 
    int startNum = beginOfPage + 1; 
    //  종료 rownum, 1 페이지: 10, 2 페이지: 20, 3 페이지: 30
    int endNum = beginOfPage + At_grp.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<At_grp_VO> list = this.at_grp_DAO.list_by_at_grp_paging(map);   
    return list;
  
  }
  
  

  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호 
   * @param count  레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  @Override
  public String pagingBox(String listFile, int count,int nowPage){ 
    
    int totalPage = (int)(Math.ceil((double)count/At_grp.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/At_grp.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/At_grp.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * At_grp.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * At_grp.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
    
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); //#태그명
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); //.class명
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
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page) 
    // nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지: 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지: 20
    // 현재 15p에서.. 이전10개로 이동 할 경우 -> 10그룹 기준으로 하여 이동
    int _nowPage = (nowGrp-1) * At_grp.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      
      str.append("<span class='span_box_1'><A href='"+listFile+"&nowPage="+_nowPage+"'>이전</A></span>"); 
    } 
    
    //중앙의 페이지 목록(쭉 펼쳐지는 부분)
    System.out.println("startPage" + startPage + "endPage" + endPage + "nowPage" + nowPage);
    for(int i=startPage; i<=endPage; i++){ 
      System.out.println("실행확인----->" + startPage+"//" + endPage);
      if (i > totalPage){ //마지막 페이지 넘어갈 경우, 페이지 출력을 종료시킴 ★totatlPage>=1
        break; 
      } 
  
      if (nowPage == i){ //페이지가 현재페이지와 같을 경우의 css
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지로는 바로 이동 가능하도록 링크를 설정 해 둠
        str.append("<span class='span_box_1'><A href='"+listFile+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의  시작 페이지 :11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의  시작 페이지 : 21
    _nowPage = (nowGrp * At_grp.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"&nowPage="+_nowPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  
  
  @Override
  public List<At_grp_VO> list_seq_asc() {
    List<At_grp_VO> list_seq_asc = this.at_grp_DAO.list_seq_asc();
    return list_seq_asc;
  }

  @Override
  public int update_seqno_up(int at_grp_no) {
    int cnt = this.at_grp_DAO.update_seqno_up(at_grp_no);
    return cnt;
  }

  @Override
  public int update_seqno_down(int at_grp_no) {
    int cnt = this.at_grp_DAO.update_seqno_down(at_grp_no);
    return cnt;
  }

  @Override
  public At_grp_VO read(int at_grp_no) {
    At_grp_VO at_grp_VO = this.at_grp_DAO.read(at_grp_no);
    return at_grp_VO;
  }

  @Override
  public int update(At_grp_VO at_grp_VO) {
    int cnt = this.at_grp_DAO.update(at_grp_VO);
    return cnt;
  }

  @Override
  public int delete(int at_grp_no) {
    int cnt = this.at_grp_DAO.delete(at_grp_no);
    return cnt;
  }

  @Override
  public int update_visible(At_grp_VO at_grp_VO) {

    if (at_grp_VO.getAt_grp_visible().toUpperCase().equals("Y")) {
      at_grp_VO.setAt_grp_visible("N");
    } else {
      at_grp_VO.setAt_grp_visible("Y");
    }
    
    int cnt = this.at_grp_DAO.update_visible(at_grp_VO);
    return cnt;
  }






}
