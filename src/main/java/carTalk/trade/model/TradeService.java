package carTalk.trade.model;

import java.util.HashMap;
import java.util.List;

import carTalk.tradecomment.model.TradeCommentVO;
import carTalk.member.model.MemberVO;

public interface TradeService {
	public void writeTradeSavingPoint(TradeVO vo);

	public void updateTrade(TradeVO vo);

	public void deleteTrade(int tradeNo);

	public ListVO getTradeList(String pageNo);

	public TradeVO showContent(int tradeNo);

	public TradeVO showContentNoHit(int no);

	public List<TradeCommentVO> getCommentListByTradeNo(int tradeNo);


	public HashMap<String, String> fileNameFomat(MemberVO memberVO, String oriName)	throws Exception;


}
