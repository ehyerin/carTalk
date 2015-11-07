package carTalk.tradecomment.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class TradeCommentServiceImpl implements TradeCommentService {
	@Resource
	private TradeCommentDAO tradeCommentDAO;
	
	/**
	 * 댓글을 등록하고 변경된 댓글 목록을 반환한다.
	 */
	@Override
	public List<TradeCommentVO> writeComment(TradeCommentVO tradeCommentVO) {
		tradeCommentDAO.writeComment(tradeCommentVO);
		return getAllCommentListByTradeNo(tradeCommentVO.getTradeNo());
	}
	
	/**
	 * 댓글을 수정하고 변경된 댓글 목록을 반환한다.
	 */
	@Override
	public List<TradeCommentVO> editComment(TradeCommentVO tradeCommentVO) {
		tradeCommentDAO.editComment(tradeCommentVO);
		return getAllCommentListByTradeNo(tradeCommentVO.getTradeNo());
	}

	/**
	 * 댓글을 삭제하고 변경된 댓글 목록을 반환한다.
	 */
	@Override
	public List<TradeCommentVO> deleteComment(TradeCommentVO tradeCommentVO) {
		tradeCommentDAO.deleteComment(tradeCommentVO.getTradeCommentNo());
		return getAllCommentListByTradeNo(tradeCommentVO.getTradeNo());
	}
	
	/**
	 * tradeNo 를 참조하는 댓글 목록을 반환한다.
	 */
	@Override
	public List<TradeCommentVO> getAllCommentListByTradeNo(int tradeNo){
		return tradeCommentDAO.getAllCommentListByTradeNo(tradeNo);
	}

}
