package dev.mvc.payment;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.at.At_ProcInter;
import dev.mvc.at.At_VO;
import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.CartVO;
import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;
import dev.mvc.payment_details.Payment_detailsProcInter;
import dev.mvc.payment_details.Payment_detailsVO;


@Controller
public class PaymentCont {
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.payment.PaymentProc")
  private PaymentProcInter paymentProc;
  
  @Autowired
  @Qualifier("dev.mvc.payment_details.Payment_detailsProc")
  private Payment_detailsProcInter payment_detailsProc;
  

  public PaymentCont() {
    System.out.println("--> PaymentCont dd");
  }
  
  
  
/**
 * 개별결제 등록폼
 * @param cart_no
 * @return
 */
  @RequestMapping(value="/payment/create.do", method=RequestMethod.GET )
  public ModelAndView create(int cart_no) {
    ModelAndView mav = new ModelAndView();

    CartVO cartVO =this.cartProc.read(cart_no);
    mav.addObject("cartVO", cartVO);
    
    MemVO memVO =this.memProc.read(cartVO.getMem_no());
    mav.addObject("memVO", memVO); 
    
    At_VO at_VO =this.at_Proc.read(cartVO.getAt_no());
    mav.addObject("at_VO", at_VO); 
    
    cartVO.setCart_payment(cartVO.getCart_cnt()*at_VO.getAt_price());
    
    mav.setViewName("/payment/create"); 
    
    return mav; 
  }
  
  
  
  
  /**
   * 개별 결제 처리1
   * @param paymentVO
   * @return
   */
 
@RequestMapping(value="/payment/create.do", method=RequestMethod.POST )
public ModelAndView create(PaymentVO paymentVO) {
  ModelAndView mav = new ModelAndView();
  
  CartVO cartVO =this.cartProc.read(paymentVO.getCart_no());
  mav.addObject("cartVO", cartVO);
  
  MemVO memVO =this.memProc.read(paymentVO.getMem_no());
  mav.addObject("memVO", memVO);
  
  At_VO at_VO =this.at_Proc.read(paymentVO.getAt_no());
  mav.addObject("at_VO", at_VO);
  
  
  paymentVO.setCart_no(paymentVO.getCart_no());
  paymentVO.setAt_no(paymentVO.getAt_no());
  paymentVO.setCart_cnt(cartVO.getCart_cnt()); 
  paymentVO.setAt_price(at_VO.getAt_price());
  paymentVO.setAt_name(at_VO.getAt_name());
  paymentVO.setPayment_way(paymentVO.getPayment_way());
  paymentVO.setPayment_total(at_VO.getAt_price()*cartVO.getCart_cnt());
  
  int cnt = this.paymentProc.create(paymentVO);
  if (cnt>0) {
    int delete_cnt = this.cartProc.delete(cartVO);
    if(delete_cnt >0) {
      System.out.println(paymentVO.getCart_no()+"번 주문완료");
      mav.addObject("paymentVO", paymentVO);
      mav.setViewName("redirect:/payment/list.do?mem_no=1"); 
    }
  }
 // System.out.println(paymentVO.getCart_cnt());
return mav;
  }


/**
 * 선택결제 등록폼
 * @param checkOne
 * @return
 */
@RequestMapping(value="/payment/create_select.do", method=RequestMethod.GET )
public ModelAndView create_select_form(int [] checkOne) {
  ModelAndView mav = new ModelAndView();
  
  int payment_total = 0;
  
  // List<Integer> list_cart_no = List<Integer>;
  
 
  for (int cart_no : checkOne) {
      System.out.println("cart_no :"+cart_no);
      
      CartVO cartVO =this.cartProc.read(cart_no);
      mav.addObject("cartVO", cartVO);
      
      MemVO memVO =this.memProc.read(cartVO.getMem_no()); 
      mav.addObject("memVO", memVO);
      
      At_VO at_VO =this.at_Proc.read(cartVO.getAt_no());
      mav.addObject("at_VO", at_VO);
      
      cartVO.setCart_payment(cartVO.getCart_cnt()*at_VO.getAt_price());  //개당
      
      
      payment_total = payment_total + (int)(cartVO.getCart_payment());
      mav.addObject("payment_total", payment_total);
      
      //paymentVO.setPayment_total(payment_total);
      
      
      
  }
  
    System.out.println("payment_total" + payment_total);
   
    
    mav.setViewName("/payment/create2"); 
    return mav; 
}

/**
 * 선택 결제 처리
 * @param paymentVO
 * @return
 */



