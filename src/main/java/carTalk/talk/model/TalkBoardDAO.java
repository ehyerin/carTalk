package carTalk.talk.model;

import java.util.List;

public interface TalkBoardDAO {

	public  void write(TalkBoardVO bvo);	

	public  List<TalkBoardVO> getBoardList(String pageNo);

	public  TalkBoardVO showContent(int qnaNo);

	public  void deleteBoard(int noticeNo);

	public  void updateBoard(TalkBoardVO bvo);

	public  int totalContent();


}