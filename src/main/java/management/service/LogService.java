package management.service;

import java.util.List;

import management.domain.Criteria;
import management.domain.Log;

public interface LogService {

	int add(Log log) throws Exception;
	
	int delete(int no) throws Exception;

	List<Log> list() throws Exception;
	
	Log get(int no) throws Exception;
	
	List<Log> listPage(Criteria cri) throws Exception;

	int getTotalCount(Criteria cri) throws Exception;
	
}