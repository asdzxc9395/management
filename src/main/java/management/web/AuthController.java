package management.web;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import management.domain.User;
import management.service.MailSendService;
import management.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	private MailSendService mailsender;

	@Autowired
	UserService userService;

	@Autowired
	ServletContext servletContext;
	

	  @RequestMapping("form")
	  public String form(HttpSession session) {
	    User user = (User) session.getAttribute("loginUser");
	    if (user != null) {
	      return "redirect:../clazz/list";
	    }
	    return "/WEB-INF/jsp/auth/form.jsp";
	  }

	@RequestMapping("login")
	public String login(String id, String password, String saveId,
			HttpServletResponse response, HttpSession session, Model model)throws Exception {
		Cookie cookie = new Cookie("id", id);
		session.removeAttribute("loginUser");
		if (saveId != null) {
			cookie.setMaxAge(60 * 60 * 24 * 30);
		} else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		User user = userService.get(id, password);
		
		if (user != null) {
			session.setAttribute("loginUser", user);
			return "redirect:../expense/list";
		} else {
			session.invalidate();
			return "redirect:../auth/form";
		}
	}
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../auth/form";
	}

	@GetMapping(value = "keyalter")
	public String keyalterConfirm(@RequestParam("email") String id, String password,
			@RequestParam("key") String key) throws Exception {
		mailsender.alterUserKey(id, key); // mailsender의 경우 @Autowired
		User user = userService.get(id);
		String userEmail = user.getId();
		System.out.println(userEmail);
		return "redirect:login?id=" + userEmail + "&password=" + password;
	}

	@GetMapping("findPassword")
	public void findPassword(String id, HttpServletResponse response) throws Exception {
		if (userService.get(id) != null) {
			mailsender.findPassword(id);
			response.setStatus(200);
		} else {
			response.setStatus(400);
		}
	}
}


