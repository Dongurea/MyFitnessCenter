package chat;

import java.util.HashMap;
import java.util.List;

public interface ChatDao {

	int selectManagerChatroom(String manager_id);

	int insertChatroom(String manager_id);

	ChatDataBean selectChatroomChatroomnum(int chatroomnum);

	int insertChat(HashMap<String, Object> map);

	List<ChatDataBean> selectChat(HashMap<String, Object> map);

	int selectChatrooms();

	int selectChatroomnum();

	int updateChatroom(HashMap<String, Object> map);

	int deleteChatroom(String manager_id);

	
}
