package carTalk.talk.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import carTalk.common.model.PagingBean;

@Service
public class TalkBoardServiceImpl implements TalkBoardService {
	@Resource
	private TalkBoardDAO boardDAO;

	/**
	 * 공지사항을 작성하는 메서드
	 */
	@Override
	public void write(TalkBoardVO bvo) {
		boardDAO.write(bvo);
	}

	/**
	 * 클릭한 페이지에 해당하는 공지사항 목록10개 반환
	 */
	@Override
	public TalkListVO getBoardList(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<TalkBoardVO> list = boardDAO.getBoardList(pageNo);
		int total = boardDAO.totalContent();
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		TalkListVO lvo = new TalkListVO(list, paging);
		return lvo;
	}

	/**
	 * 공지사항 상세 글보기
	 */
	@Override
	public TalkBoardVO showContent(int qnaNo) {
		return boardDAO.showContent(qnaNo);
	}

	/**
	 * 공지사항 글 삭제하기
	 */
	@Override
	public void deleteBoard(int talkNo) {
		System.out.println("서비스 no: " + talkNo);
		boardDAO.deleteBoard(talkNo);
	}

	/**
	 * 공지사항 글 수정
	 */
	@Override
	public void updateBoard(TalkBoardVO bvo) {
		boardDAO.updateBoard(bvo);
	}

}
