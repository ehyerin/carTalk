package carTalk.carpool.model;

import java.util.ArrayList;
import java.util.List;

public class CarpoolVO {
	
	private String carpoolMemberId; //등록하는 사람
	private int carpoolNo;			//카풀게시판 번호
	private int carpoolPrice;		//카풀 가격
	private String carpoolstartTime;		//카풀 되는시간 구간
	private String carpoolendTime;			//카풀 되는시간 구간
	private int carpoolCompanion;	//카풀 인원
	private String carpoolType;     //카풀 등교인지 하교인지
	private List<String> carpoolDestination; //카풀 목적지 리스트
	
	public CarpoolVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CarpoolVO(String carpoolMemberId, int carpoolNo, int carpoolPrice,
			String carpoolstartTime, String carpoolendTime,
			int carpoolCompanion, String carpoolType,
			ArrayList<String> carpoolDestination) {
		super();
		this.carpoolMemberId = carpoolMemberId;
		this.carpoolNo = carpoolNo;
		this.carpoolPrice = carpoolPrice;
		this.carpoolstartTime = carpoolstartTime;
		this.carpoolendTime = carpoolendTime;
		this.carpoolCompanion = carpoolCompanion;
		this.carpoolType = carpoolType;
		this.carpoolDestination = carpoolDestination;
	}
	public String getCarpoolMemberId() {
		return carpoolMemberId;
	}
	public void setCarpoolMemberId(String carpoolMemberId) {
		this.carpoolMemberId = carpoolMemberId;
	}
	public int getCarpoolNo() {
		return carpoolNo;
	}
	public void setCarpoolNo(int carpoolNo) {
		this.carpoolNo = carpoolNo;
	}
	public int getCarpoolPrice() {
		return carpoolPrice;
	}
	public void setCarpoolPrice(int carpoolPrice) {
		this.carpoolPrice = carpoolPrice;
	}
	public String getCarpoolstartTime() {
		return carpoolstartTime;
	}
	public void setCarpoolstartTime(String carpoolstartTime) {
		this.carpoolstartTime = carpoolstartTime;
	}
	public String getCarpoolendTime() {
		return carpoolendTime;
	}
	public void setCarpoolendTime(String carpoolendTime) {
		this.carpoolendTime = carpoolendTime;
	}
	public int getCarpoolCompanion() {
		return carpoolCompanion;
	}
	public void setCarpoolCompanion(int carpoolCompanion) {
		this.carpoolCompanion = carpoolCompanion;
	}
	public String getCarpoolType() {
		return carpoolType;
	}
	public void setCarpoolType(String carpoolType) {
		this.carpoolType = carpoolType;
	}
	public List<String> getCarpoolDestination() {
		return carpoolDestination;
	}
	public void setCarpoolDestination(List<String> carpoolDestination) {
		this.carpoolDestination = carpoolDestination;
	}
	@Override
	public String toString() {
		return "CarpoolVO [carpoolMemberId=" + carpoolMemberId + ", carpoolNo="
				+ carpoolNo + ", carpoolPrice=" + carpoolPrice
				+ ", carpoolstartTime=" + carpoolstartTime
				+ ", carpoolendTime=" + carpoolendTime + ", carpoolCompanion="
				+ carpoolCompanion + ", carpoolType=" + carpoolType
				+ ", carpoolDestination=" + carpoolDestination + "]";
	}
	
}
