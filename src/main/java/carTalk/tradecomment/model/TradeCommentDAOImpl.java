package carTalk.tradecomment.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TradeCommentDAOImpl implements TradeCommentDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * trade_comment Table 에 tradeNo 를 참조하는 댓글 정보를 삽입한다.
	 */
	@Override
	public void writeComment(TradeCommentVO tradeCommentVO) {
		sqlSessionTemplate.insert("tradeComment.writeComment", tradeCommentVO);
	}
	
	/**
	 * trade_comment Table 에 tradeNo 를 참조하는 댓글 정보를 조회한다.
	 */
	@Override
	public List<TradeCommentVO> getAllCommentListByTradeNo(int tradeNo) {
		return sqlSessionTemplate.selectList("tradeComment.getAllCommentListByTradeNo", tradeNo);
	}

	/**
	 * trade_comment Table 에 tradeNo 를 참조하는 댓글 정보를 변경한다.
	 */
	@Override
	public void editComment(TradeCommentVO tradeCommentVO) {
		sqlSessionTemplate.update("tradeComment.editComment", tradeCommentVO);
	}

	/**
	 * trade_comment Table 에 tradeNo 를 참조하는 댓글 정보를 삭제한다.
	 */
	@Override
	public void deleteComment(int tradeCommentNo) {
		sqlSessionTemplate.delete("tradeComment.deleteComment", tradeCommentNo);
	}
}
