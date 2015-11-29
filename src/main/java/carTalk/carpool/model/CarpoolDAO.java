package carTalk.carpool.model;

import java.util.HashMap;
import java.util.List;

import carTalk.member.model.MemberVO;

public interface CarpoolDAO {

	void carpoolRegister(CarpoolVO cvo);

	void carpoolLocationRegister(int carpoolNo,String carpoolLoction);

	List<CarpoolVO> getMyCarpoolList(MemberVO mvo);
	
	List<String> getMyCarpoolLoctionList(int carpoolNo);

	void deleteCarpool(int carpoolNo);

	void deleteCarpoolLoction(int carpoolNo);

	int getLastInsertCarpoolNo();

	List<CarpoolVO> getSearchCarpoolList(CarpoolSearchVO csvo);

	List<String> getCarpoolLoctionListBySearch(HashMap<String, Object> param);

}
