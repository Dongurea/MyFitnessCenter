package clsBoard;


import java.util.HashMap;
import java.util.List;

import db.SqlMapClient;

public class ClsBoardDBBean implements ClsBoardDao{

	@Override
	public List<ClsBoardDataBean> selectClasses(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "ClsBoard.selectClasses" , map);
	}

	@Override
	public int insertClass(ClsBoardDataBean clsBoardDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().insert("ClsBoard.insertClass", clsBoardDto);
	}

	@Override
	public List<String> selectInstructors() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList("ClsBoard.selectInstructors");
	}

	@Override
	public ClsBoardDataBean selectClass(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("ClsBoard.selectClass", map);
	}

	@Override
	public InstructorDataBean selectInstructor(String insname) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("ClsBoard.selectInstructor", insname);
	}

	@Override
	public List<ReplyDataBean> selectReplies(String classname) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList("ClsBoard.selectReplies", classname);
	}

	@Override
	public int confirmClassstu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("ClsBoard.confirmClassstu", map);
	}

	@Override
	public int insertReply(ReplyDataBean replyDataBean) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().insert("ClsBoard.insertReply", replyDataBean);
	}

	@Override
	public int updateReply(String user_id, String classname, String text) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("classname", classname);
		map.put("text", text);
		return SqlMapClient.getSqlSession().update("ClsBoard.updateReply", map);
	}

	@Override
	public int deleteReply(String user_id, String classname) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("classname", classname);
		return SqlMapClient.getSqlSession().delete("ClsBoard.deleteReply", map);
	}

	@Override
	public int updateRepliesNum(String classname, int replynum) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("classname", classname);
		map.put("replynum", replynum);
		return SqlMapClient.getSqlSession().update("ClsBoard.updateRepliesNum", map);
	}

	@Override
	public int updateClass(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("ClsBoard.updateClass", map);
	}

	@Override
	public int deleteReplies(String classname) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete("ClsBoard.deleteReplies", classname);
	}

	@Override
	public int deleteClass(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete("ClsBoard.deleteClass", map);
	}

	@Override
	public int updateClassStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("ClsBoard.updateClassStu", map);
	}

	@Override
	public int insertClasslist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("ClsBoard.insertClasslist", map);
	}

	@Override
	public int updateClassStudown(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("ClsBoard.updateClassStudown", map);
	}

	@Override
	public int deleteClasslist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete("ClsBoard.deleteClasslist", map);
	}

	@Override
	public int selectClalistnum(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("ClsBoard.selectClalistnum", map);
	}

	@Override
	public int updateClasslistNum(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("ClsBoard.updateClasslistNum", map);
	}

	@Override
	public int selectClassnames(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("ClsBoard.selectClassnames", map);
	}

	@Override
	public List<ClasslistDataBean> selectClasslist(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList("ClsBoard.selectClasslist", user_id);
	}



	@Override
	public List<ClsBoardDataBean> selectBestClasses() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList("ClsBoard.selectBestClasses");
	}

	@Override
	public List<ReplyDataBean> selectRandomReply() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList("ClsBoard.selectRandomReply");
	}

	


}
