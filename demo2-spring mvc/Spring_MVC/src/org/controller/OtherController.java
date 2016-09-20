package org.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OtherController {

	/***
	 * 其他的跳转方法，通过String的返回值来跳转页面
	 * @return
	 */
	@RequestMapping("other")
	public String other(){
		return "other";
	}
	
}
