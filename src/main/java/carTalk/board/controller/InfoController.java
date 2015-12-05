package carTalk.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	@RequestMapping(value="info_info.do")	
	public ModelAndView info(){ 	
				ModelAndView mv=new ModelAndView();
				mv.setViewName("info_info");
	return mv;
	}
}
