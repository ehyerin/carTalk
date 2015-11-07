package carTalk.member.model;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberVO {
	@Size(min=4,max=10)
	private String memberId;
	@Size(min=4,max=15)
	private String memberPassword;
	@NotEmpty
	private String memberName;
	@Email
	@NotEmpty
	private String memberEmail;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberId, String memberPassword, String memberName,
			String memberEmail) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
	
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPassword="
				+ memberPassword + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + "]";
	}
}
