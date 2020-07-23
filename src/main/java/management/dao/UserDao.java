package management.dao;

import java.util.List;
import java.util.Map;

import management.domain.Criteria;
import management.domain.User;

public interface UserDao {
	public int insert(User User) throws Exception;

	public int update(User User) throws Exception;

	public int delete(int no) throws Exception;

	public List<User> findAll() throws Exception;

	public User findByNo(int no) throws Exception;

	public User findById(String id) throws Exception;

	User findByIdAndPassword(Map<String, Object> params) throws Exception;

	List<User> findByKeyword(Map<String, Object> params) throws Exception;
	//
	List<User> listPage(Criteria cri) throws Exception;

	public int getTotalCount(Criteria cri) throws Exception;

}
