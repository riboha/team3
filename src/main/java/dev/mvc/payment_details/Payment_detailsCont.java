package dev.mvc.payment_details;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.at.At_ProcInter;
import dev.mvc.cart.At_Cart_VO;
import dev.mvc.cart.CartVO;
import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;
import dev.mvc.payment.PaymentProcInter;
import dev.mvc.payment.PaymentVO;

@Controller
public class Payment_detailsCont {
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.payment.PaymentProc")
  private PaymentProcInter paymentProc;
  
  @Autowired
  @Qualifier("dev.mvc.payment_details.Payment_detailsProc")
  private Payment_detailsProcInter payment_detailsProc;
  
  
  
  
  
//http://localhost:9090/team3/cart/read_delete.do
/**
 * 조회 
 * @param cateno 삭제할 카테고리 번호
 * @return
 */
@RequestMapping(value="/payment_details/read.do", method=RequestMethod.GET )
public ModelAndView read_delete(int payment_no, int mem_no) {
  
  ModelAndView mav = new ModelAndView();
  
  PaymentVO paymentVO =this.paymentProc.read(payment_no);
  mav.addObject("paymentVO", paymentVO);
  
  MemVO memVO=this.memProc.read(mem_no);
  mav.addObject("memVO", memVO);
  
  mav.setViewName("/payment_details/read");
  
  return mav; 
}
  
  
  
//@ResponseBody
//@RequestMapping(value="/payment_details/delete.do", method=RequestMethod.POST )
//public String delete(int payment_no) {
//  ModelAndView mav = new ModelAndView();
//  
//  PaymentVO paymentVO =this.paymentProc.read(payment_no);
//  MemVO memVO =this.memProc.read(paymentVO.getMem_no());
//  mav.addObject("memVO", memVO);
//  
//  
//    
//  JSONObject json = new JSONObject();
//  json.put("payment_no", payment_no);
//  json.put("mem_no", memVO);
//  
//  int cnt = this.paymentProc.delete(paymentVO);
//  mav.addObject("cnt", cnt);
//  
//  json.put("cnt", cnt);
//  
//  
//  
//  return json.toString();
//}
  
  


  //ㅇㅇㅇㅇㅇ
@RequestMapping(value="/payment_details/delete.do", method=RequestMethod.POST )
public ModelAndView delete(PaymentVO paymentVO) {
  ModelAndView mav = new ModelAndView();
  
  paymentVO =this.paymentProc.read(paymentVO.getPayment_no());
  
  
  int cnt =this.paymentProc.delete(paymentVO);
  mav.addObject("cnt", cnt); // request에 저장
  
  if (cnt == 1) {
    mav.setViewName("redirect:/payment/list.do?mem_no=1"); // spring 재호출
  } else { 
    mav.setViewName("/payment_details/delete_msg");
  }
  
  return mav;
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
