package carTalk.member.model;

import java.util.List;



public interface MemberDAO {

	public MemberVO loginMember(MemberVO memberVO);

	public void registerMember(MemberVO memberVO);

	public String memberIdCheck(String memberId);
	
	public int updateMemberInfo(MemberVO memberVO);
	
	public int deleteMember(String memberId);
	
	public MemberVO findMemberInfoByMemberId(String memberId);
	
	public String memberPasswordCheck(MemberVO memberVO);
	
	public int updateMemberPassword(MemberVO memberVO);
	
	public MemberVO findMemberId(MemberVO vo);

	public MemberVO findMemberPassword(MemberVO vo);

}
