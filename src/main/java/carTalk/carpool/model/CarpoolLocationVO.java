package carTalk.carpool.model;


public class CarpoolLocationVO {
	
	private int carpoolNo;			//카풀게시판 번호
	private	String carpoolLoction; //카풀 게시판에 해당하는 지역
	public CarpoolLocationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CarpoolLocationVO(int carpoolNo, String carpoolLoction) {
		super();
		this.carpoolNo = carpoolNo;
		this.carpoolLoction = carpoolLoction;
	}
	public int getCarpoolNo() {
		return carpoolNo;
	}
	public void setCarpoolNo(int carpoolNo) {
		this.carpoolNo = carpoolNo;
	}
	public String getCarpoolLoction() {
		return carpoolLoction;
	}
	public void setCarpoolLoction(String carpoolLoction) {
		this.carpoolLoction = carpoolLoction;
	}
	@Override
	public String toString() {
		return "CarpoolLocationVO [carpoolNo=" + carpoolNo
				+ ", carpoolLoction=" + carpoolLoction + "]";
	}
	
	
	
	
}
