package dev.mvc.surv_choice;

import java.util.List;

public interface Surv_Choice_DAOInter {
  

  /** 
   * 설문문항등록
   * @param surv_Choice_VO
   * @return
   */
  public int surv_choice_create(Surv_Choice_VO surv_Choice_VO);
  
  /**
   * surv_item_no에 따른 surv_choice list
   * @param surv_item_no
   * @return
   */
  public List<Surv_Item_Choice_VO> surv_choice_list(int surv_item_no);
}
