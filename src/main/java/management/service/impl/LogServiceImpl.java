package management.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import management.dao.LogDao;
import management.domain.Criteria;
import management.domain.Log;
import management.service.LogService;

@Component
public class LogServiceImpl implements LogService{
	
	LogDao logDao;
	
	public LogServiceImpl(LogDao logDao) {
		this.logDao = logDao;
	}

	@Override
	public int add(Log log) throws Exception {
		return logDao.insert(log);
	}

	@Override
	public List<Log> list() throws Exception {
		return logDao.findAll();
	}

	@Override
	public int delete(int no) throws Exception {
		return logDao.delete(no);
	}

	@Override
	public List<Log> get(int no) throws Exception {
		return logDao.findByNo(no);
	}

	@Override
	public List<Log> listPage(Criteria cri) throws Exception {
		return logDao.listPage(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return logDao.getTotalCount(cri);
	}
	
	@Override
	public int update(Log log) throws Exception {
		return logDao.update(log);
	}
	
}
