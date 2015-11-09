package carTalk.carpool.model;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CarpoolDAOImpl implements CarpoolDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void carpoolRegister(CarpoolVO cvo) {
		System.out.println("카풀등록 dao 거침");
		sqlSessionTemplate.insert("carpool.register",cvo);
	}
	
	
	
}
