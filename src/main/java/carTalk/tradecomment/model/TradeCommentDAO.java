package carTalk.tradecomment.model;

import java.util.List;

public interface TradeCommentDAO {

	public void writeComment(TradeCommentVO tradeCommentVO);

	public List<TradeCommentVO> getAllCommentListByTradeNo(int tradeNo);

	public void editComment(TradeCommentVO tradeCommentVO);

	public void deleteComment(int tradeCommentNo);

}
