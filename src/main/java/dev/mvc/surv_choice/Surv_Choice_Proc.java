package dev.mvc.surv_choice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.surv.Surv_ProcInter;

@Component("dev.mvc.surv_choice.Surv_Choice_Proc")
public class Surv_Choice_Proc implements Surv_Choice_ProcInter {
  @Autowired
  private Surv_Choice_DAOInter surv_Choice_DAO;
  
  @Override
  public int surv_choice_create(Surv_Choice_VO surv_Choice_VO) {
    int cnt = this.surv_Choice_DAO.surv_choice_create(surv_Choice_VO);
    return cnt;
  }

  @Override
  public List<Surv_Item_Choice_VO> surv_choice_list(int surv_item_no) {
    List<Surv_Item_Choice_VO> surv_choice_list = this.surv_Choice_DAO.surv_choice_list(surv_item_no);
    return surv_choice_list;
  }
  
}
