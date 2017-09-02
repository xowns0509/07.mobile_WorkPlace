package phonelist;

import java.util.List;

public class PhoneListService_공사중 {

	// -------------------------------------------------------------------
	private int totalRecCount; // 전체 레코드 수
	private int pageTotalCount; // 전체 페이지 수
	private int countPerPage = 3; // 한페이지당 레코드 수

	private static PhoneListService_공사중 instance;

	public static PhoneListService_공사중 getInstance() throws PhoneListException {
		if (instance == null) {
			instance = new PhoneListService_공사중();
		}
		return instance;
	}

	public List<Phone> getPhoneListList(String pNum) throws PhoneListException {

		// 전체 레코드를 검색해 온다면
		List<Phone> mList = PhoneListDao_공사중.getInstance().selectList(firstRow, endRow);
		return mList;
	}

	public int getTotalCount() throws PhoneListException {

		totalRecCount = PhoneListDao_공사중.getInstance().getTotalCount();
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
