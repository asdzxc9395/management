package management.service;

import management.domain.Admin;

public interface AdminService{

	int add(Admin admin) throws Exception;
	
	int update(Admin admin) throws Exception;

	int reset(Admin admin) throws Exception;
	
	Admin get(String id, String password) throws Exception;
}