package carTalk.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import carTalk.tradecomment.model.TradeCommentService;
import carTalk.tradecomment.model.TradeCommentVO;

@Controller
public class TradeCommentController {
	@Resource
	private TradeCommentService tradeCommentService;
	/**
	 * 댓글작성
	 * 댓글 등록하고 댓글 목록을 commentList 에 세팅한다.
	 * @param tradeCommentVO
	 * @return
	 */
	@RequestMapping("auth_tradeComment_writeComment.do")
	@ResponseBody
	public HashMap<String, Object> writeComment(TradeCommentVO tradeCommentVO){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("flag", "ok");
		map.put("commentList", tradeCommentService.writeComment(tradeCommentVO));
		return map;
	}
	/**
	 * 댓글수정
	 * 댓글 수정하고 댓글 목록을 commentList 에 세팅한다.
	 * @param tradeCommentVO
	 * @return
	 */
	@RequestMapping("auth_tradeComment_editComment.do")
	@ResponseBody
	public HashMap<String, Object> editComment(TradeCommentVO tradeCommentVO){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("flag", "ok");
		map.put("commentList", tradeCommentService.editComment(tradeCommentVO));
		return map;
	}
	/**
	 * 댓글삭제
	 * 댓글 삭제하고 댓글 목록을 commentList 에 세팅한다.
	 * @param tradeCommentVO
	 * @return
	 */
	@RequestMapping("auth_tradeComment_deleteComment.do")
	@ResponseBody
	public HashMap<String, Object> deleteComment(TradeCommentVO tradeCommentVO){
		HashMap<String, Object> map=new HashMap<String, Object>();		
		List<TradeCommentVO> list=tradeCommentService.deleteComment(tradeCommentVO);
		if(list.size()!=0){
			map.put("commentList", list);
			map.put("flag", "ok");
		} else{
			map.put("flag", "empty");
		}		
		return map;
	}
	
	/**
	 * 댓글 수정 폼
	 * 댓글을 수정하기 위한 폼을 제공한다.
	 * @param tradeNo
	 * @return
	 */
	@RequestMapping("tradeComment_editCommentForm.do")
	@ResponseBody
	public List<TradeCommentVO> editCommentForm(int tradeNo){
		return tradeCommentService.getAllCommentListByTradeNo(tradeNo);
	}
}
