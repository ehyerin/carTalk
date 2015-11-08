package carTalk.talk.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TalkBoardDAOImpl implements TalkBoardDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 공지사항 작성을 위한 메서드
	 */
	@Override
	public void write(TalkBoardVO bvo) {
			sqlSessionTemplate.insert("board.write", bvo);
	}

	/**
	 * 공지사항 테이블에서 모든 공지사항 목록을 반환
	 */
	@Override
	public List<TalkBoardVO> getBoardList(String pageNo) {
		return sqlSessionTemplate.selectList("board.getBoardList", pageNo);
	}

	/**
	 * 선택한 글 상세보기
	 */
	@Override
	public TalkBoardVO showContent(int noticeNo) {
		System.out.println("dao" + noticeNo);
		return (TalkBoardVO) sqlSessionTemplate.selectOne("board.showContent",
				noticeNo);
	}

	/**
	 * 공지사항 삭제
	 */
	@Override
	public void deleteBoard(int talkNo) {
		System.out.println("DAO:" + talkNo);
		sqlSessionTemplate.delete("board.deleteBoard", talkNo);
	}

	/**
	 * 공지사항 수정
	 */
	@Override
	public void updateBoard(TalkBoardVO bvo) {
		sqlSessionTemplate.update("board.updateBoard", bvo);
	}

	/**
	 * 페이징 처리를 위해 전체 게시글의 수를 세는 메서드
	 */
	@Override
	public int totalContent() {
		return sqlSessionTemplate.selectOne("board.totalContent");
	}

}
