package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	// -------------------------------------------------------------------
	private int totalRecCount; // 전체 레코드 수
	private int pageTotalCount; // 전체 페이지 수
	private int countPerPage = 3; // 한페이지당 레코드 수

	private static ListMessageService instance;

	public static ListMessageService getInstance() throws MessageException {
		if (instance == null) {
			instance = new ListMessageService();
		}
		return instance;
	}

	public List<Message> getMessageList(String pNum) throws MessageException {

		// 페이지 번호에 의해 몇 번째 레코드 부터
		// 몇 번째 레코드까지 인지를 결정.

		// pNum(페이지 번호): 1 2 3 4
		// firstRow: 1 4 7 10
		// endRow: 3 6 9 12

		// 맨 처음 목록보기로 들어온 건 pnum이 없음. 그때는 1번페이지 보고 있음.
		// 데이터 안넘어오면 무조건 1번으로 해두겠다고
/*		if(pNum.equals("numUp")){
			
		}else if(pNum.equals("numDw")){
			
		}*/
		
		int pageNo = 1;
		if (pNum != null)
			pageNo = Integer.parseInt(pNum);

		// int endRow = pageNo * countPerPage;
		// int firstRow = pageNo * countPerPage + 1;

		int firstRow = (pageNo - 1) * countPerPage + 1;
		int endRow = pageNo * countPerPage;

		System.out.println(firstRow);
		System.out.println(endRow);

		// 전체 레코드를 검색해 온다면
		List<Message> mList = MessageDao.getInstance().selectList(firstRow, endRow);
		return mList;
	}

	public int getTotalCount() throws MessageException {

		totalRecCount = MessageDao.getInstance().getTotalCount();
		// 전체 레코드 수에 의한 페이지 수 결정. 한 페이지당 몇개의 글?
		/*
		 * 전체 레코드 수: 9 10 11 12 13 전체 페이지 수: 3 4 4 4 5
		 */
		//pageTotalCount=(int)(Math.ceil(((double)totalRecCount/(double)countPerPage)));
		if (totalRecCount % countPerPage == 0) {
			pageTotalCount = (int) (totalRecCount / countPerPage);
		} else {
			pageTotalCount = (int) (totalRecCount / countPerPage) + 1;
		}

		return pageTotalCount;
	}
}
