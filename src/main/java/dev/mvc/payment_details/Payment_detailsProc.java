package dev.mvc.payment_details;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.payment_details.Payment_detailsProc")
public class Payment_detailsProc implements Payment_detailsProcInter{
  
  @Autowired 
  private Payment_detailsDAOInter payment_detailsDAOInter;

  @Override
  public Payment_detailsVO read(int mem_no) {
    Payment_detailsVO payment_detailsVO =this.payment_detailsDAOInter.read(mem_no);
    return payment_detailsVO;
  }

  @Override
  public int delete(Payment_detailsVO payment_detailsVO) {
    int cnt=this.payment_detailsDAOInter.delete(payment_detailsVO);
    return cnt;  
    }

}
