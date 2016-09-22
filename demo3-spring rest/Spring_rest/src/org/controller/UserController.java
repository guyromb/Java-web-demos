package org.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import org.model.*;

@Controller
public class UserController {
	
	//接受GET请求
	@RequestMapping(value = "/loginget", method = { RequestMethod.GET })
	@ResponseBody
	public String loginget(@RequestParam("name") String name, @RequestParam("password") String password) {
		String code = "00";
		String msg = "success_get";
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg);
		responseMap.put("name", name);
		responseMap.put("password", password);
		return new Gson().toJson(responseMap);
	}
	
	//接受POST请求
	@RequestMapping(value = "/loginpost", method = { RequestMethod.POST })
	@ResponseBody
	public String loginpost(@RequestBody String params) {
		Gson gson = new Gson();
		UserInput userinput = gson.fromJson(params, UserInput.class);
		String code = "00";
		String msg = "success_post";
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("code", code);
		responseMap.put("msg", msg );
		responseMap.put("name", userinput.getName());
		responseMap.put("password", userinput.getPassword());
		return gson.toJson(responseMap);
	}
}
