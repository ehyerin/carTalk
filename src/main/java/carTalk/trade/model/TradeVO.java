package carTalk.trade.model;

import java.util.List;

import carTalk.tradecomment.model.TradeCommentVO;

public class TradeVO {
	private int tradeNo;
	private String tradeTitle;
	private String memberId;
	private String tradeContent;
	private String tradeTimePosted;
	private int tradeHit;
	private int tradeCommentCount;
	private List<TradeCommentVO> TradeCommentList;
	private TradeFileVO tradeFileVO;
	public TradeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TradeVO(int tradeNo, String tradeTitle, String memberId,
			String tradeContent, String tradeTimePosted, int tradeHit,
			int tradeLikeCount, int tradeCommentCount,
			List<TradeCommentVO> tradeCommentList, TradeFileVO tradeFileVO) {
		super();
		this.tradeNo = tradeNo;
		this.tradeTitle = tradeTitle;
		this.memberId = memberId;
		this.tradeContent = tradeContent;
		this.tradeTimePosted = tradeTimePosted;
		this.tradeHit = tradeHit;

		this.tradeCommentCount = tradeCommentCount;
		TradeCommentList = tradeCommentList;
		this.tradeFileVO = tradeFileVO;
	}
	public int getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}
	public String getTradeTitle() {
		return tradeTitle;
	}
	public void setTradeTitle(String tradeTitle) {
		this.tradeTitle = tradeTitle;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTradeContent() {
		return tradeContent;
	}
	public void setTradeContent(String tradeContent) {
		this.tradeContent = tradeContent;
	}
	public String getTradeTimePosted() {
		return tradeTimePosted;
	}
	public void setTradeTimePosted(String tradeTimePosted) {
		this.tradeTimePosted = tradeTimePosted;
	}
	public int getTradeHit() {
		return tradeHit;
	}
	public void setTradeHit(int tradeHit) {
		this.tradeHit = tradeHit;
	}

	public int getTradeCommentCount() {
		return tradeCommentCount;
	}
	public void setTradeCommentCount(int tradeCommentCount) {
		this.tradeCommentCount = tradeCommentCount;
	}
	public List<TradeCommentVO> getTradeCommentList() {
		return TradeCommentList;
	}
	public void setTradeCommentList(List<TradeCommentVO> tradeCommentList) {
		TradeCommentList = tradeCommentList;
	}
	public TradeFileVO getTradeFileVO() {
		return tradeFileVO;
	}
	public void setTradeFileVO(TradeFileVO tradeFileVO) {
		this.tradeFileVO = tradeFileVO;
	}
	@Override
	public String toString() {
		return "TradeVO [tradeNo=" + tradeNo + ", tradeTitle="
				+ tradeTitle + ", memberId=" + memberId + ", tradeContent="
				+ tradeContent + ", tradeTimePosted=" + tradeTimePosted
				+ ", tradeHit=" + tradeHit + ", tradeLikeCount="
				+  ", tradeCommentCount="
				+ tradeCommentCount + ", TradeCommentList="
				+ TradeCommentList + ", tradeFileVO=" + tradeFileVO + "]";
	}
}