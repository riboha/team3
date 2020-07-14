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
  // ���� ���
  public int create(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  // ���� ��ȸ
  public Mem_ReviewVO read(int review_no) {
    Mem_ReviewVO mem_ReviewVO = this.reviewDAO.read(review_no);
    return mem_ReviewVO;
  }

  @Override
  // ���� ��� (��ü)
  public List<ReviewVO> list() {
    List<ReviewVO> list = this.reviewDAO.list();
    return list;
  }

  @Override
  // ���� ��� (��ǰ��)
  public List<ReviewVO> list_by_at_no(int at_no) {
    List<ReviewVO> list = this.reviewDAO.list_by_at_no(at_no);
    return list;
  }

  @Override
  // ���� ��� (ȸ����)
  public List<ReviewVO> list_by_mem_no(int mem_no) {
    List<ReviewVO> list = this.reviewDAO.list_by_mem_no(mem_no);
    return list;
  }

  @Override
  // ���� ���� (��ǰ��)
  public int count_by_at_no(int at_no) {
    int count = this.reviewDAO.count_by_at_no(at_no);
    return count;
  }

  @Override
  // ���� ���� (ȸ����)
  public int count_by_mem_no(int mem_no) {
    int count = this.reviewDAO.count_by_mem_no(mem_no);
    return count;
  }

  @Override
  // ���� ����
  public int update(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.update(reviewVO);
    return cnt;
  }

  @Override
  // ���� ����
  public int delete(int review_no) {
    int cnt = this.reviewDAO.delete(review_no);
    return cnt;
  }

  
  @Override
  // ������ ��ư ����¡ ���� 
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map) {
    
    int record_per_page = 2; // ���������� 2��
    
    // replyPage�� 1���� ����
    int beginOfPage = ((Integer)map.get("reviewPage") - 1) * record_per_page; // ���������� 2��

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // ���������� 2��
    /*
    1 ������: WHERE r >= 1 AND r <= 2
    2 ������: WHERE r >= 3 AND r <= 4
    3 ������: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<Mem_ReviewVO> list = reviewDAO.list_by_at_no_join_add_view(map);
    
    String review_word = "";
    
    // Ư�� ���� ����
    for (Mem_ReviewVO mem_ReviewVO:list) {
      review_word = mem_ReviewVO.getReview_word();
      review_word = Tool.convertChar(review_word);
      mem_ReviewVO.setReview_word(review_word);
    }
    return list;
  }

}
