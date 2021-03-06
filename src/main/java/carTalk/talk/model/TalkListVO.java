package carTalk.talk.model;


import java.util.List;

import carTalk.common.model.PagingBean;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class TalkListVO {
	private List<TalkBoardVO> list;
	private PagingBean pagingBean;
	
	public TalkListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TalkListVO(List<TalkBoardVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<TalkBoardVO> getList() {
		return list;
	}

	public void setList(List<TalkBoardVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}










