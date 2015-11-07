package carTalk.member.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import carTalk.member.model.exception.DuplicateMemberIdException;
import carTalk.member.model.exception.InvalidMemberIdException;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	
	/**
	 * 입력한 아이디와 비밀번호가 일치하는 회원정보를 조회해서 회원정보를 반환한다.
	 */
	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}
	

	/**
	 * 아이디체크
	 * 회원가입 시 입력한 아이디의 중복여부와 길이를 체크한다.
	 * 아이디의 길이가 적합하지 않을 경우 InvalidMemberIdException 을 발생하고, 아이디가 중복될 경우 DuplicateMemberIdException 을 발생한다.
	 */
	@Override
	public String memberIdCheck(String memberId) throws Exception {
		String result="fail";
		if(memberId.length()<4 || memberId.length()>10){
			throw new InvalidMemberIdException("4자이상 10자이하로 아이디는 제한됩니다.");
		} else{
			result=memberDAO.memberIdCheck(memberId);
			if(result.equals("fail")){
				throw new DuplicateMemberIdException("중복되는 아이디 존재");
			}
		}
		return result;
	}
	
	/**
	 * 회원탈퇴
	 * 탈퇴할 회원의 비밀번호가 일치하면 member table 에서 회원정보를 삭제한다.
	 * 탈퇴할 회원의 비밀번호가 일치하지않으면 0을 반환한다.
	 */
	@Transactional
	@Override
	public int deleteMember(MemberVO memberVO) {
		if(memberDAO.memberPasswordCheck(memberVO)!="ok"){
			return 0;
		}
		return memberDAO.deleteMember(memberVO.getMemberId());
	}
	

	/**
	 * 입력받은 정보로 회원정보를 수정한다.
	 */
	@Transactional
	@Override
	public MemberVO updateMember(MemberVO memberVO) {
		memberDAO.updateMemberInfo(memberVO);
		return memberDAO.findMemberInfoByMemberId(memberVO.getMemberId());
	}
	
	/**
	 * 기존 비밀번호가 일치하는지 확인하고, 일치하면 새로운 비밀번호로 변경한다.
	 * 일치하지 않으면 flag 에 fail 을 세팅한다.
	 */
	@Transactional
	@Override
	public HashMap<String,Object> updateMemberPassword(String oriMemberPassword, MemberVO memberVO) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		String newPass=memberVO.getMemberPassword();
		memberVO.setMemberPassword(oriMemberPassword);
		map.put("flag", "fail");
		if(memberDAO.memberPasswordCheck(memberVO)!="ok")
			map.put("message", "기존 비밀번호가 일치하지 않습니다!" );
		else{
			memberVO.setMemberPassword(newPass);
			memberDAO.updateMemberPassword(memberVO);
			map.put("flag", "ok");
			map.put("message", "비밀번호 수정 완료");
			map.put("memberVO", memberDAO.findMemberInfoByMemberId(memberVO.getMemberId()));
		}
		return map;
	}

	
	/**
	 * memberId 에 해당하는 정보를 조회한다.
	 */
	@Override
	public MemberVO findMemberInfoByMemberId(String memberId) {
		return memberDAO.findMemberInfoByMemberId(memberId);
	}
	
	
	/**
	 * 회원의 아이디를 조회한다.
	 */
	@Override
	public MemberVO findMemberId(MemberVO memberVO){
		return memberDAO.findMemberId(memberVO);
	}
	
	/**
	 * 회원의 비밀번호를 조회한다.
	 */
	@Override
	public MemberVO findMemberPassword(MemberVO memberVO){
		return memberDAO.findMemberPassword(memberVO);
	}

}
