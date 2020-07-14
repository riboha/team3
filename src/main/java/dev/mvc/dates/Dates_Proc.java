package dev.mvc.dates;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.at.At_Dates_Img;

@Component("dev.mvc.dates.Dates_Proc")
public class Dates_Proc implements Dates_ProcInter {
  
  @Autowired Dates_DAOInter dates_DAO;

  @Override
  public List<Dates_Cnt> total_dates_cnt(int at_no) {
    List<Dates_Cnt> list = this.dates_DAO.total_dates_cnt(at_no);
    return list;
  }
  
  @Override
  public Dates_Cnt total_dates_cnt_for_update(int at_no) {
    Dates_Cnt dates_Cnt = this.dates_DAO.total_dates_cnt_for_update(at_no);
    return dates_Cnt;
  }
  
  @Override
  public int specific_dates_cnt(HashMap hashmap) {

    int cnt = this.dates_DAO.specific_dates_cnt(hashmap);
    return cnt;
  }
  
  @Override
  public int create(At_Dates_Img at_Dates_Img) {
    int cnt = this.dates_DAO.create(at_Dates_Img);
    return cnt;
  }
  
  @Override
  public int add(At_Dates_Img at_Dates_Img) {
    int cnt = this.dates_DAO.add(at_Dates_Img);
    return cnt;
  }

  @Override
  public int update(At_Dates_Img at_Dates_Img) {
    int cnt = this.dates_DAO.update(at_Dates_Img);
    return cnt;
  }

  @Override
  public int delete(HashMap hasmap) {
    int cnt = this.dates_DAO.delete(hasmap);
    return cnt;
  }
  
  
}
