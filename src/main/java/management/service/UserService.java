package management.service;

import java.util.HashMap;
import java.util.List;

import management.domain.Criteria;
import management.domain.User;

public interface UserService {

	void add(User User) throws Exception;
	
	List<User> list() throws Exception;
	
	int delete(int no) throws Exception;
	
	int update(User User) throws Exception;
	
	User get(String id) throws Exception;
	
	User get(String id, String password) throws Exception;
	
	User get(int no) throws Exception;
	
	List<User> search(HashMap<String, Object> params) throws Exception;

	List<User> listPage(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
}