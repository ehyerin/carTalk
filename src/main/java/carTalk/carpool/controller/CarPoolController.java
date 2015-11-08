package carTalk.carpool.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import carTalk.carpool.model.CarpoolVO;
import carTalk.member.model.MemberVO;

@Controller
public class CarPoolController {
/*	@Resource
	private TalkBoardService talkboardservice;*/
	
	/**카풀 찾기 페이지로 넘어감**/
	@RequestMapping(value="carpool_search_form.do")	
	public String carpoolSearch(String pageNo){ 
		return "carpool_search_form";
	}
	
	@RequestMapping(value="carpool_register.do")	
	public String carpoolRegister(CarpoolVO cvo,HttpServletRequest request){ 
		System.out.println("cvo는?"+cvo);
		HttpSession session = request.getSession(false);
		if(session==null||(MemberVO)session.getAttribute("loginInfo")==null&&(MemberVO)session.getAttribute("admin")==null){
		System.out.println("세션없음");
		}
		MemberVO mvo = (MemberVO)session.getAttribute("loginInfo");
		System.out.println("세션멤버"+mvo);
		
		return "carpool_register_form";
	}

	
}




