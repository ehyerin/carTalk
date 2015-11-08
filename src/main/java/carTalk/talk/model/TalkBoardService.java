package carTalk.talk.model;




public interface TalkBoardService {
	public  void write(TalkBoardVO bvo);
	public  TalkListVO getBoardList(String pageNo);
	public  TalkBoardVO showContent(int no);	
	public  void deleteBoard(int noticeNo);
	public  void updateBoard(TalkBoardVO bvo);
}