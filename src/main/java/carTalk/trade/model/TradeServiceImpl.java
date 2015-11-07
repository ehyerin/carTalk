package carTalk.trade.model;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import carTalk.tradecomment.model.TradeCommentVO;
import carTalk.common.model.PagingBean;



import carTalk.member.model.MemberVO;

@Service
public class TradeServiceImpl implements TradeService {
	@Resource
	private TradeDAO tradeDAO;
	@Resource(name="uploadPath")
	private String path;
	@Resource(name="viewPath")
	private String viewPath;
	
	/**
	 * 이용후기를 등록하고 tradeContent 에 있는 이미지 태그를 추출해 파일을 등록한다.
	 */
	@Override
	public void writeTradeSavingPoint(TradeVO vo) {
		tradeDAO.writeTrade(vo);
		registerFile(vo);
	}
	/**
	 * 이용후기를 수정한다.
	 */
	@Transactional
	@Override
	public void updateTrade(TradeVO vo) {
		tradeDAO.updateTrade(vo);
		registerFile(vo);
	}
	/**
	 * 이용후기를 삭제하고 함께 등록된 사진도 삭제한다.
	 */
	@Transactional
	@Override
	public void deleteTrade(int tradeNo) {
		tradeDAO.deleteTrade(tradeNo);
		tradeDAO.deleteFileByTradeNo(tradeNo);
	}
	/**
	 * 이용후기 페이지로 들어갔을때 
	 * 일반 이용후기를 보여주기위한 메서드 
	 * 해당 페이지에 들어갈 이용후기 리스트를 받아서
	 * 글 번호로 댓글 수와 추천수를 setting하여 페이징빈화함께
	 * ListVO로 리턴한다.
	 */
	@Override
	public ListVO getTradeList(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<TradeVO> list = tradeDAO.getTradeList(pageNo);
		for(int i=0; i<list.size(); i++){
			list.get(i).setTradeCommentCount(tradeDAO.countTradeCommentByTradeNo(list.get(i).getTradeNo()));
			
		}
		int total = tradeDAO.totalContent();
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		ListVO lvo = new ListVO(list, paging);
		return lvo;
	}
	/**
	 * 이용후기 상세보기 메서드
	 */
	
	@Override
	public TradeVO showContent(int no) {
		tradeDAO.updateCount(no);
		return tradeDAO.showContent(no);
	}
	
	/**
	 * 조회수를 증가시키지 않고 글을 보여주는 메서드 
	 */
	
	@Override
	public TradeVO showContentNoHit(int no) {
		return tradeDAO.showContent(no);
	}
	
	/**
	 * 글 번호로 작성된 댓글 목록을 찾아 반환하는 메서드
	 */
	@Override
	public List<TradeCommentVO> getCommentListByTradeNo(int tradeNo) {
		return tradeDAO.getCommentListByTradeNo(tradeNo);
	}
	

	
	/**
	 * 등록하려는 파일의 이름을 변경하고 경로 (절대경로) 를 지정한다.
	 * 관리를 위해 memberId 별로 별도의 디렉토리에 파일을 관리한다.
	 * memberId 에 해당하는 디렉토리가 없을 경우 디렉토리를 생성한다.
	 * 변경되는 파일은 명은 중복을 막기 위해 '아이디_현재시간.확장자' 의 형태로 변경한다.
	 */
	@Override
	public HashMap<String, String> fileNameFomat(MemberVO memberVO, 
			String oriName) throws Exception{
		// 회원 별로 별도의 디렉토리를 생성한다.
		HashMap<String, String> map=new HashMap<String, String>();
		oriName = URLDecoder.decode(oriName, "UTF-8");	
		String destPath = path + memberVO.getMemberId() + "\\";
		File file = new File(destPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		// 등록한 파일의 파일명을 변환한다.
		String fileName = memberVO.getMemberId()+"_"+System.currentTimeMillis() 
				+ oriName.substring(oriName.lastIndexOf("."));
		String filePath = destPath + fileName;
		String fileInfo = "&bNewLine=true";
		fileInfo += "&sFileName=" + fileName;
		fileInfo += "&sFileURL=" + "/ucar/upload/" + memberVO.getMemberId()+ "/" + fileName;
		map.put("filePath", filePath);
		map.put("fileInfo", fileInfo);
		return map;
	}
	
	/**
	 * 파일을 DB 에 등록한다.
	 * tradeNo 를 외래키로 참조하는 파일을 모두 삭제하고
	 * tradeContent 에서 추출된 파일 정보를 이용해 서버에 저장된 경로 (상대경로) 를 DB 에 등록한다.
	 * @param tradeVO
	 */
	@Transactional
	public void registerFile(TradeVO tradeVO){
		tradeDAO.deleteFileByTradeNo(tradeVO.getTradeNo());
		String content=tradeVO.getTradeContent();
		TradeFileVO rfvo=new TradeFileVO();
		rfvo.setTradeNo(tradeVO.getTradeNo());
		List<String> list=convertHtmlimg(content);
		for(String imgUrl : list){			
			String imgName[]=imgUrl.split("/");
			String fileName=imgName[imgName.length-1].toString();
			rfvo.setFilePath(viewPath+tradeVO.getMemberId()+"/"+fileName);
			tradeDAO.registerFile(rfvo);
		}
	}
	
	/**
	 * 이미지 태그를 추출해 파일 경로를 List 로 저장한다.
	 * @param img
	 * @return
	 */
	public static List<String> convertHtmlimg(String img) {
		Pattern nonValidPattern = Pattern
				.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		List<String> result = new ArrayList<String>();
		Matcher matcher = nonValidPattern.matcher(img);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		return result;
	}


}
