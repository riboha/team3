package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemDAOInter {
  
  /**
   * 아이디 중복 체크
   * <select id="checkID" resultType="int" parameterType="String">
   * @param mem_id
   * @return
   */
  public int checkID (String mem_id);

  /**
   * 닉네임 중복 체크
   * <select id="checkNick" resultType="int" parameterType="String">
   * @param mem_nick
   * @return
   */
  public int checkNick (String mem_nick);

  /**
   * 핸드폰 번호 중복 체크
   * <select id="checkTel" resultType="int" parameterType="String">
   * @param mem_tel
   * @return
   */
  public int checkTel (String mem_tel);
  
  /**
   * 등록 
   * <select id="create" parameterType="MemVO">
   * @param memVO
   * @return
   */
  public int create (MemVO memVO);
  
  /**
   * 프로필 사진 등록 (수정)
   * <update id="update_pic" parameterType="HashMap">
   * @param hashMap
   * @return
   */
  public int update_pic (HashMap<Object, Object> hashMap);
  
  /**
   * 목록
   * <select id="list" resultType="MemVO">
   * @return
   */
  public List <MemVO> list ();
  
  /**
   * 목록 (상태별)
   * <select id="list_select" parameterType="int" resultType="MemVO">
   * @return
   */
  public List <MemVO> list_select (int mem_sts);

  
  
  /**
   * 검색 + 페이징 목록
   * <xmp> <select id="list_search_paging" parameterType="HashMap" resultType="MemVO"> </xmp>
   * @param map
   * @return
   */
  public List<MemVO> list_search_paging (HashMap<Object, Object> map);
  

  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<Object, Object> hashMap);
   
  
  
  /**
   * 조회 
   * <select id="read" resultType="MemVO">
   * @param mem_no
   * @return
   */
  public MemVO read (int mem_no);
  
  /**
   * 수정
   * <update id="update" parameterType="MemVO">
   * @param memVO
   * @return
   */
  public int update (HashMap<Object, Object> hashMap);
  
  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param mem_no
   * @return
   */
  public int delete (int mem_no);
  
  /**
   * 패스워드 검사
   * <select id="check_pw" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int check_pw (HashMap<Object, Object> hashMap);

  /**
   * 패스워드 수정
   * <update id="update_pw" parameterType="HashMap">
   * @param hashMap
   * @return
   */
  public int update_pw (HashMap<Object, Object> hashMap);
  
  
  /**
   * 전체 레코드 갯수 확인
   * <xmp> <select id="total_count" resultType="int"> </xmp>
   * @return 전체 레코드 갯수
   */
  public int total_count ();
  
  
  
  
  
  
  /**
   * 로그인
   * @param map
   * @return
   */
  public int login (Map<Object, Object> map);
  
  
  /**
   * mem_id 이용 회원 정보 조회
   * @param mem_id
   * @return
   */
  public MemVO readById (String mem_id);
  
  
}
