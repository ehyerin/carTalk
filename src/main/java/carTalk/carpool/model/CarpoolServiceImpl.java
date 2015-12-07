package carTalk.carpool.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import carTalk.member.model.MemberVO;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Resource
	private CarpoolDAO carpoolDAO;
	
	/**1. 카풀 등록**/
	@Override
	public void registerCarPool(CarpoolVO cvo) {
		carpoolDAO.carpoolRegister(cvo);		
	}
	@Override
	public void registerCarPoolLocation(int carpoolNo,String carpoolLoction) {
		carpoolDAO.carpoolLocationRegister(carpoolNo,carpoolLoction);
	}
	/**
	 * 2. 카풀 찾기
	 */
	
	@Override
	public List<CarpoolVO> getAllSearchCarpoolList(String carpooltype) {
		List<CarpoolVO> searchList =carpoolDAO.getAllSearchCarpoolList(carpooltype);	
		for(int i=0; i<searchList.size(); i++){			
			List<String> carpoolSearchLocationList = carpoolDAO.getMyCarpoolLoctionList(searchList.get(i).getCarpoolNo());
			searchList.get(i).setCarpoolDestination(carpoolSearchLocationList);
		}	
		return searchList;
	}
	
	@Override
	public List<CarpoolVO> getSearchCarpoolList(CarpoolSearchVO csvo) {
		List<CarpoolVO> searchList =carpoolDAO.getSearchCarpoolList(csvo);	
		HashMap<String, Object> param = new HashMap<String,Object>();
		
		for(int i=0; i<searchList.size(); i++){
			//i는 전체 등록된 갯수
			param.put("carpoolNo", searchList.get(i).getCarpoolNo());//찾으려는 카풀 번호
			param.put("carpoolLocation", csvo.getSearchCarpoolLoction()); //검색한 단어(지역)
			List<String> carpoolSearchLocationList = carpoolDAO.getCarpoolLoctionListBySearch(param);
			searchList.get(i).setCarpoolDestination(carpoolSearchLocationList);
		}	
		return searchList;
	}
	
	/**3. 카풀리스트 가져오기**/
	@Override
	public List<CarpoolVO> getMyCarpoolList(MemberVO mvo) {
		List<CarpoolVO> carpoolList = carpoolDAO.getMyCarpoolList(mvo); //카풀리스트
		//사용자가 가지고 있는 등록 카풀 리스트
		for(int i=0; i<carpoolList.size(); i++){
			//i는 전체 등록된 갯수
			List<String> carpoolLocationList = carpoolDAO.getMyCarpoolLoctionList(carpoolList.get(i).getCarpoolNo());
			//각각의 등록번호대로 지역들을 가지고 온다.
			carpoolList.get(i).setCarpoolDestination(carpoolLocationList);
			//각각의 등록 카풀의 목적지 리스트에 지역들을 넣어준다.
		}
		//카풀리스트 반환
		return carpoolList;
	}
	/**4. 카풀삭제**/
	@Override
	public void deleteCarpool(int carpoolNo) {
		carpoolDAO.deleteCarpoolLoction(carpoolNo);//카풀 지역테이블
		carpoolDAO.deleteCarpool(carpoolNo);//카풀 테이블
		
	}
	
	
	@Override
	public int getLastInsertCarpoolNo() {
		return carpoolDAO.getLastInsertCarpoolNo();
	}
	
	

}
