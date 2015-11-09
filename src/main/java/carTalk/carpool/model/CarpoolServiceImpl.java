package carTalk.carpool.model;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import carTalk.member.model.exception.DuplicateMemberIdException;
import carTalk.member.model.exception.InvalidMemberIdException;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Resource
	private CarpoolDAO carpoolDAO;

	@Override
	public void registerCarPool(CarpoolVO cvo) {
		carpoolDAO.carpoolRegister(cvo);
		
	}


}
