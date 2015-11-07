package carTalk.board.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import carTalk.trade.model.TradeService;
import carTalk.trade.model.TradeVO;
import carTalk.member.model.MemberVO;

@Controller
public class TradeController {
	@Resource
	private TradeService tradeService;
	
	/**
	 * 이용후기 작성 폼으로 이동한다.
	 * @return
	 */
	@RequestMapping("auth_trade_write_form.do")
	public ModelAndView writeTradeForm() {
		return new ModelAndView("tradeboard_trade_write_form");
	}

	/**
	 * 이용후기 등록
	 * 게시글을 insert 새로고침시 재입력을 막기 위해 redirect 시킨다. post 방식일때만 등록가능
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "auth_trade_write.do", method = RequestMethod.POST)
	public ModelAndView write(TradeVO vo) {
		tradeService.writeTradeSavingPoint(vo);
		return new ModelAndView("redirect:trade_showContentNoHit.do?tradeNo="+ vo.getTradeNo());
	}
	
	/**
	 * 이용후기 작성 시 파일업로드
	 * 스마트 에디터를 사용해 파일을 삽입할 때 서버에 저장하고 에디터에 이미지 태그의 경로를 입력한다.
	 * @param request
	 * @param response
	 */
	@RequestMapping("auth_trade_multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, 
			HttpServletResponse response) {
		try {
			HttpSession session=request.getSession(false);
			MemberVO memberVO=(MemberVO)session.getAttribute("loginInfo");
			// header 에서 파일명을 가져온다.
			String oriName = request.getHeader("file-name");
			// 저장될 파일 이름을 변환하고 경로를 설정
			HashMap<String, String> map = tradeService.fileNameFomat(memberVO, oriName);
			// 서버에 저장
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(map.get("filePath"));
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			// 후기 입력 폼에 파일 정보를 기록한다.
			PrintWriter print = response.getWriter();
			print.print(map.get("fileInfo"));
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	/**
	 * 최근 게시물 10개를 보여주는 메서드 , 이후 페이징시 업데이트 해야 한다.
	 * 
	 * @param request
	 * @param response
	 * @return @
	 */
	@RequestMapping("trade_list.do")
	public ModelAndView list(String pageNo) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("trade_list");
		mv.addObject("lvo",tradeService.getTradeList(pageNo));

		return mv;
	}

	/**
	 * 게시글 조회 , 조회수 업데이트 개별 게시물 보여준다. Cookie를 활용하여 읽은 게시물은 조회수를 업데이트하지 않도록 처리한다.
	 * 
	 * @param request
	 * @param response
	 * @return @
	 */
	@RequestMapping("trade_showContent.do")
	public ModelAndView showContent(
			int tradeNo,
			@CookieValue(value = "springboard2", required = false) String cookieValue,
			HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("trade_showcontent_form");
		TradeVO vo = null;
		if (cookieValue == null) {
			// log.info("springboard2 cookie 존재하지 않으므로 cookie 생성하고 count 증가");
			response.addCookie(new Cookie("springboard2", "|" + tradeNo + "|"));
			vo = tradeService.showContent(tradeNo);
		} else if (cookieValue.indexOf("|" + tradeNo + "|") == -1) {
			// log.info("springboard2 cookie 존재하지만 {}번글은 처음 조회하므로 count증가",no);
			cookieValue += "|" + tradeNo + "|";
			// 글번호를 쿠키에 추가
			response.addCookie(new Cookie("springboard2", cookieValue));
			vo = tradeService.showContent(tradeNo);
		} else {
			// log.info("springboard2 cookie 존재하고 이전에 해당 게시물 읽었으므로 count 증가x");
			vo = tradeService.showContentNoHit(tradeNo);
		}
		mv.addObject("vo", vo);
		mv.addObject("commentList", tradeService.getCommentListByTradeNo(tradeNo));
		return mv;
	}

	/**
	 * 등록, 수정시 사용하는 개별 게시물 조회 메서드
	 * 
	 * @param no
	 * @return @
	 */
	@RequestMapping("trade_showContentNoHit.do")
	public ModelAndView showContentNoHit(int tradeNo) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("trade_showcontent_form");
		mv.addObject("vo", tradeService.showContentNoHit(tradeNo));
		mv.addObject("commentList", tradeService.getCommentListByTradeNo(tradeNo));
		return mv;
	}
	/**
	 * 작성한 이용후기를 삭제
	 * @param tradeNo
	 * @return
	 */
	@RequestMapping("auth_trade_delete.do")
	public ModelAndView deleteTrade(int tradeNo) {
		tradeService.deleteTrade(tradeNo);
		return new ModelAndView("trade_list", "lvo",
				tradeService.getTradeList("1"));
	}
	/**
	 * 이용후기 수정 폼으로 이동
	 * @param vo
	 * @return
	 */
	@RequestMapping("auth_update_trade_form.do")
	public ModelAndView updateTradeForm(TradeVO vo) {
		return new ModelAndView("trade_update_form",
				"vo", tradeService.showContentNoHit(vo.getTradeNo()));
	}
	/**
	 * 이용후기 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("trade_update.do")
	public ModelAndView updateTrade(TradeVO vo){
	
		tradeService.updateTrade(vo);
		return new ModelAndView("redirect:trade_showContentNoHit.do?tradeNo="
				+ vo.getTradeNo());
	}
	
}