package dev.mvc.at;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.at.At_Proc")
public class At_Proc implements At_ProcInter {

  @Autowired
  private At_DAOInter at_DAO;

  @Override
  public List<At_Img> at_img_list(HashMap map) {

    /*
     * 페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작 1 페이지: nowPage = 1, (1 - 1) * 10
     * --> 0 2 페이지: nowPage = 2, (2 - 1) * 10 --> 10 3 페이지: nowPage = 3, (3 - 1) *
     * 10 --> 20
     */
    int beginOfPage = ((Integer) map.get("nowPage") - 1) * At_Page.RECORD_PER_PAGE;

    // 시작 rownum, 1 페이지: 1, 2 페이지: 11, 3 페이지: 21
    int startNum = beginOfPage + 1;
    // 종료 rownum, 1 페이지: 10, 2 페이지: 20, 3 페이지: 30
    int endNum = beginOfPage + At_Page.RECORD_PER_PAGE;
    /*
     * 1 페이지: WHERE r >= 1 AND r <= 10 2 페이지: WHERE r >= 11 AND r <= 20 3 페이지: WHERE
     * r >= 21 AND r <= 30
     */
    map.put("startNum", startNum);
    map.put("endNum", endNum);

    List<At_Img> list = at_DAO.at_img_list(map);
    return list;
  }
  
  
  @Override
  public List<At_Img> list_main(HashMap map) {

    /*
     * 페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작 1 페이지: nowPage = 1, (1 - 1) * 10
     * --> 0 2 페이지: nowPage = 2, (2 - 1) * 10 --> 10 3 페이지: nowPage = 3, (3 - 1) *
     * 10 --> 20
     */
    int beginOfPage = ((Integer) map.get("nowPage") - 1) * At_Page.RECORD_PER_PAGE;

    // 시작 rownum, 1 페이지: 1, 2 페이지: 11, 3 페이지: 21
    int startNum = beginOfPage + 1;
    // 종료 rownum, 1 페이지: 10, 2 페이지: 20, 3 페이지: 30
    int endNum = beginOfPage + At_Page.RECORD_PER_PAGE;
    /*
     * 1 페이지: WHERE r >= 1 AND r <= 10 2 페이지: WHERE r >= 11 AND r <= 20 3 페이지: WHERE
     * r >= 21 AND r <= 30
     */
    map.put("startNum", startNum);
    map.put("endNum", endNum);

    List<At_Img> list_main = at_DAO.list_main(map);
    return list_main;
  }


  @Override
  public int search_count(HashMap hashmap) {
    int count = at_DAO.search_count(hashmap);
    return count;
  }

  @Override
  public int total_count() {
    int count = at_DAO.total_count();
    return count;
  }

  @Override
  public String pagingBox(String listFile, int at_grp_no, int search_count, int nowPage, String at_name) {
    int totalPage = (int) (Math.ceil((double) search_count / At_Page.RECORD_PER_PAGE)); // 전체 페이지
    int totalGrp = (int) (Math.ceil((double) totalPage / At_Page.PAGE_PER_BLOCK));// 전체 그룹
    int nowGrp = (int) (Math.ceil((double) nowPage / At_Page.PAGE_PER_BLOCK)); // 현재 그룹
    int startPage = ((nowGrp - 1) * At_Page.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작
    int endPage = (nowGrp * At_Page.PAGE_PER_BLOCK); // 특정 그룹의 페이지 목록 종료

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); // #태그명
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{"); // .class명
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
    // str.append("현재 페이지: " + nowPage + " / " + totalPage + " ");

    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page)
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지: 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지: 20
    // 현재 15p에서.. 이전10개로 이동 할 경우 -> 10그룹 기준으로 하여 이동
    int _nowPage = (nowGrp - 1) * At_Page.PAGE_PER_BLOCK;
    if (nowGrp >= 2) {
      str.append("<span class='span_box_1'><A href='" + listFile + "?&at_name=" + at_name + "&nowPage=" + _nowPage
          + "&at_grp_no=" + at_grp_no + "'>이전</A></span>");
    }

    // 중앙의 페이지 목록(쭉 펼쳐지는 부분)
    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) { // 마지막 페이지 넘어갈 경우, 페이지 출력을 종료시킴 ★totatlPage>=1
        break;
      }

      if (nowPage == i) { // 페이지가 현재페이지와 같을 경우의 css
        str.append("<span class='span_box_2'>" + i + "</span>"); // 현재 페이지, 강조
      } else {
        // 현재 페이지가 아닌 페이지로는 바로 이동 가능하도록 링크를 설정 해 둠
        str.append("<span class='span_box_1'><A href='" + listFile + "?at_name=" + at_name + "&nowPage=" + i
            + "&at_grp_no=" + at_grp_no + "'>" + i + "</A></span>");
      }
    }

    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작 페이지 :11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작 페이지 : 21
    _nowPage = (nowGrp * At_Page.PAGE_PER_BLOCK) + 1;
    if (nowGrp < totalGrp) {
      str.append("<span class='span_box_1'><A href='" + listFile + "?&at_name=" + at_name + "&nowPage=" + _nowPage
          + "&at_grp_no=" + at_grp_no + "'>다음</A></span>");
    }
    str.append("</DIV>");

    return str.toString();
  }

  @Override
  public At_VO read(int at_no) {
    At_VO at_VO = this.at_DAO.read(at_no);
    return at_VO;
  }

  @Override
  public int create(At_Dates_Img at_Dates_Img) {
    int cnt = this.at_DAO.create(at_Dates_Img);
    return cnt;
  }

  @Override
  public int delete(int at_no) {
    int cnt = this.at_DAO.delete(at_no);
    return cnt;
  }

  @Override
  public int update(At_Dates_Img at_Dates_Img) {
    int cnt = this.at_DAO.update(at_Dates_Img);
    return cnt;
  }

}
