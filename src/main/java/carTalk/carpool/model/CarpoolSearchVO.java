package carTalk.carpool.model;

public class CarpoolSearchVO {
	
	String searchCarpoolLoction;
	String searchCarpoolTime;
	String searchCarpoolType;
	String searchCarpoolCompanion;
	public CarpoolSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CarpoolSearchVO(String searchCarpoolLoction,
			String searchCarpoolTime, String searchCarpoolType,
			String searchCarpoolCompanion) {
		super();
		this.searchCarpoolLoction = searchCarpoolLoction;
		this.searchCarpoolTime = searchCarpoolTime;
		this.searchCarpoolType = searchCarpoolType;
		this.searchCarpoolCompanion = searchCarpoolCompanion;
	}
	public String getSearchCarpoolLoction() {
		return searchCarpoolLoction;
	}
	public void setSearchCarpoolLoction(String searchCarpoolLoction) {
		this.searchCarpoolLoction = searchCarpoolLoction;
	}
	public String getSearchCarpoolTime() {
		return searchCarpoolTime;
	}
	public void setSearchCarpoolTime(String searchCarpoolTime) {
		this.searchCarpoolTime = searchCarpoolTime;
	}
	public String getSearchCarpoolType() {
		return searchCarpoolType;
	}
	public void setSearchCarpoolType(String searchCarpoolType) {
		this.searchCarpoolType = searchCarpoolType;
	}
	public String getSearchCarpoolCompanion() {
		return searchCarpoolCompanion;
	}
	public void setSearchCarpoolCompanion(String searchCarpoolCompanion) {
		this.searchCarpoolCompanion = searchCarpoolCompanion;
	}
	@Override
	public String toString() {
		return "CarpoolSearchVO [searchCarpoolLoction=" + searchCarpoolLoction
				+ ", searchCarpoolTime=" + searchCarpoolTime
				+ ", searchCarpoolType=" + searchCarpoolType
				+ ", searchCarpoolCompanion=" + searchCarpoolCompanion + "]";
	}
	
	
}
