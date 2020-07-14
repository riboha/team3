package dev.mvc.notice_attachfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Notice_attachfileCont {
  @Autowired
  @Qualifier("dev.mvc.notice_attachfile.Notice_attachfileProc")
  private Notice_attachfileProcInter notice_attachfileProc;

  public Notice_attachfileCont() {
    System.out.println("--> Notice_attachfileCont created.");
  }

  // http://localhost:9090/team3/notice_attachfile/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/create.do", method = RequestMethod.GET)
  public ModelAndView create(int noticeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice_attachfile/create"); // webapp/notice_attachfile/create.jsp

    return mav;
  }

  /**
   * 파일 등록
   * 
   * @param request
   * @param notice_attachfileVO
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Notice_attachfileVO notice_attachfileVO) {

    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int noticeno = notice_attachfileVO.getNoticeno(); // 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0; // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수

    String upDir = Tool.getRealPath(request, "/notice_attachfile/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = notice_attachfileVO.getFnamesMF();
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
        fsize = multipartFile.getSize(); // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명
          fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장

          if (Tool.isImage(fname)) { // 이미지인지 검사
            thumb = Tool.preview(upDir, fupname, 120, 80); // thumb 이미지 생성
          }
        }
        Notice_attachfileVO vo = new Notice_attachfileVO();
        vo.setNoticeno(noticeno);
        vo.setNotice_fname(fname);
        vo.setNotice_fupname(fupname);
        vo.setNotice_thumb(thumb);
        vo.setNotice_fsize(fsize);

        upload_count = upload_count + notice_attachfileProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------

    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("noticeno", notice_attachfileVO.getNoticeno());

    mav.addObject("upload_count", upload_count);
    mav.addObject("noticeno", notice_attachfileVO.getNoticeno());

    mav.setViewName("/notice_attachfile/create_msg"); // /notice_attachfile/create_msg.jsp
    // mav.setViewName("redirect:/notice_attachfile/create_msg.jsp");
    return mav;
  }
}