  @RequestMapping(value="/payment/create_select.do", method=RequestMethod.POST)
  public ModelAndView create_select(PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();
  
    int payment_total=0;
    
    CartVO cartVO =this.cartProc.read(paymentVO.getCart_no()); 
    mav.addObject("cartVO", cartVO);
    MemVO memVO  =this.memProc.read(paymentVO.getMem_no());
    At_VO at_VO =this.at_Proc.read(paymentVO.getAt_no());
    mav.addObject("at_VO", at_VO);
    
    
    paymentVO.setAt_no(paymentVO.getAt_no()); 
    paymentVO.setMem_no(paymentVO.getMem_no()); 
    paymentVO.setCart_no(paymentVO.getCart_no()); 
    System.out.println(paymentVO.getCart_no());
    
    paymentVO.setPayment_way(paymentVO.getPayment_way()); 
    
    
    paymentVO.setAt_name(at_VO.getAt_name());
    paymentVO.setAt_price(at_VO.getAt_price());
    paymentVO.setCart_cnt(cartVO.getCart_cnt());
    
    cartVO.setCart_payment(at_VO.getAt_price()*cartVO.getCart_cnt());  //개당
    
    payment_total = payment_total + (int)(cartVO.getCart_payment());  //합
    mav.addObject("payment_total", payment_total);
    paymentVO.setPayment_total(payment_total);
  

  
//  paymentVO.getPayment_total();
//  System.out.println(paymentVO.getPayment_total());
  
  
  
  
  //한개만꿰에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㄱ
 
//  int cnt = this.paymentProc.create(paymentVO);
//  mav.addObject("cnt", cnt);
//  System.out.println("cnt : "+cnt);
//  if (cnt>0) {
//    int delete_cnt = this.cartProc.delete(cartVO);
//    if(delete_cnt >0) {
//      System.out.println(paymentVO.getCart_no()+"번 주문완료");
//      mav.setViewName("redirect:/payment/list.do?mem_no=1"); 
//    }
//  }
  
  
  
  
  return mav; 
  }
 





//  @RequestMapping(value="/payment/create_select.do", method=RequestMethod.POST)
//  public ModelAndView create_select(int [] checkOne) { 
//    ModelAndView mav = new ModelAndView(); int payment_total=0;
//  
//  for(int cart_no : checkOne) {
//  
//  
//  CartVO cartVO =this.cartProc.read(cart_no);
//  at_VO at_VO=this.atProc.read(cartVO.getAt_no());
//  
//  
//  PaymentVO paymentVO =new PaymentVO();
//  
//  paymentVO.setMem_no(cartVO.getMem_no());
//  
//  
//  paymentVO.setAt_no(at_VO.getAt_no()); 
//  paymentVO.setAt_name(at_VO.getAt_name());
//  paymentVO.setAt_price(at_VO.getAt_price()); 
//  
//  paymentVO.setCart_cnt(cartVO.getCart_cnt()); 
//  
//  
//  paymentVO.setPayment_way(paymentVO.getPayment_way()); 
//  System.out.println(paymentVO.getPayment_way());
//  
//  
//  cartVO.setCart_payment(cartVO.getCart_cnt()*at_VO.getAt_price());
//  
//  
//  payment_total = payment_total + (int)(cartVO.getCart_payment());
//  paymentVO.setPayment_total(payment_total);
//  
//  int cnt = this.paymentProc.create(paymentVO); 
//    if(cnt == 1) { 
//      int delete_cnt =this.cartProc.delete(cartVO); 
//        if (delete_cnt == 1) {
//            System.out.println(cart_no + " 번 상품 주문 완료"); 
//            }
//        }
//  
//  
//  }
//  
//  System.out.println("payment_total"+payment_total);
//  mav.addObject("payment_total", payment_total);
//  
//  
//  return mav;
//  }
 
 

  
  
  

//http://localhost:9090/team3/payment/list.do?mem_no=1
/**
 * 회원 별 주문 목록
 * @return
 */
@RequestMapping(value="/payment/list.do", method=RequestMethod.GET )
public ModelAndView paymentlist(int mem_no) {
  ModelAndView mav = new ModelAndView();

  MemVO memVO = this.memProc.read(mem_no); 
  
  
  List<PaymentVO> list = this.paymentProc.list(mem_no);
  
  Payment_detailsVO payment_detailsVO =this.payment_detailsProc.read(mem_no);
  
  mav.addObject("memVO", memVO);  
  mav.addObject("list", list);
  mav.addObject("payment_detailsVO", payment_detailsVO);  
    
  
  mav.setViewName("/payment/list");

  
  return mav;
  
}


/**
 * 결제내역 삭제 
 * @param payment_no
 * @return
 */


@RequestMapping(value="/payment/delete.do", method=RequestMethod.POST )
public ModelAndView delete(int payment_no) {
  ModelAndView mav =new ModelAndView();
  
  PaymentVO paymentVO =this.paymentProc.read(payment_no);
  mav.addObject("paymentVO", paymentVO);
  
  MemVO memVO =this.memProc.read(paymentVO.getMem_no());
  mav.addObject("memVO", memVO);
   
  int cnt = this.paymentProc.delete(paymentVO);
  if (cnt == 1) {
    mav.setViewName("/payment/delete_msg"); // spring 재호출
  } else { 
    mav.setViewName("/payment/delete_msg"); // webapp/cate/delete_msg.jsp
  }
  
  
  
  return mav;
}

  

  
  
}

