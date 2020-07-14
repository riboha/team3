package dev.mvc.at_img;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.at.At_Dates_Img;

@Component("dev.mvc.at_img.At_Img_Proc")
public class At_Img_Proc implements At_Img_ProcInter {
  
  @Autowired At_Img_DAOInter at_Img_DAO;

  @Override
  public int create(At_Dates_Img at_Dates_Img) {
   int cnt = this.at_Img_DAO.create(at_Dates_Img);
    return cnt;
  }
  
  @Override
  public int modify(At_Dates_Img at_Dates_Img) {
    int cnt = this.at_Img_DAO.modify(at_Dates_Img);
    return cnt;
  }


  @Override
  public List<At_Dates_Img> read(int at_no) {
    List<At_Dates_Img> list = this.at_Img_DAO.read(at_no);
    return list;
  }
  
  @Override
  public At_Dates_Img read_row(int at_no) {
    At_Dates_Img at_Dates_Img = this.at_Img_DAO.read_row(at_no);
    return at_Dates_Img;
  }
  

  @Override
  public int delete(int at_no) {
   int cnt = this.at_Img_DAO.delete(at_no);
    return cnt;
  }



}
