package board;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class BoardDBBean implements BoardDao {
		
	public int getCount() {		
		return SqlMapClient.getSqlSession().selectOne( "Board.getCount" );
	}
	
	public int insertArticle( BoardDataBean boardDto ) {
		int num = boardDto.getNum();
		int ref = boardDto.getRef();
		int re_step = boardDto.getRe_step();
		int re_level = boardDto.getRe_level();
			
		String sql = null;
		if( num == 0 ) {
			// 제목글
			int count = getCount();			
			if( count != 0 ) {
				// 글이 있다
				int maxnum = SqlMapClient.getSqlSession().selectOne( "Board.maxNum" );			
				ref = maxnum + 1;	
				// 그룹화아이디 = 글번호최대값 + 1					
			} else {
				// 글이 없다
				ref = 1;
			}
			re_step = 0;
			re_level = 0;				
		} else {
			// 답변글
			SqlMapClient.getSqlSession().update( "Board.updateReply", boardDto );		
			re_step ++;
			re_level ++;				
		}		
	
		boardDto.setRef( ref );
		boardDto.setRe_step( re_step );
		boardDto.setRe_level( re_level );
		return SqlMapClient.getSqlSession().insert( "Board.insertArticle", boardDto );
	}
	
	public List<BoardDataBean> getArticles( Map<String, Integer> map ) {
		return SqlMapClient.getSqlSession().selectList( "Board.getArticles", map );
	}

	public BoardDataBean getArticle( int num ) {
		return SqlMapClient.getSqlSession().selectOne( "Board.getArticle", num );
	}

	public void addCount( int num ) {
		SqlMapClient.getSqlSession().update( "Board.addCount" , num );
	}

	public int check( int num, String passwd ) {
		int result = 0;
		BoardDataBean boardDto = getArticle( num );		
		if( passwd.equals( boardDto.getPasswd() ) ) {
			result = 1;
		} else {
			result = 0;
		}	
		return result;
	}	
	
	public int updateArticle( BoardDataBean boardDto ) {
		return SqlMapClient.getSqlSession().update( "Board.updateArticle", boardDto );
	}
	
	public int deleteArticle( int num ) {
		int result = 0;
		BoardDataBean boardDto = getArticle( num );		
		int cnt = SqlMapClient.getSqlSession().selectOne( "Board.countReply", boardDto );
		if( cnt > 0 ) {
			// 답글이 있는 경우
			result = -1;
		} else {
			// 답글이 없는 경우
			SqlMapClient.getSqlSession().update( "Board.deleteReply", boardDto );
			result = SqlMapClient.getSqlSession().delete( "Board.deleteArticle", num );						
		}
		return result;
	}
	
} // class












