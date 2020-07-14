package dev.mvc.team3;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value =  {"/", "/index.do"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index"; // ¢º /resort/index.jsp
	}
	
}
