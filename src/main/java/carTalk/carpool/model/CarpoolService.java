package carTalk.carpool.model;

import java.util.List;

import carTalk.member.model.MemberVO;

public interface CarpoolService {

	void registerCarPool(CarpoolVO cvo);
	void registerCarPoolLocation(int carpoolNo,String carpoolLoction);
	List<CarpoolVO> getMyCarpoolList(MemberVO mvo);
	void deleteCarpool(int carpoolNo);
	int getLastInsertCarpoolNo();
	List<CarpoolVO> getSearchCarpoolList(CarpoolSearchVO csvo);

}
