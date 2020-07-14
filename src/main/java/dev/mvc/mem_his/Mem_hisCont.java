 package dev.mvc.mem_his;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mem_his.Mem_hisVO;

@Controller
public class Mem_hisCont {
  
  @Autowired
  @Qualifier("dev.mvc.mem_his.Mem_hisProc")
  private Mem_hisProcInter mem_hisProc;
  

  /**
   * 등록 폼
   */
  
  // http://localhost:9090/team3/mem_his/create.do
  @RequestMapping (value = "/mem_his/create.do", method = RequestMethod.GET )
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem_his/create"); // webapp/mem_his/create.jsp
    return mav;
  }
  

  /**
   * 등록 처리
   */
  
  // http://localhost:9090/team3/mem_his/create.do
  @RequestMapping (value = "/mem_his/create.do", method = RequestMethod.POST )
  public ModelAndView create (HttpServletRequest request, Mem_hisVO mem_hisVO) {
    ModelAndView mav = new ModelAndView();
    /*
     * 
     * HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
     * 
     * hashMap.put("mem_pic_name", mem_pic_name); hashMap.put("mem_pic_name_up",
     * mem_pic_name_up); hashMap.put("mem_pic_th", mem_pic_th);
     * hashMap.put("mem_pic_size", mem_pic_size); hashMap.put("mem_id",
     * memVO.getMem_id());
     * 
     * int cnt1 = this.memProc.update_pic(hashMap); System.out.println("cnt" + cnt +
     * "cnt1" + cnt1);
     */    
    mav.setViewName("redirect:/mem/list.do");
    return mav;
  }
   
  
  /**
   * 목록
   */
  
  // http://localhost:9090/team3/mem_his/list.do
  @RequestMapping (value = "/mem_his/list.do", method = RequestMethod.GET )
  public ModelAndView list () {
    ModelAndView mav = new ModelAndView();
    
    List<Mem_hisVO> list = this.mem_hisProc.list();
    mav.addObject("list", list);
    
    System.out.println(list);
    
    mav.setViewName("/mem_his/list"); // webapp/mem_his/list.jsp
    return mav;
  }
  
  
  /**
   * 조회
   */
  
  // http://localhost:9090/team3/mem_his/read.do?mem_no=
  @RequestMapping (value = "/mem_his/read.do", method = RequestMethod.GET )
  public ModelAndView read (int mem_his_no) {
    ModelAndView mav = new ModelAndView(); 
    
    Mem_hisVO mem_hisVO = this.mem_hisProc.read(mem_his_no);
    mav.addObject("list", mem_hisVO);
    
    mav.setViewName("/mem_his/read"); // webapp/mem_his/read.jsp
    return mav;
  }
  
  
  

  /**
   * 수정폼
   */
  
  // http://localhost:9090/team3/mem/update.do?mem_no=
  @RequestMapping (value = "/mem_his/update.do", method = RequestMethod.GET )
  public ModelAndView update (int mem_no) {
    ModelAndView mav = new ModelAndView(); 
    
    Mem_hisVO mem_hisVO = this.mem_hisProc.read(mem_no);
    mav.addObject("mem_hisVO", mem_hisVO);
    
    mav.setViewName("/mem_his/update"); // webapp/mem/read.jsp
    return mav;
  }
  
  
  
  /**
   * 수정 처리
   */
  
  // http://localhost:9090/team3/mem/update.do
  @ResponseBody 
  @RequestMapping(value="/mem_his/update.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  public String update (Mem_hisVO mem_hisVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Mem_hisVO mem_hisVO_old = this.mem_hisProc.read(mem_hisVO.getMem_no());
    
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    
    hashMap.put("mem_his_no", mem_hisVO.getMem_his_no());
    
    

    // int cnt = this.mem_hisProc.update(hashMap);
    
     JSONObject json= new JSONObject();
//    json.put("cnt", cnt);
//    json.put("mem_his_no", mem_hisVO.getMem_his_no());
    
    return json.toString();
  }

  
  

  
  /**
   * 삭제 폼
   */
  
  // http://localhost:9090/team3/mem_his/delete.do
  @RequestMapping(value="/mem_his/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int mem_his_no) {
    ModelAndView mav = new ModelAndView();
    
    Mem_hisVO mem_hisVO = this.mem_hisProc.read(mem_his_no);
    mav.addObject("mem_hisVO", mem_hisVO);
    
    mav.setViewName("/mem_his/delete"); 
    
    return mav;
  }

  
  /**
   * 삭제 처리
   * @param request
   * @param mem_no
   * @return
   */
  
  // http://localhost:9090/team3/mem_his/delete.do
  @RequestMapping(value="/mem_his/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int mem_his_no) {
    ModelAndView mav = new ModelAndView();

    this.mem_hisProc.delete(mem_his_no);

    mav.setViewName("redirect:/mem_his/list.do"); 
    return mav;
  }
  

}
