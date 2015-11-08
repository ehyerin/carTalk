package carTalk.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import carTalk.talk.model.TalkBoardService;
import carTalk.talk.model.TalkBoardVO;

@Controller
public class TalkController {
	@Resource
	private TalkBoardService talkboardservice;

/**
 * 토크 게시판
 * 리스트 보여주기
 */
	@RequestMapping(value="talk_list.do")	
	public ModelAndView talklist(String pageNo){ 	
		return new ModelAndView("talk_list", "lvo",
				talkboardservice.getBoardList(pageNo));
	
	}
	
	@RequestMapping(value="talk_write.do")
	public String talkWrite(TalkBoardVO bvo){
		talkboardservice.write(bvo);
		return "redirect:talk_list.do";
	}
	
	@RequestMapping(value="talk_delete_board.do")
	public String deleteTrade(int talkNo) {
		System.out.println("삭제 클릭클릭");
		talkboardservice.deleteBoard(talkNo);
		return "redirect:talk_list.do";
	}
	
}




