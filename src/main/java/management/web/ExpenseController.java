package management.web;

import java.io.File;
import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import management.domain.Criteria;
import management.domain.Expense;
import management.domain.User;
import management.service.ExpenseService;

@Controller
@RequestMapping("/expense")
public class ExpenseController {

	@Autowired
	ExpenseService expenseService;

	@Autowired
	ServletContext servletContext;


	@GetMapping("form")
	public String form() throws Exception {
		return "/WEB-INF/jsp/expense/form.jsp";
	}

	@GetMapping("list")
	public String list(Criteria cri, Model model, HttpSession session) throws Exception{
		int no = -1;
		 if (session.getAttribute("loginUser") != null) {
		      no = ((User) session.getAttribute("loginUser")).getUserNo();
		    }
		List<Expense> expense = expenseService.list(no);
		
		model.addAttribute("list",expense);

		int usePrice = 0;
		int approvePrice = 0;
		int b = 0;
		for(int i = 0; i < expense.size(); i++) {
			if(expense.get(i).getUsePrice() == null) {
				b = 0;	
			} else {
				b = Integer.parseInt(expense.get(i).getUsePrice());
			}
			usePrice+=b;
		}
		for(int i = 0; i < expense.size(); i++) {
			if(expense.get(i).getApprovePrice() == null) {
				b = 0;	
			} else {
				b = Integer.parseInt(expense.get(i).getApprovePrice());
			}
			approvePrice+=b;
		}
		
		model.addAttribute("size", expenseService.getTotalCount(no).size());
		model.addAttribute("approvePrice", approvePrice);
		model.addAttribute("usePrice", usePrice);

		return "/WEB-INF/jsp/expense/list.jsp";
	}

	@GetMapping("detail")
	public String detail(Criteria cri,int no, Model model) throws Exception {
		model.addAttribute("expense", expenseService.get(no));
		return "/WEB-INF/jsp/expense/detail.jsp";
	}

	@GetMapping("delete")
	public String delete(int no, Model model) throws Exception{
		if (expenseService.delete(no) > 0) { // 삭제했다면,
			return "redirect:list";
		} else {
			throw new Exception("삭제할 회원 번호가 유효하지 않습니다.");
		}
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Expense expense, MultipartFile imageFile, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("loginUser");
		
		if (imageFile.getSize() > 0) {
			String dirPath = servletContext.getRealPath("/upload/expense");
			String filename = UUID.randomUUID().toString();
			imageFile.transferTo(new File(dirPath + "/" + filename));
			expense.setReceipt(filename);
		}
		
		expense.setUserNo(user.getUserNo());
		expenseService.add(expense);
		return "redirect:../expense/list";
	}

	@PostMapping("update")
	public String update(Expense expense, MultipartFile imageFile) throws Exception {
		if (imageFile.getSize() > 0) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡ");
			String dirPath = servletContext.getRealPath("/upload/expense");
			String filename = UUID.randomUUID().toString();
			System.out.println(filename + "\n" + dirPath);
			imageFile.transferTo(new File(dirPath + "/" + filename));
			expense.setReceipt(filename);
		}
		if (expenseService.update(expense) > 0) {
			return "redirect:../expense/list";
		} else {
			throw new Exception("변경할 게시물 번호가 유효하지 않습니다.");
		}
	}

	@GetMapping("search")
	public String search(Expense expense, Model model, Criteria cri
			, HttpServletRequest req) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(123123);
		System.out.println(expense.getRegistrationDate());
		if (expense.getName().length() > 0) {
			map.put("name", expense.getName());
		}

		if (expense.getRegistrationDate() != null) {
			map.put("registrationDate", expense.getRegistrationDate().toString());
		}

		if (expense.getProcessStatus().length() > 0) {
			map.put("processStatus", expense.getProcessStatus());
		}

		List<Expense> list = expenseService.search(map);
		for(int i = 0; i < list.size(); i++) {
			if(list.size() > 5) {
				list.remove(i);
			}
		}
		Collections.reverse(list);
		
		//세션 저장
		HttpSession session = req.getSession();
		session.setAttribute("userNo", list);

		model.addAttribute("size", list.size());
		model.addAttribute("list", list);
		return "/WEB-INF/jsp/expense/search.jsp";
	}

	@RequestMapping(value = "/downloadExcelFile", method =  RequestMethod.POST)
	public String downloadExcelFile(HttpSession session, Expense expense, Model model, Criteria cri) throws Exception {
		int no = -1;
		 if (session.getAttribute("loginUser") != null) {
		      no = ((User) session.getAttribute("loginUser")).getUserNo();
		    }
		List<Expense> list = expenseService.getTotalCount(no);
		SXSSFWorkbook workbook = expenseService.excelFileDownloadProcess(list);
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "기본정보");
		return "excelDownloadView";
	}
	// search검색시 나오는 정보를 다운받을 exceldownloads
	@RequestMapping(value = "/downloadExcelFile2", method =  RequestMethod.POST)
	public String downloadExcelFile2(Expense expense, Model model, Criteria cri
			, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		List<Expense> list = (List<Expense>) session.getAttribute("userNo");
		SXSSFWorkbook workbook = expenseService.excelFileDownloadProcess(list);
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "기본정보");
		return "excelDownloadView";
	}
}

















