package carTalk.trade.model;

import java.util.List;

import carTalk.tradecomment.model.TradeCommentVO;

public interface TradeDAO {
	public void writeTrade(TradeVO vo);
	public void updateTrade(TradeVO vo);
	public void deleteTrade(int tradeNo);
	public List<TradeVO> getTradeList(String pageNo);
	public TradeVO showContent(int tradeNo);
	public int totalContent();
	public void updateCount(int tradeNo);
	public List<TradeCommentVO> getCommentListByTradeNo(int tradeNo);
	public void registerFile(TradeFileVO rfvo);
	public int countTradeCommentByTradeNo(int tradeNo);
	public void deleteFileByTradeNo(int tradeNo);

}
