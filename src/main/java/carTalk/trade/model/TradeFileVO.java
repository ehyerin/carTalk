package carTalk.trade.model;


public class TradeFileVO {
	private int tradeNo;
	private int tradeFileNo;
	private String filePath;

	public TradeFileVO() {
		super();
	}

	public TradeFileVO(int tradeNo, int tradeFileNo, String filePath) {
		super();
		this.tradeNo = tradeNo;
		this.tradeFileNo = tradeFileNo;
		this.filePath = filePath;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public int getTradeFileNo() {
		return tradeFileNo;
	}

	public void setTradeFileNo(int tradeFileNo) {
		this.tradeFileNo = tradeFileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "TradeFileVO [tradeNo=" + tradeNo + ", tradeFileNo="
				+ tradeFileNo + ", filePath=" + filePath + "]";
	}

}
