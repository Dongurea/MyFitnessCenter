package chat;

import java.util.HashMap;
import java.util.List;
import db.SqlMapClient;

public class ChatDBBean implements ChatDao{

	@Override
	public int selectManagerChatroom(String manager_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("Chat.selectManagerChatroom", manager_id);
	}

	@Override
	public int insertChatroom(String manager_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().insert("Chat.insertChatroom", manager_id);
	}

	@Override
	public ChatDataBean selectChatroomChatroomnum(int chatroomnum) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("Chat.selectChatroomChatroomnum", chatroomnum);
	}

	@Override
	public int insertChat(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().insert("Chat.insertChat", map);
	}

	@Override
	public List<ChatDataBean> selectChat(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList("Chat.selectChat", map);
	}

	@Override
	public int selectChatrooms() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("Chat.selectChatrooms");
	}

	@Override
	public int selectChatroomnum() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("Chat.selectChatroomnum");
	}

	@Override
	public int updateChatroom(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("Chat.updateChatroom", map);
	}

	@Override
	public int deleteChatroom(String manager_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete("Chat.deleteChatroom", manager_id);
	}

}
