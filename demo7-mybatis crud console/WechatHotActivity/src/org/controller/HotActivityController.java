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
public class HotActivityController {
	
	@Autowired
	private HotActivityService hotActivityService;
	
	//查询所有记录
	@ResponseBody
	@RequestMapping(value = "/queryAll", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String getList() {
		String code = "01";
		String msg = "fail";
		Gson gson = new Gson();
		List<HotActivity> hotActivityList = hotActivityService.queryAll();
		if (hotActivityList != null && hotActivityList.size() > 0) {
			code = "00";
			msg = "success";
		}

		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		responseMap.put("rows", hotActivityList);
		return gson.toJson(responseMap);
	}
	
	//增加一条记录
	@ResponseBody
	@RequestMapping(value = "/addOne", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String addOne(@RequestBody String params) {
		String code = "00";
		String msg = "success";
		Gson gson = new Gson();
		HotActivity hotActivityParams = gson.fromJson(params, HotActivity.class);
		hotActivityService.addOne(hotActivityParams);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		return gson.toJson(responseMap);
	}
	
	//更新一条记录
	@ResponseBody
	@RequestMapping(value = "/updateOne", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String updateOne(@RequestBody String params) {
		String code = "00";
		String msg = "success";
		Gson gson = new Gson();
		HotActivity hotActivityParams = gson.fromJson(params, HotActivity.class);
		hotActivityService.updateOne(hotActivityParams);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		return gson.toJson(responseMap);
	}
	
	//删除一条记录
	@ResponseBody
	@RequestMapping(value = "/deleteOne", method = { RequestMethod.POST }, produces = "application/json; charset=UTF-8")
	public String deleteOne(@RequestBody String params) {
		String code = "00";
		String msg = "success";
		Gson gson = new Gson();
		HotActivity hotActivityParams = gson.fromJson(params, HotActivity.class);
		hotActivityService.deleteOne(hotActivityParams);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		return gson.toJson(responseMap);
	}
	
}
