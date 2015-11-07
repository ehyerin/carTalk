package carTalk.tradecomment.model;

public class TradeCommentVO {
	private int tradeCommentNo;
	private int tradeNo;
	private String tradeCommentMemberId;
	private String tradeCommentContent;
	private String tradeCommentTimePosted;
	public TradeCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TradeCommentVO(int tradeCommentNo, int tradeNo,
			String tradeCommentMemberId, String tradeCommentContent,
			String tradeCommentTimePosted) {
		super();
		this.tradeCommentNo = tradeCommentNo;
		this.tradeNo = tradeNo;
		this.tradeCommentMemberId = tradeCommentMemberId;
		this.tradeCommentContent = tradeCommentContent;
		this.tradeCommentTimePosted = tradeCommentTimePosted;
	}
	public int getTradeCommentNo() {
		return tradeCommentNo;
	}
	public void setTradeCommentNo(int tradeCommentNo) {
		this.tradeCommentNo = tradeCommentNo;
	}
	public int getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}
	public String getTradeCommentMemberId() {
		return tradeCommentMemberId;
	}
	public void setTradeCommentMemberId(String tradeCommentMemberId) {
		this.tradeCommentMemberId = tradeCommentMemberId;
	}
	public String getTradeCommentContent() {
		return tradeCommentContent;
	}
	public void setTradeCommentContent(String tradeCommentContent) {
		this.tradeCommentContent = tradeCommentContent;
	}
	public String getTradeCommentTimePosted() {
		return tradeCommentTimePosted;
	}
	public void setTradeCommentTimePosted(String tradeCommentTimePosted) {
		this.tradeCommentTimePosted = tradeCommentTimePosted;
	}
	@Override
	public String toString() {
		return "TradeCommentVO [tradeCommentNo=" + tradeCommentNo
				+ ", tradeNo=" + tradeNo + ", tradeCommentMemberId="
				+ tradeCommentMemberId + ", tradeCommentContent="
				+ tradeCommentContent + ", tradeCommentTimePosted="
				+ tradeCommentTimePosted + "]";
	}	
}
