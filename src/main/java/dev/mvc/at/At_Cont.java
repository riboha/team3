package dev.mvc.at;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import dev.mvc.at_grp.At_grp_ProcInter;
import dev.mvc.at_grp.At_grp_VO;

import dev.mvc.at.At_Dates_Img;
import dev.mvc.at_img.At_Img_ProcInter;

import dev.mvc.dates.Dates_Cnt;
import dev.mvc.dates.Dates_ProcInter;
import dev.mvc.payment.PaymentProcInter;
import dev.mvc.payment.PaymentVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class At_Cont {

  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;

  @Autowired
  @Qualifier("dev.mvc.at_grp.At_grp_Proc")
  private At_grp_ProcInter at_grp_Proc;

  @Autowired
  @Qualifier("dev.mvc.dates.Dates_Proc")
  private Dates_ProcInter dates_Proc;

  @Autowired
  @Qualifier("dev.mvc.at_img.At_Img_Proc")
  private At_Img_ProcInter at_Img_Proc;

  /**
   * 목록 + 검색 + 페이징 지원 http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=17&word=스위스&nowPage=1
   * 
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/at/list.do", method = RequestMethod.GET)
  public ModelAndView at_img_list(@RequestParam(value = "at_grp_no", defaultValue = "1") int at_grp_no,
      @RequestParam(value = "at_name", defaultValue = "") String at_name,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {

    ModelAndView mav = new ModelAndView();
    // /contents/list_by_cateno_search_paging.jsp

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>(); // proc에서 만든 map 공유(startnum, endnum+ 여기 3개)
    map.put("at_grp_no", at_grp_no);
    map.put("at_name", at_name);
    map.put("nowPage", nowPage);
    // map.put("dates_date", dates_date);

    // 검색 목록
    List<At_Img> at_img_list = at_Proc.at_img_list(map);
    mav.addObject("at_img_list", at_img_list);

    // 검색된 레코드 갯수
    int search_count = at_Proc.search_count(map);
    mav.addObject("search_count", search_count);

    At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
    List<At_grp_VO> list = at_grp_Proc.list_by_at_grp_paging(map);
    mav.addObject("list", list);
    mav.addObject("at_grp_VO", at_grp_VO);

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

    String paging = at_Proc.pagingBox("list.do", at_grp_no, search_count, nowPage, at_name);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/at/list");
    return mav;
  }

  /// ** 디폴트 리스트
  // * @param at_grp_no
  // * @param at_name
  // * @param nowPage
  // * @return
  // */
  // @RequestMapping(value = "/at/list_main.do", method = RequestMethod.POST)
  // public ModelAndView list_main(
  // @RequestParam(value = "at_grp_no", defaultValue = "1") int at_grp_no,
  // @RequestParam(value = "at_name", defaultValue = "") String at_name,
  // @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
  //
  // ModelAndView mav = new ModelAndView();
  // // /contents/list_by_cateno_search_paging.jsp
  //
  // // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
  // HashMap<String, Object> map = new HashMap<String, Object>(); // proc에서 만든 map
  /// 공유(startnum, endnum+ 여기 3개)
  // map.put("at_grp_no", at_grp_no);
  // map.put("at_name", at_name);
  // map.put("nowPage", nowPage);
  //
  // // 검색 목록
  // List<At_Img> at_img_list = at_Proc.at_img_list(map);
  // mav.addObject("at_img_list", at_img_list);
  //
  // // 검색된 레코드 갯수
  // int search_count = at_Proc.search_count(map);
  // mav.addObject("search_count", search_count);
  //
  // At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
  // List<At_grp_VO> list = at_grp_Proc.list_by_at_grp_paging(map);
  // mav.addObject("list", list);
  // mav.addObject("at_grp_VO", at_grp_VO);
  //
  // /*
  // * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
  // * 18 19 20 [다음]
  // *
  // * @param listFile 목록 파일명
  // *
  // * @param cateno 카테고리번호
  // *
  // * @param search_count 검색(전체) 레코드수
  // *
  // * @param nowPage 현재 페이지
  // *
  // * @param word 검색어
  // *
  // * @return 페이징 생성 문자열
  // */
  //
  // String paging = at_Proc.pagingBox("list.do", at_grp_no, search_count,
  /// nowPage, at_name);
  // mav.addObject("paging", paging);
  // mav.addObject("nowPage", nowPage);
  //
  // mav.setViewName("/at/list");
  // return mav;
  // }
  //

  /**
   * 조회
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/at/read.do", method = RequestMethod.GET)
  public ModelAndView read(int at_no, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    At_VO at_VO = this.at_Proc.read(at_no);
    mav.addObject("at_VO", at_VO);
    
    // int mem_no = (int)session.getAttribute("mem_no");

    List<Dates_Cnt> list = this.dates_Proc.total_dates_cnt(at_no);
    List<At_Dates_Img> list_img = this.at_Img_Proc.read(at_no);

    // System.out.println(list.size());
    mav.addObject("list", list);
    mav.addObject("list_img", list_img);
    mav.setViewName("/at/read");

    return mav;
  }

  /**
   * 예약
   * 
   */
  @ResponseBody
  @RequestMapping(value = "/at/book.do", method = RequestMethod.POST)
  public String book(int at_no, int book, String dates_date) {

    HashMap<Object, Object> map = new HashMap<Object, Object>(); // proc에서 만든 map 공유(startnum, endnum+ 여기 3개)
    map.put("at_no", at_no);
    map.put("dates_date", dates_date);

    int now_stock = this.dates_Proc.specific_dates_cnt(map);

    int no_book = 0; // 예약불가 확인 변수
    int cnt = 0; // 예약 확인 변수

    if (now_stock == 0 || now_stock < book) { // 예약불가능한 경우
      no_book = no_book + 1;

    } else { // 예약 가능한 경우
      for (int i = 1; i <= book; i++) {
        cnt = this.dates_Proc.delete(map); // 재고 삭제
      }
    }

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("no_book", no_book);
    return json.toString();
  }

  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/at/create.do", method = RequestMethod.GET)
  public ModelAndView create(int at_grp_no) {
    ModelAndView mav = new ModelAndView();

    At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
    mav.addObject("at_grp_VO", at_grp_VO);
    mav.setViewName("/at/create");
    return mav;
  }

  /**
   * 등록처리 (at, dates)
   * 
   * @param at_dates
   * @param stock
   * @return
   */

  @ResponseBody
  @RequestMapping(value = "/at/create.do", method = RequestMethod.POST)
  public String create(At_Dates_Img at_Dates_Img, int stock, HttpServletRequest request) {

    this.at_Proc.create(at_Dates_Img);

    int cnt = 0;
    for (int i = 1; i <= stock; i++) {
      cnt = cnt + this.dates_Proc.create(at_Dates_Img);
    }

    // 파일등록
    String at_img_fname = ""; // 원본 파일명
    String at_img_fupname = ""; // 업로드된 파일명
    String at_img_thumb = "";
    long at_img_size = 0;
    String upDir = Tool.getRealPath(request, "/at/storage");// 절대 경로
    List<MultipartFile> fnamesMF = at_Dates_Img.getFnamesMF(); // 실 파일 개수와 상관없이 <input type="file">의 갯수만큼 잡힘

    long count = fnamesMF.stream().filter(t -> t.getSize() > 0).count();
    System.out.println("파일갯수:" + count);
    if (count > 0) {// 전송파일 있는지
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        at_img_size = multipartFile.getSize(); // 파일 크기
        if (at_img_size > 0) { // 파일 크기 체크(정상 파일 확인)
          at_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명
          System.out.println("원본 파일명: " + at_img_fname);
          at_img_fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장 후 업로드 된 파일명 리턴
          System.out.println("업로드 파일명: " + at_img_fupname);
          if (Tool.isImage(at_img_fname)) { // 이미지인지 검사
            at_img_thumb = Tool.preview(upDir, at_img_fupname, 120, 80); // thumb 이미지 생성 후 파일명 리턴 됨(width height 순)
            System.out.println("썸네일 파일명: " + at_img_thumb);
          }

          at_Dates_Img.setAt_img_fname(at_img_fname);
          at_Dates_Img.setAt_img_fupname(at_img_fupname);
          at_Dates_Img.setAt_img_thumb(at_img_thumb);
          at_Dates_Img.setAt_img_size(at_img_size);

          this.at_Img_Proc.create(at_Dates_Img);
        }

      }
    }

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * 삭제처리
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at/delete.do", method = RequestMethod.POST)
  public String delete(HttpServletRequest request, int at_no) {

    // 파일 삭제
    List<At_Dates_Img> list_img = this.at_Img_Proc.read(at_no);
    if (!list_img.isEmpty()) {

      while (list_img.size() == 0) {
        At_Dates_Img at_Dates_Img = this.at_Img_Proc.read_row(at_no);
        String upDir = Tool.getRealPath(request, "/at/storage");
        Tool.deleteFile(upDir, at_Dates_Img.getAt_img_fupname());
        Tool.deleteFile(upDir, at_Dates_Img.getAt_img_thumb());
      }
    }

    this.at_Img_Proc.delete(at_no); // 파일삭제
    int cnt = this.at_Proc.delete(at_no); // 상품삭제
    // System.out.println(cnt);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * 수정폼
   * 
   * @param at_grp_no
   *          대상 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/at/update.do", method = RequestMethod.GET)
  public ModelAndView update(int at_no) {
    ModelAndView mav = new ModelAndView();

    At_VO at_VO = this.at_Proc.read(at_no);
    List<Dates_Cnt> list = this.dates_Proc.total_dates_cnt(at_no);
    Dates_Cnt dates_Cnt = this.dates_Proc.total_dates_cnt_for_update(at_no);
    mav.addObject("at_VO", at_VO);
    mav.addObject("list", list);
    mav.addObject("dates_Cnt", dates_Cnt);
    mav.setViewName("/at/update");

    return mav;
  }

  /**
   * 수정처리
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at/update.do", method = RequestMethod.POST)
  public String update(At_Dates_Img at_Dates_Img, int stock, HttpServletRequest request) {

    HashMap<Object, Object> map = new HashMap<Object, Object>(); // proc에서 만든 map 공유(startnum, endnum+ 여기 3개)
    map.put("at_no", at_Dates_Img.getAt_no());
    map.put("dates_date", at_Dates_Img.getDates_date());

    // 현 재고 확인
    int now_stock = this.dates_Proc.specific_dates_cnt(map);

    if (now_stock == 0) { // 현 재고 0일 경우

      // 새로운 날짜 재고 신규 등록 --> 신규 상품등록이 되는게 아니라, 기존 상품 테이블은 그대로, at_no=1에 대해 dates_date
      // 입력 수량만큼 row 만큼 삽입

      for (int i = 1; i <= stock; i++) {
        this.dates_Proc.add(at_Dates_Img);
      }

    } else {

      int cha = stock - now_stock;

      // 재고(dates테이블)의 추가, 삭제
      if (cha > 0) {

        for (int i = 1; i <= cha; i++) {
          this.dates_Proc.add(at_Dates_Img); // 재고 추가
        }
      } else if (cha < 0) {
        cha = -cha;

        for (int i = 1; i <= cha; i++) {
          this.dates_Proc.delete(map); // 재고 삭제
        }
      }
    }
    // 상품 상세 수정

    int cnt = this.at_Proc.update(at_Dates_Img);

    // 이미지 삭제 후 새로등록

    // 파일 삭제
    this.at_Img_Proc.delete(at_Dates_Img.getAt_no());
    // 파일등록
    String at_img_fname = ""; // 원본 파일명
    String at_img_fupname = ""; // 업로드된 파일명
    String at_img_thumb = "";
    long at_img_size = 0;
    String upDir = Tool.getRealPath(request, "/at/storage");// 절대 경로
    List<MultipartFile> fnamesMF = at_Dates_Img.getFnamesMF(); // 실 파일 개수와 상관없이 <input type="file">의 갯수만큼 잡힘

    long count = fnamesMF.stream().filter(t -> t.getSize() > 0).count();
    System.out.println("파일갯수:" + count);
    if (count > 0) {// 전송파일 있는지
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        at_img_size = multipartFile.getSize(); // 파일 크기
        if (at_img_size > 0) { // 파일 크기 체크(정상 파일 확인)
          at_img_fname = multipartFile.getOriginalFilename(); // 원본 파일명
          System.out.println("원본 파일명: " + at_img_fname);
          at_img_fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장 후 업로드 된 파일명 리턴
          System.out.println("업로드 파일명: " + at_img_fupname);
          if (Tool.isImage(at_img_fname)) { // 이미지인지 검사
            at_img_thumb = Tool.preview(upDir, at_img_fupname, 120, 80); // thumb 이미지 생성 후 파일명 리턴 됨(width height 순)
            System.out.println("썸네일 파일명: " + at_img_thumb);
          }

          at_Dates_Img.setAt_img_fname(at_img_fname);
          at_Dates_Img.setAt_img_fupname(at_img_fupname);
          at_Dates_Img.setAt_img_thumb(at_img_thumb);
          at_Dates_Img.setAt_img_size(at_img_size);

        }

      }
      this.at_Img_Proc.modify(at_Dates_Img); // 이미지 추가
    }

    JSONObject json = new JSONObject();

    json.put("cnt", cnt);
    return json.toString();
  }

}
