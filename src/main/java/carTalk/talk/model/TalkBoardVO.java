package carTalk.talk.model;

public class TalkBoardVO {
	
	private int	   talkNo;
	private String talkMemberId;
	private String talkTimePosted;
	private String talkContents;

	
	public TalkBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TalkBoardVO(int talkNo, String talkMemberId, String talkTimePosted,
			String talkContents) {
		super();
		this.talkNo = talkNo;
		this.talkMemberId = talkMemberId;
		this.talkTimePosted = talkTimePosted;
		this.talkContents = talkContents;
	}
	

	public int getTalkNo() {
		return talkNo;
	}


	public void setTalkNo(int talkNo) {
		this.talkNo = talkNo;
	}


	public String getTalkMemberId() {
		return talkMemberId;
	}


	public void setTalkMemberId(String talkMemberId) {
		this.talkMemberId = talkMemberId;
	}


	public String getTalkTimePosted() {
		return talkTimePosted;
	}


	public void setTalkTimePosted(String talkTimePosted) {
		this.talkTimePosted = talkTimePosted;
	}


	public String getTalkContents() {
		return talkContents;
	}


	public void setTalkContents(String talkContents) {
		this.talkContents = talkContents;
	}

	@Override
	public String toString() {
		return "TalkBoardVO [talkNo=" + talkNo + ", talkMemberId="
				+ talkMemberId + ", talkTimePosted=" + talkTimePosted
				+ ", talkContents=" + talkContents + "]";
	}
	
	

}
