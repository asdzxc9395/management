package management.dao;

import java.util.List;

import management.domain.Criteria;
import management.domain.Log;

public interface LogDao {
	public int insert(Log log) throws Exception;

	public int delete(int no) throws Exception;

	public List<Log> findAll() throws Exception;

	public Log findByNo(int no) throws Exception;

	List<Log> listPage(Criteria cri) throws Exception;

	public int getTotalCount(Criteria cri) throws Exception;
}
