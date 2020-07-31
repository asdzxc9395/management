package management.dao;

import java.util.Map;

import management.domain.Admin;

public interface AdminDao {
	public int insert(Admin admin) throws Exception;

	public int update(Admin admin) throws Exception;
	
	public int reset(Admin admin) throws Exception;

	Admin findByIdAndPassword(Map<String, Object> params) throws Exception;

}
