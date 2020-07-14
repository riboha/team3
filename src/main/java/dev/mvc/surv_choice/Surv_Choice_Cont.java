package dev.mvc.surv_choice;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.surv_item.Surv_Item_ProcInter;
import dev.mvc.surv_item.Surv_Item_VO;

@Controller
public class Surv_Choice_Cont {
  @Autowired
  @Qualifier("dev.mvc.surv_item.Surv_Item_Proc")
  private Surv_Item_ProcInter surv_Item_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.surv_choice.Surv_Choice_Proc")
  
  private Surv_Choice_ProcInter surv_Choice_Proc;
  
  public Surv_Choice_Cont() {
    System.out.println("--> Surv_Choice_Cont created");
  }
  
  /**
   * 설문 항목 등록 폼
   * @return 
   */
  @RequestMapping(value = "/surv_choice/surv_choice_create.do", method = RequestMethod.GET)
    public ModelAndView surv_choice_create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surv_choice/surv_choice_create");
    return mav;
  }
  
  /**
   * 설문 항목 등록 처리
   * @param surv_Choice_VO
   * @return
   */
  @ResponseBody
  @RequestMapping(value ="/surv_choice/surv_choice_create.do", method = RequestMethod.POST)
  	public String surv_choice_create(Surv_Choice_VO surv_Choice_VO) {
	  
	  int cnt = this.surv_Choice_Proc.surv_choice_create(surv_Choice_VO);
	  JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      
	  return json.toString(); 
  }
  
  @RequestMapping(value ="/surv_choice/surv_choice_list.do", method = RequestMethod.GET)
    public ModelAndView surv_choice_list(int surv_item_no) {
    ModelAndView mav = new ModelAndView();
      Surv_Item_VO surv_Item_VO = this.surv_Item_Proc.surv_item_read(surv_item_no);
      mav.addObject("surv_Item_VO",surv_Item_VO);
      
      List<Surv_Item_Choice_VO> surv_choice_list = this.surv_Choice_Proc.surv_choice_list(surv_item_no);
      
      
      return mav;
  }
  
}
