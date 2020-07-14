package dev.mvc.surv;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.surv.Surv_Proc") 
public class Surv_Proc implements Surv_ProcInter {
  @Autowired
  private Surv_DAOInter surv_DAO;
  
  @Override
  public int surv_create(Surv_VO surv_VO) {
    int cnt = 0;
    cnt = this.surv_DAO.surv_create(surv_VO);
    return cnt;
  }

  @Override
  public List<Surv_VO> surv_list() {
    List<Surv_VO> surv_list = null;
    surv_list = this.surv_DAO.surv_list();
    return surv_list;
  }

  @Override
  public Surv_VO surv_read(int surv_no) {
    Surv_VO surv_VO = null;
    surv_VO = this.surv_DAO.surv_read(surv_no);
    return surv_VO;
  }

  @Override
  public Surv_VO surv_update(int surv_no) {
    Surv_VO surv_VO = this.surv_DAO.surv_read(surv_no);
    return surv_VO;
  }

  @Override
  public int surv_update(Surv_VO surv_VO) {
    int cnt = this.surv_DAO.surv_update(surv_VO);
    return cnt;
  }

  @Override
  public int surv_passwd_check(HashMap hashMap) {
    int passwd_cnt = this.surv_DAO.surv_passwd_check(hashMap);
    return passwd_cnt;
  }

  @Override
  public int surv_delete(int surv_no) {
    int cnt = this.surv_DAO.surv_delete(surv_no);
    return cnt;
  }

}
