package carTalk.tradecomment.model;

import java.util.List;

public interface TradeCommentService {

	public List<TradeCommentVO> writeComment(TradeCommentVO tradeCommentVO);

	public List<TradeCommentVO> editComment(TradeCommentVO tradeCommentVO);

	public List<TradeCommentVO> deleteComment(TradeCommentVO tradeCommentVO);

	public List<TradeCommentVO> getAllCommentListByTradeNo(int tradeNo);

}
