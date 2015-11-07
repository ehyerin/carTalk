package carTalk.conmmon;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/*@RequestMapping("home.do")
	public String home(){
		logger.info("Home");
		return "home";
	}	
	@RequestMapping("member_findById.do")
	public String findById(){
		return "member_find";
	}*/
	/*
	 * @PathVariable : url 정보를 변수로 할당
	 * 요청받은 매핑정보와 일치하는 메서드가
	 * 별도로 있으면 그 메서드가 실행되고
	 * 없으면 @PathVariable 적용 메서드가 동작된다. 
	 */
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		return viewId;
	}
}















