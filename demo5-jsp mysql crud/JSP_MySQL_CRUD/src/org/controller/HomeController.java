package org.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.entity.*;
import org.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller 
public class HomeController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("student2")
	public ModelAndView index(){
		List<Student> studentList = studentService.queryAll();
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("rows", studentList);	
		ModelAndView mav = new ModelAndView("student2");
		mav.addObject("result", responseMap);
		return mav;
	}
}
