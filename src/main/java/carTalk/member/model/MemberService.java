package carTalk.member.model;

import java.util.HashMap;
import java.util.List;



public interface MemberService {

	public MemberVO loginMember(MemberVO mvo);

	public String memberIdCheck(String memberId) throws Exception;

	public int deleteMember(MemberVO memberVO);

	public MemberVO updateMember(MemberVO memberVO);

	public HashMap<String,Object> updateMemberPassword(String oriMemberPassword, MemberVO memberVO);

	public MemberVO findMemberInfoByMemberId(String memberId);
	
	public MemberVO findMemberId(MemberVO vo);
	
	public MemberVO findMemberPassword(MemberVO vo);

	public void registerMember(MemberVO memberVO);

}
