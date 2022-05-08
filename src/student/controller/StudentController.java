package student.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import student.dao.classes.ClassDAO;
import student.dao.students.StudentDAO;
import student.dto.classes.ClassResDTO;
import student.dto.students.StudentReqDTO;
import student.dto.students.StudentResDTO;
import student.model.students.StudentModel;

@Controller
public class StudentController {
	@Autowired
	ClassDAO classDAO;
	@Autowired 
	StudentDAO studentDAO;
	
	@RequestMapping( value = "/registerstudent" , method = RequestMethod.GET)
	public ModelAndView studentRegisterPage(@ModelAttribute("status") String status,ModelMap model) {
		model.addAttribute("status", status);
		return new ModelAndView("registerstudent" , "student" , new StudentModel());
	}
	
	@RequestMapping(value = "/registerstudent" , method = RequestMethod.POST)
	public String studentRegister(@ModelAttribute("student") StudentModel student , ModelMap model) {
		StudentReqDTO dto = new StudentReqDTO();
		dto.setStudentId(student.getStudentId());
		
		if(studentDAO.select(dto).getStudentId() != null) {
			model.addAttribute("error", "Duplicate Student Id!");
			model.addAttribute("student", student);
			return "registerstudent";
		}
		
		dto.setClassName(student.getClassName());
		dto.setRegisteredDate(student.getRegisteredDate());
		dto.setStatus(student.getStatus());
		dto.setStudentName(student.getStudentName());
		
		int status = studentDAO.insert(dto);
		if(status > 0) {
			model.addAttribute("status", "Successfully Added!");
		}
		return "redirect:/registerstudent";
	}
	
	@RequestMapping( value = "/student" ,  method = RequestMethod.GET)
	public ModelAndView studentPage(@ModelAttribute("status") String status,ModelMap model) {
		ArrayList<StudentResDTO> students = studentDAO.selectAll();
		model.addAttribute("students", students);
		model.addAttribute("status", status);
		return new ModelAndView("student","student", new StudentModel());
	}
	
	@RequestMapping( value = "/searchstudent" , method = RequestMethod.POST)
	public String searchStudent(@ModelAttribute("student") StudentModel student , ModelMap model) {
		StudentReqDTO dto  = new StudentReqDTO();
		dto.setStudentId(student.getStudentId());
		dto.setClassName(student.getClassName());
		dto.setStudentName(student.getStudentName());
		
		ArrayList<StudentResDTO> students = studentDAO.search(dto);
		model.addAttribute("students", students);
		return "student";
	}
	
	
	@RequestMapping( value = "/updatestudent/{studentId}" , method = RequestMethod.GET)
	public ModelAndView updateStudentPage(@PathVariable String studentId , ModelMap model) {
		StudentReqDTO dto = new StudentReqDTO();
		dto.setStudentId(studentId);
		StudentResDTO student = studentDAO.select(dto);
		
//		model.addAttribute("student", student);
		return new ModelAndView("updatestudent","student",student);
	}
	
	@RequestMapping( value = "/updatestudent" , method = RequestMethod.POST )
	public String updateStudent(@ModelAttribute("student") StudentReqDTO  student , ModelMap model) {
		int status = studentDAO.update(student);
		if(status > 0) {
			model.addAttribute("status", "Successfully Updated!");
		}
		return "redirect:/student";
	}
	
	@RequestMapping( value = "/deletestudent/{studentId}" , method = RequestMethod.GET)
	public String deleteStudent(@PathVariable String studentId , ModelMap model) {
		StudentReqDTO dto = new StudentReqDTO();
		dto.setStudentId(studentId);
		
		int status = studentDAO.delete(dto);
		if(status > 0) {
			model.addAttribute("status", "Successfully Deleted!");
		}
		return "redirect:/student";
	}
	
	
	@ModelAttribute("classes")
	public ArrayList<String> getClasses(){
		ArrayList<String> classes = new ArrayList<>();
		for(ClassResDTO cls : classDAO.selectAll()) {
			classes.add(cls.getClassName());
		}
		return classes;
	}
	
	@ModelAttribute("statuses")
	public String [] getStatuses() {
		String [] statuses = {"Attending","Passed","Failed"};
		return statuses;
	}
}
