package management.service.impl;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import management.dao.AdminDao;
import management.domain.Admin;
import management.domain.User;
import management.service.AdminService;

@Component
public class AdminServiceImpl implements AdminService{
	
	AdminDao adminDao;
	
	public AdminServiceImpl(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public int add(Admin admin) throws Exception {
		return adminDao.insert(admin);
	}

	@Override
	public int update(Admin admin) throws Exception {
		return adminDao.update(admin);
	}

	@Override
	public int reset(Admin admin) throws Exception {
		return adminDao.reset(admin);
	}

	@Override
	public Admin get(String id, String password) throws Exception {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("password", password);
		return adminDao.findByIdAndPassword(params);
	}

}
