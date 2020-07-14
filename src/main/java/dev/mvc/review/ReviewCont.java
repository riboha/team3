package dev.mvc.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mem.MemProcInter;


@Controller
public class ReviewCont {
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  /**
   * ���� ��� ó��
   * @param replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReviewVO reviewVO) {
    
    System.out.println("review/create.do ����");
    
    int count = reviewProc.create(reviewVO);  // Call By Reference
    int review_no = reviewVO.getReview_no();  // Call By Reference������ PK ���� ����
    System.out.println("review_no: " + review_no);
    
    JSONObject json = new JSONObject();
    json.put("count",count);
    json.put("review_no",review_no); // ��ϵ� ���� PK ����
    // System.out.println("��ϵ� replyno: " +replyno );
   
    Mem_ReviewVO mem_ReviewVO = this.reviewProc.read(review_no);
    
    // Ű�� ���� ������ �ڵ����� �����ϱ����Ͽ� ��ü�� 1���̳� ArrayList�� ������.
    ArrayList<Mem_ReviewVO> list = new ArrayList<Mem_ReviewVO>();
    list.add(mem_ReviewVO);
    
    json.put("mem_ReviewVO", list); // Ű�� ���� ������ �ڵ����� ������.
    // {"replyno":136,"count":1,"replyMemberVO":[{"memberno":18,"rdate":"2020-07-10 15:44:19","passwd":"19","replyno":136,"id":"user1","content":"19","contentsno":31}]}
    System.out.println(json.toString());
    return json.toString();     
    
  }
  
  
  /**
   * ���� ��� (ȸ����)
   * @param session
   * @return
   */
  @RequestMapping(value="/review/list_by_mem_no.do", method=RequestMethod.GET)
  public ModelAndView list_by_mem_no(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (memProc.isMember(session)) {
      List<ReviewVO> list = reviewProc.list_by_mem_no((int)session.getAttribute("mem_no"));
      
      mav.addObject("list", list);
      mav.setViewName("/review/list_by_mem_no"); // /webapp/reply/list.jsp
      
    } else {
      mav.setViewName("redirect:/mem/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   * ���� ��� (��ǰ��)
   * @param session
   * @return
   */
  @RequestMapping(value="/review/list_by_at_no.do", method=RequestMethod.GET)
  public ModelAndView list_by_at_no(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (memProc.isMember(session)) {
      List<ReviewVO> list = reviewProc.list_by_mem_no((int)session.getAttribute("mem_no"));
      
      mav.addObject("list", list);
      mav.setViewName("/review/list_by_at_no"); // /webapp/reply/list.jsp
      
    } else {
      mav.setViewName("redirect:/mem/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   * ������ ��ư ����¡ ��� (���� ���̺�)
   * http://localhost:9090/ojt/reply/list_by_contentsno_add_view.do?contentsno=1&replyPage=1
   * @param contentsno (����� �޸���) �θ� ������ ��ȣ
   * @param replyPage ��� ������
   * @return
   */
   
    @ResponseBody
    @RequestMapping(value = "/review/list_by_at_no_join_add_view.do",
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
    public String list_by_at_no_join_add_view (int contentsno, int replyPage) {
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("contentsno", contentsno); 
      map.put("replyPage", replyPage); 
      
      
      List<Mem_ReviewVO> list =  reviewProc.list_by_at_no_join_add_view(map);
      
      JSONObject obj = new JSONObject();
      obj.put("list", list);
      
      return obj.toString(); 
    }
  

}
