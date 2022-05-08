package student.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import student.dao.users.UserDAO;
import student.dto.users.UserReqDTO;
import student.dto.users.UserResDTO;
import student.model.users.UserModel;

@Controller
public class UserController {
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping( value = "/" , method = RequestMethod.GET)
	public ModelAndView root() {
		return new ModelAndView("login","user",new UserModel());
	}
	
	@RequestMapping(value = "/login" ,  method = RequestMethod.GET)
	public ModelAndView loginPage(@ModelAttribute("status") String status , ModelMap model) {
		model.addAttribute("status",status);
		return new ModelAndView("login","user",new UserModel());
	}
	
	@RequestMapping(value = "/home" , method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping( value = "/login" , method = RequestMethod.POST)
	public String login(@ModelAttribute("user") @Validated UserModel user , BindingResult bind , HttpServletRequest req , ModelMap model) {
		if(bind.hasErrors()) {
			model.addAttribute("user", user);
			return "login";
		}
		
		UserReqDTO dto = new UserReqDTO();
		dto.setPassword(user.getPassword());
		dto.setUserId(user.getUserId());
		
		UserResDTO result = userDAO.select(dto);
		if(result.getUserId() == null || result.getPassword() == null) {
			model.addAttribute("error","Invalid User!");
			return "login";
		}else {
			if(result.getPassword().equals(user.getPassword())) {
				req.getSession().setAttribute("user", result);
				req.getSession().setAttribute("isLogin",true);
				model.addAttribute("status","Successfully Login!");
				return "home";
			}else {
				model.addAttribute("error", "Password doesn't match!");
				return "login";
			}
		}
	}
	
	@RequestMapping( value = "/logout" , method = RequestMethod.GET)
	public String logout(ModelMap model , HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("user");
		session.removeAttribute("isLogin");
		session.invalidate();
		model.addAttribute("status", "Successfully Logout!");
		return "redirect:/login";
	}
	
	@RequestMapping( value = "/user" , method = RequestMethod.GET )
	public String userPage(ModelMap model) {
		ArrayList<UserResDTO> users = userDAO.selectAll();
		model.addAttribute("users", users);
		model.addAttribute("user",new UserModel());
		return "user";
	}
	
	@RequestMapping( value = "/registeruser" , method = RequestMethod.GET)
	public ModelAndView registerUserPage() {
		return new ModelAndView("registeruser","user",new UserModel());
	}
	
	@RequestMapping( value = "/registeruser" , method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("/registeruser") UserModel user , ModelMap model) {
		
		if(!user.getPassword().equals(user.getComfirmPassword())) {
			model.addAttribute("user",user);
			model.addAttribute("error", "Password doesn't match!");
			return "registeruser";
		}
		
		UserReqDTO dto = new UserReqDTO();
		dto.setPassword(user.getPassword());
		dto.setUserName(user.getUserName());
		dto.setUserId(user.getUserId());
		
		int status = userDAO.insert(dto);
		
		if(status == 0) {
			model.addAttribute("user", user);
			model.addAttribute("error", "Duplicate User!!");
			return "registeruser";
		}
		return "redirect:/user";
	}
	
	//for delete
	@RequestMapping( value = "/deleteuser/{userId}" , method = RequestMethod.GET)
	public String deleteUser(@PathVariable String userId , ModelMap model) {
		UserReqDTO dto = new UserReqDTO();
		dto.setUserId(userId);
		
		int status = userDAO.delete(dto);
		if(status > 0) {
			model.addAttribute("status", "Successfully Deleted!");
		}
		return "redirect:/user";
	}
	
	//for update user
	@RequestMapping( value = "/updateuser/{userId}" , method = RequestMethod.GET)
	public ModelAndView updateUserPage(@PathVariable String userId , ModelMap model) {
		UserReqDTO dto = new UserReqDTO();
		dto.setUserId(userId);
	
		model.addAttribute("user", userDAO.select(dto));
		return new ModelAndView("updateuser","usr",new UserModel());
	}
	
	@RequestMapping( value = "/updateuser" , method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("usr") UserModel user , ModelMap model) {
		if(!user.getPassword().equals(user.getComfirmPassword())) {
			model.addAttribute("error", "Password doesn't match!");
			model.addAttribute("user", user);
			return "updateuser";
		}
		
		UserReqDTO dto = new UserReqDTO();
		dto.setUserId(user.getUserId());
		dto.setUserName(user.getUserName());
		dto.setPassword(user.getPassword());
		int status = userDAO.update(dto);
		
		if(status > 0) {
			model.addAttribute("status", "Successfully Updated!");
		}
		return "redirect:/user";
	}
	
	@RequestMapping( value = "/searchuser" , method = RequestMethod.POST)
	public String searchUser(@ModelAttribute("user") UserModel user , ModelMap model) {
		UserReqDTO dto = new UserReqDTO();
		dto.setUserId(user.getUserId());
		dto.setUserName(user.getUserName());
		
		ArrayList<UserResDTO> users = userDAO.search(dto);
		model.addAttribute( "users" , users);
		return "user";
	}
	

}
