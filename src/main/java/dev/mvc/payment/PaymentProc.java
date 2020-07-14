package dev.mvc.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.payment.PaymentProc")
public class PaymentProc implements PaymentProcInter{
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private PaymentDAOInter paymentDAO;

  @Override
  public int create(PaymentVO paymentVO) {
    int cnt = 0;
    cnt = this.paymentDAO.create(paymentVO); 
    return cnt;
  }
  
  @Override
  public List<PaymentVO> list(int mem_no) {
    List<PaymentVO> list =this.paymentDAO.list(mem_no);
    return list;
  }
/*
  @Override
  public List<At_Payment_VO> at_payment_mem_list(int mem_no) {

    List<At_Payment_VO> list = null;
    list = this.paymentDAO.at_payment_mem_list(mem_no);
    return list;
  }

 */
  @Override
  public PaymentVO read(int payment_no) {
    PaymentVO paymentVO =null;
    paymentVO =this.paymentDAO.read(payment_no);
    return paymentVO;
  }

  @Override
  public int delete(PaymentVO paymentVO) {
    int cnt = 0;
    cnt = this.paymentDAO.delete(paymentVO); 
    return cnt;
  }


  

}
