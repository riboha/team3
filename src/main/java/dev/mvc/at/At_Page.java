package dev.mvc.at;

public class At_Page {
  
  /** 페이지당 출력할 레코드 갯수 */
  public static int RECORD_PER_PAGE = 3;//여기서 숫자 바꾸면 한 페이지당 레코드 갯수를 조절 할 수 있다.
  
  /** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
  public static int PAGE_PER_BLOCK = 10;
  
  //두 개 이상의 클래스에서 참조할 수 있는 공통 변수
  //외부의 특정 class에 static 선언 후 사용

}
