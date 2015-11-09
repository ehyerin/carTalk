package carTalk.carpool.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import carTalk.carpool.model.CarpoolService;
import carTalk.carpool.model.CarpoolVO;
import carTalk.member.model.MemberVO;

@Controller
public class CarPoolController {
	@Resource
	private CarpoolService carpoolservice;
	
	/**카풀 찾기 페이지로 넘어감**/
	@RequestMapping(value="carpool_search_form.do")	
	public String carpoolSearch(String pageNo){ 
		return "carpool_search_form";
	}
	
	@RequestMapping(value="carpool_register.do")	
	public String carpoolRegister(CarpoolVO cvo,HttpServletRequest request){ 
		HttpSession session = request.getSession(false);
		MemberVO mvo=null;
		if((MemberVO)session.getAttribute("loginInfo")!=null){
			mvo = (MemberVO)session.getAttribute("loginInfo");
		}
		else if((MemberVO)session.getAttribute("admin")!=null){
			mvo = (MemberVO)session.getAttribute("admin");
		}
		else{
		System.out.println("세션없음");
		return "carpool_register_fail";
		}	
		System.out.println("세션멤버"+mvo);
		cvo.setCarpoolMemberId(mvo.getMemberId());
		System.out.println("cvo: "+cvo);
		carpoolservice.registerCarPool(cvo);
		
		return "carpool_register_form";
	}

	
}




