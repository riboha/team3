package dev.mvc.notice_attachfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice_attachfile.Notice_attachfileProc")
public class Notice_attachfileProc implements Notice_attachfileProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private Notice_attachfileDAOInter notice_attachfileDAOInter;

  public Notice_attachfileProc() {
    System.out.println("--> Notice_attachfileProc created.");
  }

  @Override
  public int create(Notice_attachfileVO notice_attachfileVO) {
    int cnt = 0;
    cnt = this.notice_attachfileDAOInter.create(notice_attachfileVO);
    return cnt;
  }
}
