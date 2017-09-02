package board.service;

import java.text.DecimalFormat;

import board.model.*;

public class WriteArticleService {
	
	private static WriteArticleService instance;
	public static WriteArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new WriteArticleService();
		}
		return instance;
	}
	
	public BoardRec write( BoardRec rec ) throws BoardException{
		
		BoardDao dao = BoardDao.getInstance();

		// 그룹번호(group_id) 지정
		int groupId = dao.getGroupId();
		rec.setGroupId(groupId);
		
		// 순서번호(sequence_no) 지정
		DecimalFormat dformat = new DecimalFormat("0000000000");
		rec.setSequenceNo( dformat.format(groupId) + "999999");
		
		// DB에 insert
		int articleId = dao.insert(rec);
		
		// 자동으로 지정된 게시글번호 얻어와서 BoardRec에 지정
		rec.setArticleId(articleId);
		
		return rec;
		
	}
}
