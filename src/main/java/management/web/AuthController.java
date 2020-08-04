package management.web;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import management.domain.Log;
import management.domain.User;
import management.service.LogService;
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
	LogService logService;
	
	@Autowired
	ServletContext servletContext;
	
	static Logger logger = LogManager.getLogger(AuthController.class);
	

	  @RequestMapping("form")
	  public String form(HttpSession session) {
	    User user = (User) session.getAttribute("loginUser");
	    if (user != null) {
	      return "redirect:../expense/list";
	    }
	    return "/WEB-INF/jsp/auth/form.jsp";
	  }

	@SuppressWarnings("unused")
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
		
		String logIn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(System.currentTimeMillis());
		
		if (user != null) {
			Log log = new Log();
			log.setUserNo(user.getUserNo());
			log.setLogIn(logIn);
			logService.add(log);
			session.setAttribute("log", log);
			session.setAttribute("loginUser", user);
			return "redirect:../expense/list";
		} else {
			session.invalidate();
			return "redirect:../auth/form";
		}
	}
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		Log log = (Log) session.getAttribute("log");
		String logOut = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(System.currentTimeMillis());
		log.setLogOut(logOut);
		System.out.println(log);
		logService.update(log);
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


