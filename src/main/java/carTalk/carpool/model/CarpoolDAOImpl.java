package carTalk.carpool.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import carTalk.member.model.MemberVO;

@Repository
public class CarpoolDAOImpl implements CarpoolDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**1. 카풀등록**/
	@Override
	public void carpoolRegister(CarpoolVO cvo) {
		System.out.println("카풀등록 dao 거침");
		sqlSessionTemplate.insert("carpool.register",cvo);
	}
	@Override
	public void carpoolLocationRegister(int carpoolNo,String carpoolLoction) {
		System.out.println(carpoolNo+"번에 "+carpoolLoction+" 지역 리스트 등록");
		CarpoolLocationVO clvo = new CarpoolLocationVO(carpoolNo,carpoolLoction);
		sqlSessionTemplate.insert("carpool.registerlocation",clvo);
	}
	
	/**2. 카풀 찾기**/
	@Override
	public List<CarpoolVO> getAllSearchCarpoolList(String carpooltype) {
		System.out.println(carpooltype+ " 카풀검색");
		return sqlSessionTemplate.selectList("carpool.searchAllCarpoolListbyCarpoolType",carpooltype);
	}
	
	@Override
	public List<CarpoolVO> getSearchCarpoolList(CarpoolSearchVO csvo) {
		System.out.println(csvo+" 로부터 카풀리스트찾기");
		return sqlSessionTemplate.selectList("carpool.searchCarpoolList",csvo);
	}
	
	@Override
	public List<String> getCarpoolLoctionListBySearch(HashMap<String, Object> param) {
		System.out.println("카풀찾기- 지역 리스트 가져오기");
		return sqlSessionTemplate.selectList("carpool.getsearchcarpoollocationlist",param);
	}

	/** 3. 사용자가 등록한 카풀리스트 가져오기**/
	@Override
	public List<CarpoolVO> getMyCarpoolList(MemberVO mvo) {
		System.out.println("카풀 리스트 가져오기");
		return sqlSessionTemplate.selectList("carpool.getmycarpoollist",mvo.getMemberId());
	}
	@Override
	public List<String> getMyCarpoolLoctionList(int carpoolNo) {
		System.out.println("카풀 지역 리스트 가져오기");
		return sqlSessionTemplate.selectList("carpool.getmycarpoollocationlist",carpoolNo);
	}
	
	/**4. 카풀삭제하기**/
	@Override
	public void deleteCarpool(int carpoolNo) {
		sqlSessionTemplate.delete("carpool.deletecarpool",carpoolNo);
	}
	@Override
	public void deleteCarpoolLoction(int carpoolNo) {
		sqlSessionTemplate.delete("carpool.deletecarpoolloction",carpoolNo);
	}

	@Override
	public int getLastInsertCarpoolNo() {
		return sqlSessionTemplate.selectOne("carpool.selectLastcarpoolNo");
	}

	
	
	
	
}
