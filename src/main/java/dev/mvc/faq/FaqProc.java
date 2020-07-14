package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.faq.FaqProc")
public class FaqProc implements FaqProcInter {
  @Autowired
  private FaqDAOInter faqDAO;

  @Override
  public int create(FaqVO faqVO) {
    int cnt = 0;
    cnt = this.faqDAO.create(faqVO);
    return cnt;
  }

  @Override
  public List<FaqVO> list_seqno_desc() {
    List<FaqVO> list = this.faqDAO.list_seqno_desc();
    return list;
  }

  @Override
  public FaqVO read(int faqno) {
    FaqVO faqVO = this.faqDAO.read(faqno);
    return faqVO;
  }

  @Override
  public FaqVO update(int faqno) {
    FaqVO faqVO = this.faqDAO.read(faqno);
    return faqVO;
  }

  @Override
  public int update(FaqVO faqVO) {
    int cnt = 0;
    cnt = this.faqDAO.update(faqVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = 0;
    passwd_cnt = this.faqDAO.passwd_check(hashMap);
    return passwd_cnt;
  }

  @Override
  public int delete(int faqno) {
    int cnt = 0;
    cnt = this.faqDAO.delete(faqno);
    return cnt;
  }

  @Override
  public int update_seqno_up(int faqno) {
    int cnt = 0;
    cnt = this.faqDAO.update_seqno_up(faqno);
    return cnt;
  }

  @Override
  public int update_seqno_down(int faqno) {
    int cnt = 0;
    cnt = this.faqDAO.update_seqno_down(faqno);    
    return cnt;
  }


  
}
