package org.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import org.service.*;
import org.entity.*;


@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	//查询所有记录
	@ResponseBody
	@RequestMapping(value = "/queryAll", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String getList() {
		String code = "01";
		String msg = "fail";
		Gson gson = new Gson();
		List<Student> studentList = studentService.queryAll();
		if (studentList != null && studentList.size() > 0) {
			code = "00";
			msg = "success";
		}

		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		responseMap.put("rows", studentList);
		return gson.toJson(responseMap);
	}
	
	//增加一条记录
	@ResponseBody
	@RequestMapping(value = "/addOne", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String addOne(@RequestBody String params) {
		String code = "01";
		String msg = "fail";
		Gson gson = new Gson();
		Student studentParams = gson.fromJson(params, Student.class);
		String callbackResult = studentService.addOne(studentParams);
		if (callbackResult == "success") {
			code = "00";
			msg = "success";
		}
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		return gson.toJson(responseMap);
	}
	
	//更新一条记录
	@ResponseBody
	@RequestMapping(value = "/updateOne", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String updateOne(@RequestBody String params) {
		String code = "01";
		String msg = "fail";
		Gson gson = new Gson();
		Student studentParams = gson.fromJson(params, Student.class);
		String callbackResult = studentService.updateOne(studentParams);
		if (callbackResult == "success") {
			code = "00";
			msg = "success";
		}
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		return gson.toJson(responseMap);
	}
	
	//删除一条记录
	@ResponseBody
	@RequestMapping(value = "/deleteOne", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String deleteOne(@RequestBody String params) {
		String code = "01";
		String msg = "fail";
		Gson gson = new Gson();
		IdEntity idParams = gson.fromJson(params, IdEntity.class);
		String callbackResult = studentService.deleteOne(idParams.getId());
		if (callbackResult == "success") {
			code = "00";
			msg = "success";
		}
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		return gson.toJson(responseMap);
	}
	
}
