package carTalk.trade.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import carTalk.tradecomment.model.TradeCommentVO;

@Repository
public class TradeDAOImpl implements TradeDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * trade Table 에 입력된 내용을 삽입한다.
	 */
	public void writeTrade(TradeVO vo) {
		sqlSessionTemplate.insert("trade.writeTrade", vo);
	}
	/**
	 * 중고거래 수정
	 */
	public void updateTrade(TradeVO vo) {
		sqlSessionTemplate.update("trade.updateTrade", vo);
	}
	/**
	 * 중고거래 삭제
	 */
	public void deleteTrade(int tradeNo) {
		sqlSessionTemplate.delete("trade.deleteTrade", tradeNo);
	}
	/**
	 * 선택한 페이지에 해당하는 
	 */
	public List<TradeVO> getTradeList(String pageNo) {
		return sqlSessionTemplate.selectList("trade.getTradeList", pageNo);
	}
	/**
	 * 중고거래 상세보기 
	 */
	public TradeVO showContent(int tradeNo) {
		return sqlSessionTemplate.selectOne("trade.showContent", tradeNo);
	}
	/**
	 * 페이징 처리를 위해 전체 글 개수를 반환
	 */
	@Override
	public int totalContent() {
		return sqlSessionTemplate.selectOne("trade.totalContent");
	}
	/**
	 * 조회수증가
	 */
	@Override
	public void updateCount(int tradeNo) {
		sqlSessionTemplate.update("trade.updateCount", tradeNo);
	}
	/**
	 * 해당글의 댓글목록 가져오기
	 */
	@Override
	public List<TradeCommentVO> getCommentListByTradeNo(int tradeNo) {
		return sqlSessionTemplate.selectList("trade.getCommentListByTradeNo", tradeNo);
	}
	

	/**
	 * trade_file Table 에 tradeNo 를 외래키로 참조하는 파일 정보 삽입한다.
	 */
	@Override
	public void registerFile(TradeFileVO rfvo){
		sqlSessionTemplate.insert("tradeFile.registerFile",rfvo);
	}
	/**
	 * 해당글에 달린 댓글의 개수를 반환
	 */
	@Override
	public int countTradeCommentByTradeNo(int tradeNo) {
		return sqlSessionTemplate.selectOne("trade.countTradeCommentBytradeNo", tradeNo);
	}
	
	/**
	 * trade_file Table 에서 tradeNo 를 참조하는 파일 정보를 삭제한다.
	 */
	@Override
	public void deleteFileByTradeNo(int tradeNo) {
		sqlSessionTemplate.delete("tradeFile.deleteFileByTradeNo", tradeNo);
	}

	
}
