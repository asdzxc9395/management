package management.dao;

import java.util.List;
import java.util.Map;

import management.domain.Criteria;
import management.domain.Expense;

public interface ExpenseDao {
	public int insert(Expense expense) throws Exception;
	
	public int update(Expense expense) throws Exception;
	
	public int delete(int no) throws Exception;
	
	public void checkDelete(Expense expense) throws Exception;
	
	public List<Expense> findAll() throws Exception;
	
	public Expense findByNo(int no) throws Exception;
	
	List<Expense> findByUserNo(int no) throws Exception;
	
	List<Expense> findByKeyword(Map<String, Object> params) throws Exception;
//
	List<Expense> listPage(Criteria cri) throws Exception;
	
	public List<Expense> getTotalCount(int no) throws Exception;
	
}
