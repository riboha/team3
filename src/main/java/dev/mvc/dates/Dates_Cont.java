package dev.mvc.dates;

import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Dates_Cont {

  @Autowired
  @Qualifier("dev.mvc.dates.Dates_Proc")
  private Dates_ProcInter dates_Proc;
  
  
  
  
}
