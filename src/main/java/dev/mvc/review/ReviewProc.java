package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter{
  
  @Autowired
  private ReviewDAOInter reviewDAO;

  @Override
  // 리뷰 등록
  public int create(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  // 리뷰 조회
  public Mem_ReviewVO read(int review_no) {
    Mem_ReviewVO mem_ReviewVO = this.reviewDAO.read(review_no);
    return mem_ReviewVO;
  }

  @Override
  // 리뷰 목록 (전체)
  public List<ReviewVO> list() {
    List<ReviewVO> list = this.reviewDAO.list();
    return list;
  }

  @Override
  // 리뷰 목록 (상품별)
  public List<ReviewVO> list_by_at_no(int at_no) {
    List<ReviewVO> list = this.reviewDAO.list_by_at_no(at_no);
    return list;
  }

  @Override
  // 리뷰 목록 (회원별)
  public List<ReviewVO> list_by_mem_no(int mem_no) {
    List<ReviewVO> list = this.reviewDAO.list_by_mem_no(mem_no);
    return list;
  }

  @Override
  // 리뷰 갯수 (상품별)
  public int count_by_at_no(int at_no) {
    int count = this.reviewDAO.count_by_at_no(at_no);
    return count;
  }

  @Override
  // 리뷰 갯수 (회원별)
  public int count_by_mem_no(int mem_no) {
    int count = this.reviewDAO.count_by_mem_no(mem_no);
    return count;
  }

  @Override
  // 리뷰 수정
  public int update(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.update(reviewVO);
    return cnt;
  }

  @Override
  // 리뷰 삭제
  public int delete(int review_no) {
    int cnt = this.reviewDAO.delete(review_no);
    return cnt;
  }

  
  @Override
  // 더보기 버튼 페이징 구현 
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map) {
    
    int record_per_page = 2; // 한페이지당 2건
    
    // replyPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("reviewPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<Mem_ReviewVO> list = reviewDAO.list_by_at_no_join_add_view(map);
    
    String review_word = "";
    
    // 특수 문자 변경
    for (Mem_ReviewVO mem_ReviewVO:list) {
      review_word = mem_ReviewVO.getReview_word();
      review_word = Tool.convertChar(review_word);
      mem_ReviewVO.setReview_word(review_word);
    }
    return list;
  }

}
