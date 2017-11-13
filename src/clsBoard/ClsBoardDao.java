package clsBoard;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface ClsBoardDao {

	List<ClsBoardDataBean> selectClasses(HashMap<String, Object> map);
	int insertClass(ClsBoardDataBean clsBoardDto);
	List<String> selectInstructors();
	ClsBoardDataBean selectClass(HashMap<String, Object> map);
	InstructorDataBean selectInstructor(String ins_name);
	List<ReplyDataBean> selectReplies(String classname);
	int confirmClassstu(HashMap<String, Object> map);
	int insertReply(ReplyDataBean replyDataBean);
	int updateReply(String user_id, String classname, String text);
	int deleteReply(String user_id, String classname);
	int updateRepliesNum(String classname, int replynum);
	int updateClass(HashMap<String, Object> map);
	int deleteReplies(String classname);
	int deleteClass(HashMap<String, Object> map);
	int updateClassStu(HashMap<String, Object> map);
	int insertClasslist(HashMap<String, Object> map);
	int updateClassStudown(HashMap<String, Object> map);
	int deleteClasslist(HashMap<String, Object> map);
	int selectClalistnum(HashMap<String, Object> map);
	int updateClasslistNum(HashMap<String, Object> map);
	int selectClassnames(HashMap<String, Object> map);
	List<ClasslistDataBean> selectClasslist(String user_id);
	List<ClsBoardDataBean> selectBestClasses();
	List<ReplyDataBean> selectRandomReply();
	


}
