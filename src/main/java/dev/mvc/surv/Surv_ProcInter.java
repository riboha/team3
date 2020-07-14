package dev.mvc.surv;

import java.util.HashMap;
import java.util.List;

public interface Surv_ProcInter {
  /**
   * 설문 등록
   * @param surv_VO
   * @return
   */
  public int surv_create(Surv_VO surv_VO);
  
  
  /**
   * 설문목록
   * @return
   */
  public List<Surv_VO> surv_list();
  
  /**
   * 설문조회
   * @param surv_no
   * @return
   */
  public Surv_VO surv_read(int surv_no);
  
  
  /**
   * 설문 수정 폼
   * @param surv_no
   * @return
   */
  public Surv_VO surv_update(int surv_no);
  
  
  /**
   * 설문 수정처리
   * @param surv_VO
   * @return 처리된 레코드 갯수
   */
  public int surv_update(Surv_VO surv_VO);
  
  /**
   * 설문조사 수정,삭제시 패스워드 체크
   * @param map
   * @return
   */
  public int surv_passwd_check(HashMap hashMap);
  
  /**
   * 설문조사 삭제
   * @param surv_no
   * @return
   */
  public int surv_delete(int surv_no);
}
