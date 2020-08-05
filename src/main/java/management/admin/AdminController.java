package management.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import management.domain.Admin;
import management.domain.Expense;
import management.domain.User;
import management.service.AdminService;
import management.service.ExpenseService;
import management.service.LogService;
import management.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {

	static Logger logger = LogManager.getLogger(AdminController.class);

	@Autowired
	UserService userService;
	
	@Autowired 
	AdminService adminService;

	@Autowired
	ExpenseService expenseService;
	
	@Autowired 
	LogService logService;
	
	@Autowired
	ServletContext servletContext;

	@GetMapping("expense")
	public String expense(Model model) throws Exception {
		Expense e = new Expense();
		List<Expense> size = new ArrayList<Expense>();
		for(int i = 0; i < expenseService.list().size(); i++) {
			if(!expenseService.listProcess().get(i).getProcessStatus().equals("승인"))
				size.add(e);
		}
		model.addAttribute("size", size.size());
		model.addAttribute("expense", expenseService.listProcess());
		return "/WEB-INF/admin/expense.jsp";
	}
	
	@GetMapping("detailExpense")
	public String detailExpense(int no, Model model) throws Exception {
		model.addAttribute("expense", expenseService.get(no));
		return "/WEB-INF/admin/expenseDetail.jsp";
	}
	

	
	// 관리자의 요청 처리
	@PostMapping("process")
	public String process(Expense expense, MultipartFile imageFile) throws Exception {
		if (imageFile.getSize() > 0) {
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡ");
			String dirPath = servletContext.getRealPath("/upload/expense");
			String filename = UUID.randomUUID().toString();
			System.out.println(filename + "\n" + dirPath);
			imageFile.transferTo(new File(dirPath + "/" + filename));
			expense.setReceipt(filename);
		}
		expense.setState(1);
		if (expenseService.update(expense) > 0) {
			return "redirect:../admin/detail?no="+expense.getUserNo();
		} else {
			throw new Exception("변경할 게시물 번호가 유효하지 않습니다.");
		}
	}
	
	@GetMapping("detail")
	public String detail(int no, Model model) throws Exception {
		model.addAttribute("user", userService.get(no));
		return "/WEB-INF/admin/user/detail.jsp";
	}
	@GetMapping("logList")
	public String logList(int no, Model model) throws Exception {
		model.addAttribute("lList", logService.get(no));
		return "/WEB-INF/admin/user/logList.jsp";
	}
	@GetMapping("expenseList")
	public String expenseList(int no, Model model) throws Exception {
		model.addAttribute("eList", expenseService.listProcess(no));
		return "/WEB-INF/admin/user/expenseList.jsp";
	}
	@GetMapping("expenseDetail")
	public String expenseDetail(int no, Model model) throws Exception {
		model.addAttribute("expense", expenseService.get(no));
		return "/WEB-INF/admin/user/expenseDetail.jsp";
	}
}


//@RequestMapping("login")
//public String login(String id, String password,
//			HttpServletResponse response, HttpSession session, Model model
//			) throws Exception{
//	Admin admin = adminService.get(id, password);
//	if(admin != null) {
//		session.setAttribute("admin", admin);
//		return "redirect:../admin/list";
//	} else {
//		session.invalidate();
//		return "redirect: ../admin/form";
//	}
//}
//
//@GetMapping("logout")
//public String logout(HttpSession session) throws Exception{
//	session.invalidate();
//	return "redirect:../admin/form";
//}