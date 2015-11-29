package carTalk.carpool.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import carTalk.carpool.model.CarpoolLocationVO;
import carTalk.carpool.model.CarpoolSearchVO;
import carTalk.carpool.model.CarpoolService;
import carTalk.carpool.model.CarpoolVO;
import carTalk.member.model.MemberVO;

@Controller
public class CarPoolController {
	@Resource
	private CarpoolService carpoolservice;
	
	/**1. 카풀 등록하기**/
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
		return "carpool_session_fail";
		}	
		cvo.setCarpoolMemberId(mvo.getMemberId());
		//카풀 등록
		carpoolservice.registerCarPool(cvo);
		System.out.println("cvo: "+cvo);
		//카풀지역db에 지역사이즈만큼 정보를 넣어준다.
		for(int i=0; i<cvo.getCarpoolDestination().size(); i++){
		carpoolservice.registerCarPoolLocation(cvo.getCarpoolNo(),cvo.getCarpoolDestination().get(i));
		}
		return "carpool_register_success";
	}
	/**
	 * 2. 카풀 찾기
	 */
	@RequestMapping(value="carpool_allSearch.do")
	public String carpoolAllSearch(HttpServletRequest request,Model model){ 
		HttpSession session = request.getSession(false);
		if((MemberVO)session.getAttribute("loginInfo")==null&&(MemberVO)session.getAttribute("admin")==null){
			return "carpool_session_fail";
		}
		//List<CarpoolVO> searchList= carpoolservice.getAllSearchCarpoolList(csvo);
		//model.addAttribute("searchList",searchList);
		model.addAttribute("searchCarpoolType","전체");
		return "carpool_search_result";
	}
	
	@RequestMapping(value="carpool_search.do")
	public String carpoolSearch(CarpoolSearchVO csvo,HttpServletRequest request,Model model){ 
		HttpSession session = request.getSession(false);
		if((MemberVO)session.getAttribute("loginInfo")==null&&(MemberVO)session.getAttribute("admin")==null){
			return "carpool_session_fail";
		}
		System.out.println("찾을 카풀: "+csvo);
		List<CarpoolVO> searchList= carpoolservice.getSearchCarpoolList(csvo);
		model.addAttribute("searchList",searchList);
		model.addAttribute("searchCarpoolType",csvo.getSearchCarpoolType());
		System.out.println("searchList: "+searchList);
		return "carpool_search_result";
	}
	/**
	 *  3. 나의 등록한 카풀 불러오기 
	 */
	@RequestMapping(value="carpool_mycarpool_list.do")	
	public String myCarpoollist(HttpServletRequest request,Model model){ 
		HttpSession session = request.getSession(false);
		MemberVO mvo=null;
		if((MemberVO)session.getAttribute("loginInfo")!=null){
			mvo = (MemberVO)session.getAttribute("loginInfo");
		}
		else if((MemberVO)session.getAttribute("admin")!=null){
			mvo = (MemberVO)session.getAttribute("admin");
		}
		else{
		return "carpool_session_fail";
		}	
		System.out.println("세션멤버"+mvo);
		List<CarpoolVO> carpoolList = carpoolservice.getMyCarpoolList(mvo);
		System.out.println("carpoolList: "+carpoolList);	
		model.addAttribute("carpool",carpoolList);
			return "carpool_mycarpool";
	}
	/**
	 * 4. 등록한 카풀 삭제하기
	 * @param carpoolNo
	 * @return
	 */
		@RequestMapping(value="carpool_delete.do")	
	public String carpoolDelete(int carpoolNo){ 
		System.out.println(carpoolNo+"번 삭제");
		carpoolservice.deleteCarpool(carpoolNo);
		return "redirect:carpool_mycarpool_list.do";
		}
	
}




