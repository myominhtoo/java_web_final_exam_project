package student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import student.dao.classes.ClassDAO;
import student.dto.classes.ClassReqDTO;
import student.model.classes.ClassModel;

@Controller
public class ClassController {
	
	@Autowired
	ClassDAO classDAO;
	
	
	@RequestMapping( value = "/registerclass" , method = RequestMethod.GET)
	public ModelAndView classRegisterPage(@ModelAttribute("status") String status,ModelMap model) {
		ClassModel cls = new ClassModel();
		model.addAttribute("status", status);
		ModelAndView modelAndView = new ModelAndView("registerclass","cls",cls);
		return modelAndView;
	}
	
	@RequestMapping( value = "/registerclass" , method = RequestMethod.POST)
	public String classRegister(@ModelAttribute("cls") ClassModel cls , ModelMap model) {
		ClassReqDTO dto = new ClassReqDTO();
		dto.setClassId(cls.getClassId());
		dto.setClassName(cls.getClassName());
		if(classDAO.select(dto).getClassId() != null) {
			model.addAttribute("error", "Duplicate Class Id");
			model.addAttribute("cls", cls);
			return "registerclass";
		}
		
		classDAO.insert(dto);
		model.addAttribute("status", "Successfully Added!" );
		return "redirect:/registerclass";
	}
}
