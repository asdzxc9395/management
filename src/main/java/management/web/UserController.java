package management.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import management.domain.User;
import management.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	ServletContext servletContext;

	@GetMapping("form")
	public String form() {
		return "/WEB-INF/jsp/user/form.jsp";
	}

	@PostMapping("add")
	public String add(User user, MultipartFile photoFile) throws Exception {

		if(photoFile.getSize() > 0) {
			String dirPath = servletContext.getRealPath("/upload/user");
			String filename = UUID.randomUUID().toString();
			photoFile.transferTo(new File(dirPath + "/" + filename));
			user.setImage(filename);
		}

		if (userService.add(user) > 0) {
			return "redirect:../auth/form";
		} else {
			throw new Exception("회원을 추가할 수 없습니다.");
		}
	}
	
	@GetMapping("delete")
	public String delete(int no) throws Exception {
	    if (userService.delete(no) > 0) { // 삭제했다면,
	        return "redirect:list";
	      } else {
	        throw new Exception("삭제할 회원 번호가 유효하지 않습니다.");
	      } 
	}
	@GetMapping("detail")
	  public void detail(int no, Model model) throws Exception {
	    model.addAttribute("member", userService.get(no));
	  }

	  @GetMapping("list")
	  public void list(Model model) throws Exception {
	    model.addAttribute("list", userService.list());
	  }
	  @PostMapping("update") 
	  public String update(User user, MultipartFile photoFile) throws Exception {
		  if(photoFile.getSize() > 0) {
			  String dirPath = servletContext.getRealPath("/upload/member");
			  String filename = UUID.randomUUID().toString();
			  photoFile.transferTo(new File(dirPath + "/" + filename));
			  user.setImage(filename);
		  }
		  if(userService.update(user) > 0) {
			  return "redirect:../auth/form";
		  } else {
			  throw new Exception("변경할 회원 번호가 유효하지 않습니다.");
		  }
	  }
	
}
