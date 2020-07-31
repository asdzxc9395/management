package management.admin;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import management.domain.Admin;
import management.service.AdminService;
import management.service.ExpenseService;
import management.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	UserService userService;
	
	@Autowired 
	AdminService adminService;

	@Autowired
	ExpenseService expenseService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("form")
	public String form() {
		return "/WEB-INF/admin/form.jsp";
	}
	
	@PostMapping("update")
	public String update(Admin admin) throws Exception {
		adminService.update(admin);
		return "/WEB-INF/admin/list.jsp";
	}
	
	@PostMapping("reset")
	public String reset(Admin admin) throws Exception {
		adminService.reset(admin);
		return "/WEB-INF/admin/list.jsp";
	}
	
	@RequestMapping("login")
	public String login(String id, String password,
				HttpServletResponse response, HttpSession session, Model model
				) throws Exception{
		Admin admin = adminService.get(id, password);
		if(admin != null) {
			session.setAttribute("admin", admin);
			return "redirect:../admin/list";
		} else {
			session.invalidate();
			return "redirect: ../admin/form";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:../admin/form";
	}
}
