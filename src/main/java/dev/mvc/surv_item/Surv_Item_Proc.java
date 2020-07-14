package dev.mvc.surv_item;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.surv_item.Surv_Item_Proc")
public class Surv_Item_Proc implements Surv_Item_ProcInter {
@Autowired

  private Surv_Item_DAOInter surv_Item_DAO;

  @Override
  public int surv_item_create(Surv_Item_VO surv_Item_VO) {
    int cnt = this.surv_Item_DAO.surv_item_create(surv_Item_VO);
    return cnt;
  }

  @Override
  public List<Surv_Item_VO> surv_item_list() {
    List<Surv_Item_VO> surv_item_list = null;
    surv_item_list = this.surv_Item_DAO.surv_item_list();
    
    int cnt = surv_item_list.size();
    for(int i=0; i < cnt; i++) {
    	Surv_Item_VO surv_Item_VO = surv_item_list.get(i);
    }
    return surv_item_list;
  }

  @Override
  public Surv_Item_VO surv_item_read(int surv_item_no) {
    Surv_Item_VO surv_item_VO = this.surv_Item_DAO.surv_item_read(surv_item_no);
    return surv_item_VO;
  }

  @Override
  public Surv_Item_VO surv_item_update(int surv_item_no) {
    Surv_Item_VO surv_Item_VO = this.surv_Item_DAO.surv_item_read(surv_item_no);
    return surv_Item_VO;
  }
  
  @Override
  public int surv_item_update(Surv_Item_VO surv_Item_VO) {
    int cnt = this.surv_Item_DAO.surv_item_update(surv_Item_VO);
    return cnt;
  }

  @Override
  public int surv_item_passwd_check(HashMap hashMap) {
    int passwd_cnt = this.surv_Item_DAO.surv_item_passwd_check(hashMap);
    return passwd_cnt;
  }

  @Override
  public int surv_item_delete(int surv_item_no) {
    int cnt = this.surv_Item_DAO.surv_item_delete(surv_item_no);
    return cnt;
  }

  @Override
  public int surv_itemCnt(int surv_item_no) {
	int cnt = this.surv_Item_DAO.surv_itemCnt(surv_item_no);
	return cnt;
}

}
