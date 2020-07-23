package management.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import management.dao.UserDao;
import management.domain.Criteria;
import management.domain.User;
import management.service.UserService;

@Component
public class UserServiceImpl implements UserService{
	
	UserDao userDao;
	
	public UserServiceImpl(UserDao usernDao) {
		this.userDao = usernDao;
	}

	@Override
	public void add(User user) throws Exception {
		userDao.insert(user);
	}

	@Override
	public List<User> list() throws Exception {
		return userDao.findAll();
	}

	@Override
	public int delete(int no) throws Exception {
		return userDao.delete(no);
	}

	@Override
	public int update(User user) throws Exception {
		return userDao.update(user);
	}

	@Override
	public User get(String id) throws Exception {
		return userDao.findById(id);
	}

	@Override
	public User get(String id, String password) throws Exception {
	    HashMap<String, Object> params = new HashMap<>();
	    params.put("id", id);
	    params.put("password", password);
	    return userDao.findByIdAndPassword(params);
	}

	@Override
	public User get(int no) throws Exception {
		return userDao.findByNo(no);
	}

	@Override
	public List<User> search(HashMap<String, Object> params) throws Exception {
		return userDao.findByKeyword(params);
	}

	@Override
	public List<User> listPage(Criteria cri) throws Exception {
		return userDao.listPage(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return userDao.getTotalCount(cri);
	}

}
